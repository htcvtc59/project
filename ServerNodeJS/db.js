var mongoose = require('mongoose'),
    mongoDB = "mongodb://localhost:27017/finaldb";
var moment = require('moment');
mongoose.connect(mongoDB,
    {
        reconnectInterval: 500,
        autoReconnect: true
    });
mongoose.Promise = global.Promise;
var db = mongoose.connection;
db.on("error", console.error.bind(console, "MongoDB connection error:"));

var colproduct = require("./model/colproduct");
var colbid = require("./model/colbid");
var colclient = require("./model/colclient");

const mailer = require('./mailer');

var Datastore = require('nedb');
var nedb = new Datastore({ filename: __dirname + '/initdb/finaldb.db', autoload: true });

var moment = require('moment');



async function readDataTimeOut(docdata) {

    if (typeof (docdata) !== "undefined") {
        await nedb.insert(docdata, function (err, newDocs) {
            console.log(newDocs);
        });
    }
    await nedb.find({}, (err, docs) => {
        if (docs == null) {
            return;
        }

        for (ele of docs) {
            console.log(ele);

            let data = ele;
            let now = moment().format("YYYY-MM-DD HH:mm:ss a").toString();
            let then = moment(data.timeend)
                .format("YYYY-MM-DD HH:mm:ss a").toString();
            let timedata = moment(then, "YYYY-MM-DD HH:mm:ss a")
                .diff(moment(now, "YYYY-MM-DD HH:mm:ss a")).toString();
            let timeval = Number.parseInt(timedata) / 1000;
            console.log(timeval);
            console.log(now);
            console.log(then);
            if (timeval <= 0) {
                let id = data._id;
                nedb.remove({ _id: id }, {}, function (err, numRemoved) {
                    // numRemoved = 1
                    console.log(numRemoved);
                });
                let idpro = data.colproduct;
                colbid.findOne({ "idproduct": idpro })
                    .sort({ "startprice": -1 })
                    .sort({ "createddate": -1 })
                    .exec()
                    .then((res) => {
                        console.log(res);
                        if (res != null) {

                            let idclient = res.idclient;
                            let _id = res._id;
                            let price = Number.parseInt(res.startprice);

                            colproduct.findById(idpro, (err, doc) => {
                                doc.winner.idwinner = mongoose.Types.ObjectId(idclient);
                                doc.winner.idwinbid = mongoose.Types.ObjectId(_id);
                                doc.winner.pay = 0;

                                doc.status = 3;
                                doc.save();
                                console.log(doc.toJSON());

                                let linkdetail = "http://localhost:8084/servletDetailProduct?detail=" + idpro;
                                let image = "http://localhost:8084" + doc.image;
                                let linkpay = "http://localhost:4000/pay";
                                let name = doc.nameproduct;
                                let quantity = doc.quantity;
                                let linkstripe = "http://localhost:4000/paystripe";

                                colclient.findById(idclient, (err, doc) => {
                                    let email = doc.email.name;
                                    let sellphone = doc.phone.name;
                                    let sellname = doc.name;
                                    let selladdress = doc.address;

                                    mailer.sendmail(`
                                
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Check</title>
</head>
<body>
    
<h1>Please click the following link to : </h1>
<form action="http://localhost:4000/paynow" method="POST">
<input type="hidden" id="name" name="name" value="`+ name + `" />
                    <input type="hidden" id="price" name="price" value="`+ price + `" />
                    <input type="hidden" id="quantity" name="quantity" value="`+ quantity + `" />
                    <input type="hidden" id="linkpay" name="linkpay" value="`+ linkpay + `" />
                    <input type="hidden" id="linkdetail" name="linkdetail" value="`+ linkdetail + `" />
                    <input type="hidden" id="image" name="image" value="`+ image + `" />
                    <input type="hidden" id="email" name="email" value="`+ email + `" />
                    <input type="hidden" id="idpro" name="idpro" value="`+ idpro + `" />
                    <input type="hidden" id="linkstripe" name="linkstripe" value="`+ linkstripe + `" />
                    <input type="hidden" id="sellname" name="sellname" value="`+ sellname + `" />
                    <input type="hidden" id="sellemail" name="sellemail" value="`+ email + `" />
                    <input type="hidden" id="sellphone" name="sellphone" value="`+ sellphone + `" />
                    <input type="hidden" id="selladdress" name="selladdress" value="`+ selladdress + `" />

                    <input type="submit" value="Click Me !" style="background-color: rgb(42, 175, 29);
                    border-radius: 10px;
                    color: #ffffff;
                    padding: 10px;
                    text-align: center;
                    width: 100px;
                    cursor: pointer;" />
</form>
</body>
</html>`, email);

                                });

                            });

                        } else {

                            colproduct.findById(idpro, (err, doc) => {
                                doc.winner.idwinner = null;
                                doc.winner.idwinbid = null;
                                doc.winner.pay = 0;

                                doc.status = 3;
                                doc.save();
                            });

                        }

                    }).catch((err) => { console.log(err); });
            }
        }

    });
}

module.exports.readDataTimeOut = readDataTimeOut;
module.exports.colproduct = colproduct;





