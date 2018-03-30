const nodemailer = require('nodemailer');
const fs = require('fs');

function sendNodeMailer(image, price, linkpay, linkdetail, name, quantity, email,idpro,linkstripe) {
    fs.readFile(__dirname + '/views/mail.ejs', 'utf8', (err, data) => {
        if (err) throw err;
        // console.log(data);
        let dataa = data.replace("{{image}}", image);
        let datab = dataa.replace("{{linkdetail}}", linkdetail);
        let datac = datab.replace("{{dataprice}}", price);
        let datad = datac.replace("{{linkpay}}", linkpay);
        let datae = datad.replace("{{name}}", name);
        let dataf = datae.replace("{{price}}", price);
        let dataj = dataf.replace("{{price}}", price);
        let datag = dataj.replace("{{idpro}}", idpro);
        let datah = datag.replace("{{quantity}}", quantity);
        let datak = datah.replace("{{price}}", price);
        let datal = datak.replace("{{linkstripe}}",linkstripe);

        sendmailacc(datal,email);

    });
}

function sendmailacc(data,email){
    let account = {
        user: "osxunixl@gmail.com",
        pass: "Osxunix97"
    }

    let transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 587,
        secure: false,
        auth: {
            user: account.user,
            pass: account.pass
        }
    });

    let mailOptions = {
        from: '"Congratulation from Auction Web 👻" <admin@auction.com>', // sender address
        to: email, // list of receivers
        subject: 'Congratulation from Auction Web ✔', // Subject line
        text: 'Congratulation ✔', // plain text body
        html: data // html body
    };


    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            return console.log(error);
        }
        console.log('Message sent: %s', info.messageId);
        // Preview only available when sending through an Ethereal account
        // console.log('Preview URL: %s', nodemailer.getTestMessageUrl(info));

        // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>
        // Preview URL: https://ethereal.email/message/WaQKMgKddxQDoou...
    });

    // verify connection configuration
    transporter.verify(function (error, success) {
        if (error) {
            console.log(error);
        } else {
            console.log('Server is ready to take our messages');
        }
    });

}

// sendNodeMailer("iamge",12,"http://localhost:4000/pay","link detail","name pro",
// 3,"htcvtc59@gmail.com","ooooo","http://localhost:4000/paystripe");

module.exports.dataemail = sendNodeMailer;
module.exports.sendmail = sendmailacc;






