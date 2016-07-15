var keystone = require('keystone');

var City = new keystone.List('City', {sortable:false});

City.add({
	name: {type: String},
	country: {type: String}
});

City.defaultColumns = 'name, country';
City.register();