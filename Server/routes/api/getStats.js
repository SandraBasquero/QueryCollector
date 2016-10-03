var keystone = require('keystone'),
Answer = keystone.list('Answer'),
moment = require('moment'),
fs = require('fs');
var _ = require('underscore');
var async = require('async');


exports = module.exports = function(req, res) {

	console.log("Acces to route: /getStats");

	/*var results = {};
	var sendResults = function() {
		//console.log(results);
		var myJson = JSON.stringify(results);
		console.log(myJson);
		res.send({success: true, workshopList: myJson});
	}*/


  var skel = require('../../public/resources/statsSkel.json');
  var json = {};

  var isInt = function(n) {
  	return Number(n) === n && n % 1 === 0;
  };
	//Transform data numbers to percentajes in json skel
  var normalize = function() {
  	_.each(json, function(city, cityKey) {
  		_.each(city.query, function(theQuery, queryKey) {
  			_.each(theQuery.questions, function(question, questionKey) {
  				_.each(question, function(value, key) {
  					if (!isNaN(parseInt(key)) && question.total > 0) {
  						value = parseFloat(value) / parseFloat(question.total);
  						value = (value * 100);
  						json[cityKey].query[queryKey].questions[questionKey][key] = value;
  					}
  				});
  			});
  		});
  	});
  	res.json(json);
  }


//Fill json skeleton with datas answer
var statsQuery = function(anAnswer, callback) {

	var answerArray = anAnswer.answer.split("-"); //save the answer/s of this question in an array
	var question = json[anAnswer.city].query[anAnswer.queryNumber].questions[anAnswer.questionNumber]; //go to the exact query question
	var currentUser = "";

	//console.log("buscando query "+anAnswer.queryNumber);
	//console.log("buscando question "+anAnswer.questionNumber);

	for (var i = 0; i < answerArray.length; i++) {
		question[answerArray[i]] = question[answerArray[i]] + 1;  //Rise the counter of this answer in skel
		if (anAnswer.queryNumber == 2 && anAnswer.questionNumber == 2) {
			if (currentUser != anAnswer.userID) {
				currentUser = anAnswer.userID;
				question['total'] = question['total'] + 1; //Also rise the total in skel
			}
		} else {
			question['total'] = question['total'] + 1; //Also rise the total in skel
		}
	}


	/* Plan B : dividir las respuestas en array solo en la pregunta mutlichoise -funciona igual que lo de arriba-
	var question = json[anAnswer.city].query[anAnswer.queryNumber].questions[anAnswer.questionNumber];
	 if (anAnswer.queryNumber == 2 && anAnswer.questionNumber == 2) {
	 	console.log("------------asfdasfdasdf--------------");
		var answerArray = anAnswer.answer.split("-");
		for (var i = 0; i < answerArray.length; i++) {
			answerArray[i]
			question[answerArray[i]] = question[answerArray[i]] + 1;
			question['total'] = question['total'] + 1;
		}
	} else {
		question[anAnswer.answer] = question[anAnswer.answer] + 1; //Rise the counter of this answer in skel
		question['total'] = question['total'] + 1; //Also rise the total in skel
	}*/

  callback();
};


//Get all the answers from db
keystone.list('Answer').model.find().exec(function(err, answers) {
	//Group the answers by city
	var groupedAnswers = _.groupBy(answers, function(answer) {
		return answer.city;
	});

	async.eachLimit(_.keys(groupedAnswers), 6, function(key, done) {
	var cities = groupedAnswers[key];
	json[key] = JSON.parse(JSON.stringify(skel)); //add the city name in skel json

	async.eachLimit(cities, 6, function(anAnswer, callback) {
		if (anAnswer.queryNumber == 1 || anAnswer.queryNumber == 2) {
			statsQuery(anAnswer, callback);
		} else {
			console.log('query number unsuported');
			callback();
		}
	}, function() {
		done();
	});
	}, function() {
	normalize(); //Transform data numbers to percentajes in json skel
	});

	});

};
