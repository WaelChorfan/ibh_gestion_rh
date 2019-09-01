var express = require('express');
var router = express.Router();
var mysql = require('mysql')

var connection = require('../db');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'hello from index' });
});

router.get('/formulaire', function(req, res, next) {
  res.render('formulaire', { title: 'Formulaire de candidature !' });
});


router.get('/admin', function(req, res, next) {
  res.render('admin', { title: 'Espace admin !' });
});


router.post('/entretiens', function(req, res, next) {

  var r = req.body

  console.log(r)

  var q = ' INSERT INTO entretiens(date, commentaire,idR,idC) VALUES (?,?,?,?) '

  var d = [ r.dateE, r.commentaire, r.idR, r.idCEnt]

  var query = mysql.format(q, d)
  console.log(query);
  connection.query(query,
    function (error, results, fields) {
      if (error) throw error
      res.send('<html><body style="padding: 200px"></body><h1 style="color: blue">' +
      'L`entretien  a été planifié enregistrée avec succées !</h1></html>')
    })


});

module.exports = router;
