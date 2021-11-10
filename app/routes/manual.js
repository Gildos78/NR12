'use strict';

module.exports = function(app){
	var controller = app.controllers.manual;


	app.route('/manual')
		.get(controller.listaTodos)
		.post(controller.salvaManual);

	app.route('/manual/:id')
		.delete(controller.removeManual)
		.get(controller.obtemManual)
		.put(controller.updateManual);

};
