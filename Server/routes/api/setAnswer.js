var keystone = require('keystone'),
Answer = keystone.list('Answer'),
moment = require('moment'),
fs = require('fs');

exports = module.exports = function(req, res) {

    console.log("Acces to route: /setAnswer");

	//Get data from the app
	var data = (req.method == 'POST') ? req.body : req.query;


  console.log(data);
  
  /*
    //Variables
    var doneControl = 0;

    var insertOrUpdateAnswer = function(data) {
        CCAnswer.model.findOne({workshop: data.workshop, userID: data.userID, caseNumber: data.caseNumber, questionNumber: data.questionNumber}, function(err, result) {
            if( err || !result) {
                //console.log("------- No existía antes -------");
                var newAnswer = CCAnswer.model({
                    workshop: data.workshop,
                    questionAnswered: data.questionAnswered,
                    caseNumber: data.caseNumber,
                    questionNumber: data.questionNumber,
                    answer: data.answer,
                    caseNumber: data.caseNumber,
                    textAnswer: data.textAnswer,
                    userID: data.userID,
                    pending: data.pending
                });

                newAnswer.save(function (err){
                    try {
                        console.log("Data saved successfully");
                        allSaved(true);
                    }
                    catch ( err ) {
                        console.log("Error saving data");
                        console.log(err);
                        allSaved(true);
                    }
                });
            } else {
                //console.log("------- Ya estaba creado -------");
                //Update data
                result.answer = data.answer;
                result.textAnswer = data.textAnswer;
                //Save data updated
                result.save(function(err){
                    try {
                        console.log("Data saved successfully");
                        allSaved(true);
                    }
                    catch ( err ) {
                        console.log("Error saving data");
                        console.log(err);
                        allSaved(true);
                    }
                });
            };
        });
    }*/


    /*//Response back to app
    var allSaved = function(status) {
        doneControl++;
        if (doneControl == data.length) {
            if (status) {
                res.send({success: true});
            };
        }
    }

    //Loop through the json data received with model answers
    if (data.length > 0) {
        for (var it = 0; it < data.length; it++) {
            //console.log(data[it]);
            insertOrUpdateAnswer(data[it]);
        };
    } else {
        res.send({success: false});
    }*/

};
