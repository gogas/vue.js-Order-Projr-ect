var express = require('express');
var router = express.Router();
var db = require('./query')

/* GET users listing. */
router.get('/', function(req, res, next) {

  db.allUsers(req, res, next)

});

module.exports = router;