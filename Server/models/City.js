var keystone = require('keystone');

var City = new keystone.List('City', {sortable:false});

City.add({
	name: {type: String, initial:true},
	country: {type: String, initial:true}
});

City.defaultColumns = 'name, country';
City.register();
