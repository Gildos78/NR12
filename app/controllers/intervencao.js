'use strict';
var models = require('../models');
module.exports = function(app){

	var Intervencao = models.Intervencao;
	var controller = {};

	controller.listaTodos = function(req, res){
		//Intervencao.findAll().then(
		Intervencao.all().then(
			function(data){
				res.json({'data':data || [], 'status':'success'});
			}
		);
	};

	controller.obtemIntervencao = function(req, res){
		var _id = req.params.id;
		Intervencao.findById(_id).then(
			function(data){
				if(!data) throw new Error("Intervencao não encontrado");
					res.json({'data':data, 'status':'success'});
			}
		).catch(function(erro){
			console.log(erro);

			res.status(404).json({'status':'error', 'message': erro.message||'Internal Server Error', 'error':erro});
		});
	};

	controller.removeIntervencao = function(req, res){
		Intervencao.destroy({where:{"id":req.params.id}}).then(
			function(data){
				//res.end();
				//res.json({'status':'success', 'data':data});
				res.json({'status':'success', 'message': 'Removido com sucesso.'});
			}
		).catch(function(erro){
			console.error(erro);
			res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
		});
	};

	controller.salvaIntervencao = function(req, res){
			models.Intervencao.findOne({where:{nome:req.body.nome}}).then(function(data){
			res.status(500).json({'status':'error', 'message':'A acitação '+data.nome+' já se encontra cadastrada', 'erro':data});
		}).catch(function(erro){
			Intervencao.create(req.body).then(
				function(data){
					res.status(201).json({'status':'success', 'message':'Salvo com sucesso.', 'data':data});
				}
			).catch(function(erro){
				console.error(erro);
				res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
			});
		});
	};

	controller.updateIntervencao = function(req, res){

		 models.Intervencao.findOne({where:{nome: req.body.nome}}).then(function(data){

			if(req.body.id == data.id){

					Intervencao.update(
							req.body,{fields:['nome','descricao'],where:{'id':req.params.id}}
					).then(function(data){
						res.status(201).json({'status':'success', 'message':'Alterado com sucesso.', 'data':data});
					}).catch(function(erro){
				 			res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
					});
					//res.status(201).json({'status':'success', 'message':'Alterado com sucesso.', 'data':data});
			}
			if(req.body.id != data.id){
					res.status(500).json({'status':'error', 'message':'A acitação '+data.nome+' já se encontra cadastrada', 'erro':data});
			}

		 }).catch(function(erro){

					Intervencao.update(
 							req.body,{fields:['nome','descricao'],where:{'id':req.params.id}}
 					).then(function(data){
 						res.status(201).json({'status':'success', 'message':'Alterado com sucesso.', 'data':data});
 					}).catch(function(erro){
 				 			res.status(500).json({'status':'error', 'message':'Internal Server Error', 'error':erro});
 					});
   	 });
	};
	return controller;
};
