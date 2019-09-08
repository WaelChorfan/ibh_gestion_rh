var express = require('express')
var router = express.Router()
var mysql = require('mysql')
var multer = require('multer');
var moment = require('moment');
var connection = require('../db');

// multer's storage strategy 
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './public/pdf/')
  },
  filename: function (req, file, cb) {
    var newDate = new Date().toLocaleString().replace(/:/g, '-').replace(/,/g, '-')
      .replace(/ /g, '').replace("/", ".").replace("/", ".").replace("/", ".")

    cb(null, moment().format('YYYY-MM-DD-h-mm-ss-') + file.originalname)
  }
})

const upload = multer({ storage: storage })


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

router.post('/', upload.single('cv'), function (req, res) {
  var r = req.body



  var cv = null
  if (req.file) { cv = req.file.filename }
  console.log(cv);

  var q = ' INSERT INTO candidats(idC,nom, prenom,cin,tel,mail,msg,dateC,cv) VALUES (?,?,?,?,?,?,?,CURRENT_TIMESTAMP(),?) '
    + ' ON DUPLICATE KEY UPDATE '
    + ' nom=?,prenom=?,cin=?,tel=?,mail=? ,msg=?,cv=? '


  var idVal = r.idC ? r.idC : '0'

  var d = [idVal, r.nom, r.prenom, r.cin, r.tel, r.mail, r.msg, cv,
    r.nom, r.prenom, r.cin, r.tel, r.mail, r.msg, cv]


  var query = mysql.format(q, d)
  console.log(query);
  connection.query(query,
    function (error, results, fields) {
      if (error) throw error
      res.render('index',{msg: 'Votre candidature a été enregistrée avec succées !',title:'Gestion RH ADMIN'})
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
