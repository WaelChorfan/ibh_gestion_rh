var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var employesRouter = require('./routes/employes');
var responsablesRouter = require('./routes/responsables');
var candidatsRouter = require('./routes/candidats');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/employes', employesRouter);
app.use('/responsables', responsablesRouter);
app.use('/candidats', candidatsRouter);
app.use('/formulaire', indexRouter);
app.use('/admin', indexRouter);




var port=5000
app.listen(port,function name() {
  console.log("http://localhost:"+port)
});

module.exports = app;
