'use stricts';

module.exports = function(app) {
	var controller = app.controllers.miparl;
	
	app.route('/miparl')
		.get(controller.listaMiparl)
		.post(controller.salvaMiparl);
	
	app.route('/miparl/:id')
		.get(controller.obtemMiparl)
		.put(controller.updateMiparl)
		.delete(controller.removeMiparl);
};