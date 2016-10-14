var keystone = require('keystone');
var Types = keystone.Field.Types;

var Answer = new keystone.List('Answer');

Answer.add({
	city: {type: String},
	queryNumber: {type: String},
	questionNumber: {type: String},
	answer: {type: String},
	caseNumber: {type: String},
	textAnswer: {type: String},
	userID: {type: String},
	pending: {type: String} //BOOL
});

Answer.defaultColumns = 'city, queryNumber, questionNumber, answer, textAnswer, userID, pending';
Answer.register();
