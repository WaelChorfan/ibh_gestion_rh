var express = require('express')
var router = express.Router()
var mysql = require('mysql')
var connection=require('../db');

//select
router.get('/', function (req, res, next) {
  connection.query(' SELECT * from responsables  ', function (error, results) {
    if (error) throw error
    var resultArray = Object.values(JSON.parse(JSON.stringify(results)))
    res.render('responsables', { responsables: resultArray })
  })
})

//insert or update
router.post('/', function (req, res) {
  var r = req.body

  var q=' INSERT INTO responsables(idR,nom,cin,tel) VALUES (?,?,?,?) '
  + ' ON DUPLICATE KEY UPDATE '
  +' nom=?,cin=?,tel=? '


  var idVal= r.idR?r.idR:'0'

  var d=[idVal,r.nom,r.cin,r.tel,
    r.nom,r.cin,r.tel]


var query=mysql.format(q,d)
  console.log(query);
  connection.query(query,
    function (error, results, fields) {
      if (error) throw error
      res.redirect('/responsables')
    })
})



router.post('/delete', function (req, res) {
  var data = req.body

  console.log('delete from  responsables where idR = ' + data.idR);
  connection.query('delete from  responsables where idR = ' + data.idR,
    function (error, results, fields) {
      if (error) throw error
      res.redirect('/responsables')
    })
})


module.exports = router
