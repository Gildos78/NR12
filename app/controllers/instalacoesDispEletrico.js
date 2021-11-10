'use strict';
var models = require('../models');
module.exports = function(app){
	var InstalacoesDispEletrico = models.InstalacoesDispEletrico;
	var controller = {};

	controller.listaTodos = function(req, res){
		controller.listaTodos = function(req, res){
		//Capacitacao.findAll().then(
		Capacitacao.all().then(
			function(data){
				res.json({'data':data || [], 'status':'success'});
			}
		);
	};
		models.InstalacoesDispEletrico.all().then(
			function(data){
						res.json({'data':data||[], 'status':'success'});
						}
					).catch(function(erro){
				console.error(erro);
				res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error': erro});
				});
	};

	controller.obtemInstalacoesDispEletrico = function(req, res){
			models.InstalacoesDispEletrico.findOne({
			where: {
				id: req.params.id
			}
		}).then(
			function(data){
				console.error(data.nome);
				if(!data) throw new Error("Instalações e dispositivos elétricos não encontrado");
				res.json({'data':data, 'status':'success'});
			}
		).catch(function(erro){
			console.log(erro);
			res.status(500).json({'status':'error', 'message': erro.message||'Internal Server Error', 'error':erro});
		});
	};

	controller.removeInstalacoesDispEletrico = function(req, res){
		var _id = req.params.id;

		InstalacoesDispEletrico.destroy({where:{"id": _id}}).then(
			function(data){
			res.json({'status':'success', 'message':'Removido com sucesso.', 'data':data});
			}
		).catch(function(erro){
			//console.error(erro);
			res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
		});
	};

	controller.salvaInstalacoesDispEletrico = function(req, res){

		models.InstalacoesDispEletrico.findOne({
			where: {
				nome: req.body.nome
			}
		}).then(function(data){
			 res.status(500).json({'status':'error', 'message':'O Título '+data.nome+' já se encontra cadastrado', 'erro':data});
		}).catch(function(erro){
			//res.status(500).json({'status':'error', 'message': erro.message||'Internal Server Error', 'error':erro});
			InstalacoesDispEletrico.create(req.body).then(function(data){
					res.status(201).json({'status': 'success', 'message':'Salvo com sucesso.', 'data': data});
				}).catch(function(erro){
				  console.error(erro);
					res.status(500).json({'status':'error', 'message':'Internal server error', 'erro':erro});
			});
		});
	};

	controller.updateInstalacoesDispEletrico = function(req, res){
		models.InstalacoesDispEletrico.findOne({where:{nome:req.body.nome}}).then(function(data){
			if(req.body.id == data.id){
				console.log("PARAM ID", req.body.id);
				console.log("DATA ID", data.id);
				console.log("IGUAL");
				models.InstalacoesDispEletrico.update(
					req.body,{fields:['nome', 'descricao'], where:{'id':req.params.id}}
				).then(function(data){
					res.status(201).json({'status':'success', 'message':'Alterado com sucesso.', 'data':data});
				}).catch(function(erro){
					res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
				});
			}

			if(req.body.id != data.id){
				console.log("DIFERENTE");
				res.status(500).json({'status':'error', 'message':'O título '+data.nome+' já se encontra cadastrado', 'erro':data});
			}
		}).catch(function(erro){
			models.InstalacoesDispEletrico.update(
				req.body,{fields:['nome', 'descricao'], where:{'id':req.params.id}}
			).then(function(data){
				//console.log(data);
				//res.end();
				res.json({'status':'success', 'message':'Alterado com sucesso.', 'data':data});
			}).catch(function(erro){
				//console.error(erro);
				res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
			});
		});

	};
 return controller;
};
