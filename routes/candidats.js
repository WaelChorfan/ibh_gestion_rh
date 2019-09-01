var express = require('express')
var router = express.Router()
var mysql = require('mysql')

var connection = require('../db');



//select
router.get('/', function (req, res, next) {

  connection.query('SELECT * from candidats  ', function (error, resultsC) {
    var resultArrayC = Object.values(JSON.parse(JSON.stringify(resultsC)))

    connection.query('SELECT * from responsables  ', function (error, resultsE) {
      var resultArrayE = Object.values(JSON.parse(JSON.stringify(resultsE)))

      res.render('candidats', { candidats: resultArrayC, responsables: resultArrayE })
    })

  })

})

//insert or update

router.post('/', function (req, res) {
  var r = req.body

  console.log(r)

  var q = ' INSERT INTO candidats(idC,nom, prenom,cin,tel,mail,msg,dateC) VALUES (?,?,?,?,?,?,?,CURRENT_TIMESTAMP()) '
    + ' ON DUPLICATE KEY UPDATE '
    + ' nom=?,prenom=?,cin=?,tel=?,mail=? ,msg=? '


  var idVal = r.idC ? r.idC : '0'

  var d = [idVal, r.nom, r.prenom, r.cin, r.tel, r.mail, r.msg,
    r.nom, r.prenom, r.cin, r.tel, r.mail, r.msg]


  var query = mysql.format(q, d)
  console.log(query);
  connection.query(query,
    function (error, results, fields) {
      if (error) throw error
      res.send('<html><body style="padding: 200px"></body><h1 style="color: greenyellow">' +
        'Votre candidature a été enregistrée avec succées !</h1></html>')
    })
})


router.post('/delete', function (req, res) {
  var data = req.body

  console.log('delete from  candidats where idC = ' + data.idC);
  connection.query('delete from  candidats where idC = ' + data.idC,
    function (error, results, fields) {
      if (error) throw error
      res.redirect('/candidats')
    })
})


module.exports = router
