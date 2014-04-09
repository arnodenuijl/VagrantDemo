var express = require('express');
var http = require('http');

var app = express();
app.get('/', function (req, res){
   res.send('Welcome to my super nice nodejs app');
});

http.createServer(app).listen(3000, function(){
  console.log('Express server listening on port 3000' );
});
