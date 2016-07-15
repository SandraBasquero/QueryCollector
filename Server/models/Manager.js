var keystone = require('keystone');
var Types = keystone.Field.Types;

/**
 * Manager Model
 * ==========
 */

var Manager = new keystone.List('Manager');

Manager.add({
	name: { type: Types.Name, required: true, index: true },
	email: { type: Types.Email, initial: true, required: true, index: true },
	password: { type: Types.Password, initial: true, required: true }
}, 'Permissions', {
	isAdmin: { type: Boolean, label: 'Can access Keystone', index: true }
});

// Provide access to Keystone
Manager.schema.virtual('canAccessKeystone').get(function() {
	return this.isAdmin;
});


/**
 * Registration
 */

Manager.defaultColumns = 'name, email, isAdmin';
Manager.register();
