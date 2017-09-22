var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('./db');
router.use(bodyParser.urlencoded({ extended: true}));

router.get('/person/de/:name', function(req,res) {
  getPerson(req.params.name,res,'de');
});

router.get('/person/en/:name', function(req,res) {
  getPerson(req.params.name,res,'en');
});
router.get('/person/getAll', function(req,res) {
  let language_identifier = req.query.lang;
  let gender = req.query.gender;
  getAll(res, language_identifier, gender);
});

router.get('/person/random', function(req,res) {

  let language_identifier = req.query.lang;
  let gender = req.query.gender;
  getRandomPerson(res, language_identifier, gender);
});

function getPerson(user_input,res,language_identifier) {
  var p4 = new Promise((resolve, reject) => {

    let query = db.query('SELECT personID FROM person where name_'+language_identifier+' = ?',[user_input], function(err, result) {
      if(result.length==0) {

        let respObj = {};
        respObj.error_message = "No person with such name found.";
        respObj.status = "PERSON_NOT_FOUND";

        res.charset = 'UTF-8';
        res.type('application/json');
        res.status(200).send(JSON.stringify(respObj,null,3));
      }
      else
        resolve(result[0]['personID']);

    });

});

p4.then((personID) => {

  let p1 = new Promise((resolve, reject) => {
    //Retrieve parents - father and mother
    let query = db.query('SELECT * FROM CHILD_PARENT_VIEW_'+language_identifier+' WHERE childID = ?', [personID], function(err, result) {
      resolve(result);
    })
  });

  let p2 = new Promise((resolve, reject) => {
    //Retrieve children - sons and daughters
    let query = db.query('SELECT * FROM CHILD_PARENT_VIEW_'+language_identifier+' WHERE parentID = ?',[personID], function(err, result) {
      resolve(result);
    })
  });


  let p3 = new Promise((resolve, reject) => {
    //Retrieve siblings - brothers and sisters. Will also yield any half siblings.
    db.query('SELECT parentID, parentGender FROM CHILD_PARENT_VIEW_'+language_identifier+' WHERE childID = ?',[personID], function(err, result) {
      let fatherID, motherID;
      if(result.length!=0) {
        for(let parent of result){
          if(parent['parentGender'] == 1)
            fatherID = parent['parentID'];
          else
            motherID = parent['parentID'];
        }
      }

    db.query('SELECT * FROM CHILD_PARENT_VIEW_'+language_identifier+' WHERE (parentID = ? OR parentID = ?) AND childID != ? GROUP BY childID',[fatherID,motherID,personID], function(err, result) {
      resolve(result);
    });
    });

  });

  let p4 = new Promise((resolve, reject) => {
    //Retrieve spouse
    db.query('SELECT * FROM WIFE_HUSBAND_VIEW_'+language_identifier+' WHERE wifeID = ? OR husbandID = ?',[personID, personID], function (err,result) {
      resolve(result);
    });
  });

  Promise.all([p1,p2,p3,p4]).then(values=> {

    let resultParent = values[0];
    let resultChildren = values[1];
    let resultSibling = values[2];
    let resultSpouse = values[3];
    let respObj = {}; //Contains all retrieved relationships

    respObj.personID = personID;
    respObj.name = user_input;
    //p1: Adding father/mother
    if(resultParent.length!=0) {
      for(let parent of resultParent ){
        if(parent['parentGender'] == 1)
            respObj.father = {"personID":parent['parentID'], "name":parent['parentName']};
        else //Must be mother
            respObj.mother = {"personID":parent['parentID'], "name":parent['parentName']};
      }
    }
    //p4: Adding spouse
    if(resultSpouse.length!=0) {
      if(resultSpouse[0]['wifeID'] == personID) { //Spouse is a 'husband'
        let husbandList = [];
        for(let husband of resultSpouse)
          husbandList.push({"personID":husband['husbandID'], "name":husband['husband']});
        respObj.husband = husbandList;
      }
      else {//Spouse is 'wife'
        let wifeList = [];
        for(let wife of resultSpouse)
          wifeList.push({"personID":wife['wifeID'], "name":wife['wife']});
        respObj.wife = wifeList;
      }
    }
    //p2: Adding sons/daughters
    if(resultChildren.length!=0) {
      let sonList = [];
      let daughterList = [];
      for(let child of resultChildren ){
        if(child['childGender'] == 1)
            sonList.push({"personID":child['childID'], "name":child['childName']});
        else //Must be daughter
            daughterList.push({"personID":child['childID'], "name":child['childName']});
      }
      if(sonList.length!=0) respObj.son = sonList;
      if(daughterList.length!=0) respObj.daughter = daughterList;
    }
    //p3 Adding siblings
    if(resultSibling.length!=0) {
      let brotherList = [];
      let sisterList = [];

      for(let sibling of resultSibling ){
        if(sibling['childGender'] == 1)
          brotherList.push({"personID":sibling['childID'], "name":sibling['childName']});
        else //Must be sister
          sisterList.push({"personID":sibling['childID'], "name":sibling['childName']});
      }
      if(brotherList.length!=0) respObj.brother = brotherList;
      if(sisterList.length!=0) respObj.sister = sisterList;
    }
    //p6: adding sister(s)
    res.charset = 'UTF-8';
    res.type('application/json');
    respObj.status = "OK";
    res.status(200).send(JSON.stringify(respObj,null,3));
  })


});
}

function getRandomPerson(res, language_identifier, gender) {
  if(!language_identifier) language_identifier = 'en'; //Defaults to english if no language_identifier provided
  let sql = 'SELECT ' + db.escapeId('name_' + language_identifier) + ' AS name FROM person ';
  if(gender === 'male') sql += 'WHERE gender = 1';
  if(gender === 'female') sql += 'WHERE gender = 2';

  sql +=  ' ORDER BY RAND() LIMIT 1';

  db.query(sql, function(err, result) {
    if(err || result.length == 0) {
      let respObj = {};
      res.charset = 'UTF-8';
      res.type('application/json');
      respObj.error_message = "Query parameters are invalid.";
      respObj.status = "INVALID_PARAMETERS";
      res.status(200).send(JSON.stringify(respObj,null,3));
    }
    else getPerson(result[0]['name'], res, language_identifier);
  });
}
function getAll(res, language_identifier, gender) {
  if(!language_identifier) language_identifier = 'en'; //Defaults to english if no language_identifier provided
  let sql = 'SELECT personID, ' + db.escapeId('name_' + language_identifier) + 'AS name FROM person ';
  if(gender === 'male') sql += 'WHERE gender = 1';
  if(gender === 'female') sql += 'WHERE gender = 2';

  db.query(sql, function(err, result) {
    if(err || result.length == 0) res.status(200).send("Invalid query parameters");
    else {
      let respObj = {}; //JSON object
      let personList = [] //Array
      for(let person of result) {
        personList.push({"personID":person.personID, "name":person.name});
      }
      respObj.persons = personList;
      respObj.totalCount = result.length;
      res.charset = 'UTF-8';
      res.type('application/json');
      respObj.status = "OK";
      res.status(200).send(JSON.stringify(respObj,null,3));

  }
  });
}

module.exports = router;
