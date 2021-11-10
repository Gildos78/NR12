'use strict';

module.exports = function(app){
	var controller = app.controllers.instalacoesDispEletrico;


	app.route('/instalacoesDispEletrico')
		.get(controller.listaTodos)
		.post(controller.salvaInstalacoesDispEletrico);

	app.route('/instalacoesDispEletrico/:id')
		.delete(controller.removeInstalacoesDispEletrico)
		.get(controller.obtemInstalacoesDispEletrico)
		.put(controller.updateInstalacoesDispEletrico);

};
