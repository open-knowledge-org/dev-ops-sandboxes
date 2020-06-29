var app = require('express')();
var http = require('http').Server(app);

app.get('/', function (req, res) {

    var objToJson = {
        "delay": "1 second"
    };
    res.setHeader('content-type', 'application/json');

    setTimeout(function () {
        res.send(objToJson);
    }, 1000);
});

app.get('/delay/seconds/:seconds', function (req, res) {
    var seconds = req.params.seconds * 1000;
    var objToJson = {
        "delay": seconds + " seconds"
    };
    res.setHeader('content-type', 'application/json');

    setTimeout(function () {
        res.send(objToJson);
    }, seconds);
});

http.listen(8100, function () {
    console.log('Listening on *:8100');
    console.log('Endpoints: ');
    console.log('- [GET] /8100/');
    console.log('- [GET] /8100/delay/seconds/:seconds');
});
