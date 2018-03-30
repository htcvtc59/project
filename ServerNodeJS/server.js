var express = require('express');
var app = express();

var server = require("http").Server(app);
var io = require("socket.io")(server);

server.listen(process.env.PORT || 3000);

var db = require('./db');

var MongoOplog = require('mongo-oplog');
const oplog = MongoOplog('mongodb://localhost:27017/local', { ns: 'finaldb.colproduct' })
oplog.tail();

// const oplogbid = MongoOplog('mongodb://localhost:27017/local', { ns: 'finaldb.colbid' })
// oplogbid.tail();

io.on("connection", function (socket) {
    socket.on("port3000", function (data) {
        console.log(data);
    });
    
    oplog.on('op', data => {
        console.log(data);
    });

    oplog.on('insert', doc => {
        socket.emit("admindataproduct", JSON.stringify(doc.o));
        setInterval(db.readDataTimeOut, 1000);
    });

    oplog.on('update', doc => {
        console.log(doc);
    });

    oplog.on('delete', doc => {
        console.log(doc.o._id);
    });

    oplog.on('error', error => {
        console.log(error);
    });

    oplog.on('end', () => {
        console.log('Stream ended');
    });

    oplog.stop(() => {
        console.log('server stopped');
    });



});


// oplogbid.on('op', data => {
//     console.log(data);
// });
// oplogbid.on('insert', doc => {
//     io.sockets.emit("serversendputbid", JSON.stringify(doc.o));
// });
// oplogbid.on('end', () => {
//     console.log('Stream ended');
// });
// oplogbid.stop(() => {
//     console.log('server stopped');
// });



oplog.tail();
oplog.on('op', data => {
    console.log(data);
});

oplog.on('insert', doc => {

    let docdata = [{
        colproduct: doc.o._id + "",
        timebegin: doc.o.timebegin,
        timeend: doc.o.timeend
    }];
    db.readDataTimeOut(docdata);
    setInterval(db.readDataTimeOut, 1000);
});

oplog.on('update', doc => {
    console.log(doc);
});

oplog.on('delete', doc => {
    console.log(doc.o._id);
});

oplog.on('error', error => {
    console.log(error);
});

oplog.on('end', () => {
    console.log('Stream ended');
});

oplog.stop(() => {
    console.log('server stopped');
});
