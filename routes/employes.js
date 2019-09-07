var express = require('express')
var router = express.Router()
var mysql = require('mysql')

var connection = require('../db');



//select
router.get('/', function (req, res, next) {

  connection.query('SELECT * from employes  ', function (error, results) {
    if (error) throw error
    var resultArray = Object.values(JSON.parse(JSON.stringify(results)))
    res.render('employes', { employes: resultArray, title: 'Gestion des employés!' })
  })

})

//insert or update

router.post('/', function (req, res) {
  var r = req.body

  var q = ' INSERT INTO employes(idE,nom, prenom,cin,date,fonction,salaire) VALUES (?,?,?,?,CURRENT_TIMESTAMP(),?,?) '
    + ' ON DUPLICATE KEY UPDATE '
    + ' nom=?,prenom=?,cin=?,fonction=?,salaire=? '


  var idVal = r.idE ? r.idE : '0'

  var d = [idVal, r.nom, r.prenom, r.cin, r.fonction, r.salaire,
    r.nom, r.prenom, r.cin, r.fonction, r.salaire]


  var query = mysql.format(q, d)
  console.log(query);
  connection.query(query,
    function (error, results, fields) {
      if (error) throw error
      res.redirect('/employes')
    })
})



router.post('/accept', function (req, res) {
  var r = req.body
  var q = ' INSERT INTO employes(nom, prenom,date,cin,fonction,salaire) VALUES (?,?,CURRENT_TIMESTAMP(),?,?,?) '
  var d = [r.nomE, r.prenomE, r.cin, r.fonction, r.salaire]
  var query = mysql.format(q, d)

  connection.query(query,
    function (error, results, fields) {
      if (error) throw error


      connection.query('delete from  employes where idE = ' + r.idCandidat,
        function (error, results, fields) {
          if (error) throw error
          res.send('<html><body style="padding: 200px"></body><h1 style="color: blue">' +
            'Le candidat a été  recruté(e) avec succées !</h1>' +
            '<h1><a href="http://localhost:5000/listEntretiens">Liste des entretiens</a></h1> </html>')
        })
    })
})




router.post('/delete', function (req, res) {
  var data = req.body

  console.log('delete from  employes where idE = ' + data.idE);
  connection.query('delete from  employes where idE = ' + data.idE,
    function (error, results, fields) {
      if (error) throw error
      res.redirect('/employes')
    })
})


module.exports = router
