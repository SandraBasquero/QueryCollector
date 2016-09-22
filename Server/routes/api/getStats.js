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

  					console.log(json[cityKey].query[queryKey].questions[questionKey]);

  				});
  			});
  		});
  	});
    res.json(json);
  }

var statsQuery1 = function(city, nextCity) {
  var question = json[city.city].cases[city.queryNumber].questions[city.questionNumber];

  nextCity();
};


keystone.list('Answer').model.find().exec(function(err, answers) {
  var groupedAnswers = _.groupBy(answers, function(answer) {
			return answer.city;
		});

    async.eachLimit(_.keys(groupedAnswers), 5, function(key, done) {
    var cities = groupedAnswers[key];
    json[key] = JSON.parse(JSON.stringify(skel));

    async.eachLimit(cities, 5, function(city, nextCity) {
      if(city.caseNumber == 1) {
        statsCase1(city, nextCity);
      } else {
        console.log('case number unsuported');
        nextCity();
      }
    }, function() {
      done();
    });
  }, function() {
    normalize();
  });

});

};
