var keystone = require('keystone'),
Answer = keystone.list('Answer'),
moment = require('moment'),
fs = require('fs');
var _ = require('underscore');
var async = require('async');


exports = module.exports = function(req, res) {

	console.log("Acces to route: /getStats");

	var results = {};
	var sendResults = function() {
		//console.log(results);
		var myJson = JSON.stringify(results);
		res.send({success: true, workshopList: myJson});
	}


  var skel = require('../../public/resources/statsSkel.json');
  var json = {};

  var isInt = function(n) {
  	return Number(n) === n && n % 1 === 0;
  };

  var normalize = function() {
  	_.each(json, function(city, cityKey) {
  		_.each(city.query, function(theQuery, queryKey) {
  			_.each(theQuery.questions, function(question, questionKey) {
  				_.each(question, function(value, key) {

  					//console.log(json[cityKey].query[queryKey].questions[questionKey]);

  				});
  			});
  		});
  	});
    res.json(json);
  }


var statsQuery1 = function(anAnswer, callback) {

	console.log("*****************************");
	console.log(anAnswer.city);
	console.log("-------------------------------");

  var question = json[anAnswer.city].query[anAnswer.queryNumber].questions[anAnswer.questionNumber];
	question[anAnswer.answer] = question[anAnswer.answer] + 1;
	question['total'] = question['total'] + 1;

	console.log(question[anAnswer.answer]);
	console.log(anAnswer.answer);

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
	json[key] = JSON.parse(JSON.stringify(skel));

	async.eachLimit(cities, 6, function(anAnswer, callback) {
		if (anAnswer.queryNumber == 1) {
			statsQuery1(anAnswer, callback);
		} else if (anAnswer.queryNumber == 2) {
			console.log("query 2");
			callback();
		} else {
			console.log('query number unsuported');
			callback();
		}
	}, function() {
		done();
	});
	}, function() {
	normalize();
	});

	});

};
