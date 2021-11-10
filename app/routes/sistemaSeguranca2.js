'use stricts';

module.exports = function(app) {
	var controller = app.controllers.sistemaSeguranca2;
	
	app.route('/sistemaSeguranca2')
		.get(controller.listaSistemaSeguranca2)
		.post(controller.salvaSistemaSeguranca2);
	
	app.route('/sistemaSeguranca2/:id')
		.get(controller.obtemSistemaSeguranca2)
		.put(controller.updateSistemaSeguranca2)
		.delete(controller.removeSistemaSeguranca2);
};