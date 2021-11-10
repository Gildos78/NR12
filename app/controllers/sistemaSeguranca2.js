'use strict';
var models = require('../models');
module.exports = function (app) {

	var controller = {};

	controller.listaSistemaSeguranca2 = function(req, res) {
		models.SistemaSeguranca2.all().then(
			function(data){
				res.json({'data':data||[], 'status':'success'});
			}
		).catch(function(erro){
			console.error(erro);
			res.status(500).json({'status':'error', 'message':'Internal Server Error','error':erro});
		});
	};

	controller.obtemSistemaSeguranca2 = function(req, res){
		models.SistemaSeguranca2.findById(req.params.id).then(
			function(data){
				if(!data) throw new Error("Sistema de seguranca não encontrado");
				res.json({'data':data, 'status':'success'});
			}
		).catch(function(erro){
			res.status(404).json({'status':'error', 'message':erro.message||'Internal Server Error', 'error':erro});
		});
	};

	controller.removeSistemaSeguranca2 = function(req, res){
		models.SistemaSeguranca2.destroy({where:{"id":req.params.id}}).then(
			function(data){
				res.json({'status':'success', 'message':'Removido com sucesso', 'data':data});
			}
		).catch(function(erro){
			console.error(erro);
			res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
		});
	};

	controller.salvaSistemaSeguranca2 = function(req, res){
		models.SistemaSeguranca2.findOne({
			where:{
				nome: req.body.nome
			}
		}).then(function(data){
			res.status(500).json({'status':'error', 'message':'O Sistema de seguranca '+data.nome+' já se encontra cadastrado', 'erro':data});
		}).catch(function(erro){
			models.SistemaSeguranca2.create(req.body).then(
				function(data){
					res.status(201).json({'status':'success', 'message':'Salvo com sucesso.', 'data':data});
				}
			).catch(function(erro){
				res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
			});
		 })
	};

	controller.updateSistemaSeguranca2 = function (req, res){
		models.SistemaSeguranca.findOne({where:{nome:req.body.nome}}).then(function(data){
			if(req.body.id == data.id){
				models.SistemaSeguranca2.update(req.body, {fields:['nome', 'descricao'], where:{'id':req.body.id}}).then(
						function(data){
							res.json({'status':'success', 'message':'Alterado com sucesso.', 'data':data});
						}
					).catch(function(erro){
						console.error(erro);
						res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
					});
			}
			if(req.body.id != data.id){
				res.status(500).json({'status':'error', 'message':'O Sistema de seguranca '+data.nome+' já se encontra cadastrado', 'erro':data});
			}
		}).catch(function(erro){
			models.SistemaSeguranca2.update(req.body, {fields:['nome', 'descricao'], where:{'id':req.body.id}}).then(
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
