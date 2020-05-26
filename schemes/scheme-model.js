const db = require('../data/db-config.js');

function find() {
	return db('schemes');
}

function findById(id) {
	return db('schemes').where({ id }).first();
}

function add(schema) {
	return db('schemes')
		.insert(schema)
		.then((ids) => {
			return findById(ids[0]);
		});
}

function update(changes, id) {
	return db('schemes').where({ id }).update(changes);
}

function remove(id) {
	return db('schemes').where({ id }).del();
}

function findSteps(id) {
	return db('steps')
		.join('schemes as s', 's.id', 'steps.scheme_id')
		.select('steps.step_number', 'steps.instructions')
		.where({ scheme_id: id });
}

module.exports = {
	find,
	findById,
	add,
	update,
	remove,
	findSteps,
};
