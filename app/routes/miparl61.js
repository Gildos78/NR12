'use strict';

module.exports = function(app){
	var controller = app.controllers.miparl61;


	app.route('/miparl61')
		.get(controller.listaTodos)
		.post(controller.salvaMiparl61);

	app.route('/miparl61/:id')
		.delete(controller.removeMiparl61)
		.get(controller.obtemMiparl61)
		.put(controller.updateMiparl61);

};
