var express = require('express');
var app = express();
const UItrigger = require('./routes/UITrigger');

app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(express.static('public'))

app.use('/UI', UItrigger);



var server = app.listen(9293, function () {
   var host = server.address().address
   var port = server.address().port

   console.log("Example app listening at http://localhost:9293", host, port)
})
