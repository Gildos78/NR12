'use strict';
var models = require('../models');
module.exports = function (app) {

	//var Miparl = models.Miparl;
	var controller = {};

	controller.listaMiparl = function(req, res) {
		models.Miparl.all().then(
			function(data){
				res.json({'data':data||[], 'status':'success'});
			}
		).catch(function(erro){
			console.error(erro);
			res.status(500).json({'status':'error', 'message':'Internal Server Error','error':erro});
		});
	};

	controller.obtemMiparl = function(req, res){
		models.Miparl.findById(req.params.id).then(
			function(data){
				if(!data) throw new Error("Miparl não encontrado");
				res.json({'data':data, 'status':'success'});
			}
		).catch(function(erro){
			res.status(404).json({'status':'error', 'message':erro.message||'Internal Server Error', 'error':erro});
		});
	};

	controller.removeMiparl = function(req, res){
		models.Miparl.destroy({where:{"id":req.params.id}}).then(
			function(data){
				res.json({'status':'success', 'message':'Removido com sucesso', 'data':data});
			}
		).catch(function(erro){
			console.error(erro);
			res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
		});
	};

	controller.salvaMiparl = function(req, res){
		models.Miparl.findOne({
			where:{
				nome: req.body.nome
			}
		}).then(function(data){
			res.status(500).json({'status':'error', 'message':'O Miparl '+data.nome+' já se encontra cadastrado', 'erro':data});
		}).catch(function(erro){
			models.Miparl.create(req.body).then(
				function(data){
					res.status(201).json({'status':'success', 'message':'Salvo com sucesso.', 'data':data});
				}
			).catch(function(erro){
					res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
				});
		 })
	};

	controller.updateMiparl = function (req, res){
		models.Miparl.findOne({where:{nome:req.body.nome}}).then(function(data){
			if(req.body.id == data.id){
				models.Miparl.update(req.body, {fields:['nome', 'descricao'], where:{'id':req.body.id}}).then(
						function(data){
							res.json({'status':'success', 'message':'Alterado com sucesso.', 'data':data});
						}
					).catch(function(erro){
						console.error(erro);
						res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
					});
			}
			if(req.body.id != data.id){
				res.status(500).json({'status':'error', 'message':'O Miparl '+data.nome+' já se encontra cadastrado', 'erro':data});
			}
		}).catch(function(erro){
			models.Miparl.update(req.body, {fields:['nome', 'descricao'], where:{'id':req.body.id}}).then(
					function(data){
						res.json({'status':'success', 'message':'Alterado com sucesso.', 'data':data});
					}
				).catch(function(erro){
					console.error(erro);
					res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
				});
		});

	};

	return controller;
};
