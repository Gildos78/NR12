'use strict';

module.exports = function(app){
	var controller = app.controllers.disposicaoFinal;


	app.route('/disposicaoFinal')
		.get(controller.listaTodos)
		.post(controller.salvaDisposicaoFinal);

	app.route('/disposicaoFinal/:id')
		.delete(controller.removeDisposicaoFinal)
		.get(controller.obtemDisposicaoFinal)
		.put(controller.updateDisposicaoFinal);

};
