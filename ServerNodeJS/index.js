var express = require('express');
var bodyParser = require('body-parser');
var urlencodeParser = bodyParser.urlencoded({ extended: true });
const ejs = require('ejs');
const paypal = require('paypal-rest-sdk');
var app = express();
app.set('view engine', 'ejs');
app.set('views', './views');
const fs = require('fs');



var server = require("http").Server(app);
var io = require("socket.io")(server);
server.listen(process.env.PORT || 4000);
var db = require('./db');
const mailer = require('./mailer');


paypal.configure({
    'mode': 'sandbox', //sandbox or live
    'client_id': 'AclOixRYgQMTEiQ9qQB4nurJowWLi0HWTAMEofYeSj7xQmjPSNQUb9gVckCwUkFDghWQPBGpQbMzP7v6',
    'client_secret': 'EFByM-6Q1Blmnxzz7NZJWUDzaPLMotkvZBuDKxND1IxPy_TlYU-mY2LDDieKtt9ykJcm0VdQIKSqTUzC',
    'headers': {
        'custom': 'header'
    }
});


var paymentobj = {
    name: "",
    price: 0.00,
    quantity: 0,
    idpro: ""
}


app.post('/pay', urlencodeParser, (req, res) => {

    var name = req.body.name;
    var price = req.body.price;
    var quantity = req.body.quantity;
    var idpro = req.body.idpro;

    paymentobj.name = name;
    paymentobj.price = price;
    paymentobj.quantity = quantity;
    paymentobj.idpro = idpro;

    var create_payment_json = {
        "intent": "authorize",
        "payer": {
            "payment_method": "paypal"
        },
        "redirect_urls": {
            "return_url": "http://localhost:4000/success",
            "cancel_url": "http://localhost:4000/cancel"
        },
        "transactions": [{
            "item_list": {
                "items": [{
                    "name": name,
                    "sku": "item",
                    "price": price,
                    "currency": "USD",
                    "quantity": 1
                }]
            },
            "amount": {
                "currency": "USD",
                "total": price
            },
            "description": "This is the payment description."
        }]
    };


    paypal.payment.create(create_payment_json, function (error, payment) {
        if (error) {
            console.log(error.response);
            throw error;
        } else {
            for (var index = 0; index < payment.links.length; index++) {
                //Redirect user to this endpoint for redirect url
                if (payment.links[index].rel === 'approval_url') {
                    res.redirect(payment.links[index].href);
                }
            }
        }
    });



});

app.get('/success', (req, res) => {
    var payerId = req.query.PayerID;
    var paymentId = req.query.paymentId;

    var execute_payment_json = {
        "payer_id": payerId,
        "transactions": [{
            "amount": {
                "currency": "USD",
                "total": paymentobj.price
            }
        }]
    };

    paypal.payment.execute(paymentId, execute_payment_json, function (error, payment) {
        if (error) {
            console.log(error.response);
            throw error;
        } else {
            console.log("Get Payment Response");
            console.log(JSON.stringify(payment));
            db.colproduct.findById(paymentobj.idpro, (err, doc) => {
                doc.winner.pay = 1;
                doc.save();
            });
            res.send("success");
        }
    });
});

app.get('/cancel', (req, res) => {
    res.send("cancel");
});

var stripe = require("stripe")("sk_test_8hzWYGE96PtV4vnZNFImFFzM");

var obje = {
    price: 0,
    idpro: ""
}

app.post("/paynow", urlencodeParser, (req, res) => {

    var image = req.body.image;
    var linkdetail = req.body.linkdetail;
    var price = req.body.price;
    var name = req.body.name;
    var idpro = req.body.idpro;
    var quantity = req.body.quantity;
    var linkpay = req.body.linkpay;
    var linkstripe = req.body.linkstripe;
    var sellname = req.body.sellname;
    var sellemail = req.body.sellemail;
    var sellphone = req.body.sellphone;
    var selladdress = req.body.selladdress;

    obje.price = price;
    obje.idpro = idpro;

    res.render("mail", {
        image: image,
        linkdetail: linkdetail,
        dataprice: price,
        linkpay: linkpay,
        name: name,
        idpro: idpro,
        quantity: quantity,
        linkstripe: linkstripe,
        sellname: sellname,
        sellemail: sellemail,
        sellphone: sellphone,
        selladdress: selladdress
    });

});


app.post("/paystripe", urlencodeParser, (req, res) => {
    var token = req.body.stripeToken;

    stripe.charges.create({
        amount: obje.price * 100,
        currency: "usd",
        description: "Auction charge",
        source: token,
    }, function (err, charge) {
        if (err && err.type === "StripeCardError") {
            console.log(err + "");
        }
    });
    db.colproduct.findById(obje.idpro, (err, doc) => {
        doc.winner.pay = 1;
        doc.save();
    });
    res.send("success");
});

var MongoOplog = require('mongo-oplog');
var oplogbid = MongoOplog('mongodb://localhost:27017/local', { ns: 'finaldb.colbid' })
oplogbid.tail();

io.on("connection", function (socket) {
    socket.on("port4000", function (data) {
        console.log(data);
    });


});

oplogbid.on('op', data => {
    console.log(data);
});
oplogbid.on('insert', doc => {
    io.sockets.emit("serversendputbid", JSON.stringify(doc.o));
});
oplogbid.on('end', () => {
    console.log('Stream ended');
});
oplogbid.stop(() => {
    console.log('server stopped');
});
