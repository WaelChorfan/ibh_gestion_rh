var express = require('express');
var router = express.Router();
var mysql = require('mysql')

var connection = require('../db');

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Gestion RH ADMIN',msg:'' });
});

router.get('/formulaire', function (req, res, next) {
  res.render('formulaire', { title: 'Formulaire de candidature !' });
});


router.get('/admin', function (req, res, next) {
  res.render('admin', { title: 'Espace admin !' });
});

router.get('/listEntretiens', function (req, res, next) {
 
  
  //affichage de date entretien ,commentaire, nom responsable , nom  candidat , telechargement cv 
  var query = 
 " SELECT responsables.nom as nomR,  entretiens.date as dateE , "+
 " entretiens.commentaire as com, "+
 " candidats.prenom as prenomC , candidats.nom as nomC  "+
 " , candidats.mail as mailC ,candidats.cv as cv  , entretiens.idC as idCandidat"+
 " from entretiens "+
 " INNER JOIN responsables "+
 " ON entretiens.idR = responsables.idR  "+
 " INNER JOIN candidats "+
 " ON entretiens.idC = candidats.idC "+
 " where entretiens.date > CURRENT_TIMESTAMP()"
console.log(query);
  connection.query(query,
    function (error, results, fields) {
      if (error) throw error
      var resultArray = Object.values(JSON.parse(JSON.stringify(results)))
      res.render('listEntretiens', { title: 'Espace Responsable !',listEntretiens: resultArray});
    })


});



router.post('/entretiens', function (req, res, next) {

  var r = req.body

  console.log(r)

  var q = ' INSERT INTO entretiens(date, commentaire,idR,idC) VALUES (?,?,?,?) '

  var d = [r.dateE, r.commentaire, r.idR, r.idCEnt]

  var query = mysql.format(q, d)
  console.log(query);
  connection.query(query,
    function (error, results, fields) {
      if (error) throw error

      res.render('index',{msg: 'L`entretien  a été planifié enregistrée avec succées !!',title:'Gestion RH ADMIN'})

    })


});

module.exports = router;
