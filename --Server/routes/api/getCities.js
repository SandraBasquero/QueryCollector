var keystone = require('keystone'),
    City = keystone.list('City'),
    moment = require('moment'),
    fs = require('fs');

    exports = module.exports = function(req, res) {

    console.log("Acces to route: /getCities");

    var citiesCollection = {};

    var sendWorkshops = function() {
        //console.log(citiesCollection);
        var myJson = JSON.stringify(citiesCollection);
        res.send({success: true, citiesList: myJson});
    };

    City.model.find({})
    .sort({name: 1})
    .exec(function(err, docs) {
        if (!err) {
            for (var i = 0; i < docs.length; i++) {
                //console.log(docs[i].name);
                citiesCollection['city'+(i+1)] = docs[i].name;
            }
            sendWorkshops();
        } else {
            res.send({success: false});
            throw err;
        }
    });

};