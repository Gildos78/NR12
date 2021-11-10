'use strict'
var models = require('../models');
module.exports = function(app){
    var DisposicaoFinal = models.DisposicaoFinal;
    var controller = {};

    controller.listaTodos = function(req, res){

        DisposicaoFinal.all().then(
            function(data){
                if(!data) throw new Error("DisposicaoFinal nao encontra")
                res.json({'data': data || [], 'status': 'success'});
            }
        );
    };

    controller.obtemDisposicaoFinal = function(req, res){
        var _id = req.params.id;
        DisposicaoFinal.findById(_id).then(
            function(data){
                if(!data) throw new Error('DisposicaoFinal não encontrada');
                res.json({'data': data, 'status': 'success'});
            }
        ).catch(function(erro){
            res.status(500).json({'status':'error', 'message': erro.message || 'Internal server Error', 'error': erro });
        });
    };

    controller.salvaDisposicaoFinal = function(req, res){
        models.DisposicaoFinal.findOne({
            where: {
                nome: req.body.nome
            }
        }).then(function(data){
            res.status(500).json({'status':'error', 'message':'O DisposicaoFinal '+data.nome+' já se encontra cadastrado', 'erro':data});
        }).catch(function(erro){
            DisposicaoFinal.create(req.body).then(
                function(data){
                    res.status(201).json({'status': 'success', 'message': 'Salvo com sucesso', 'data': data});
                }
            ).catch(function(erro){
                console.error(erro);
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
        })
    };

    controller.updateDisposicaoFinal = function (req, res){
        var _id = req.body.id;
        models.DisposicaoFinal.findOne({where:{nome:req.body.nome}}).then(function(data){
          if(req.body.id == data.id){
            DisposicaoFinal.update(
                req.body,
                {fields:['nome', 'descricao', 'tipo'],where:{'id': _id}}
            ).then(function(data){
                res.json({'status': 'success', 'message': 'Alterado com sucesso.', 'data': data});
            }).catch(function(erro){
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
          }
          if(req.body.id != data.id){
            res.status(500).json({'status':'error', 'message':'O DisposicaoFinal '+data.nome+' já se encontra cadastrado', 'erro':data});
          }
        }).catch(function(erro){
          DisposicaoFinal.update(
              req.body,{fields:['nome', 'descricao', 'tipo'],where:{'id': _id}}
          ).then(function(data){
              res.json({'status': 'success', 'message': 'Alterado com sucesso.', 'data': data});
          }).catch(function(erro){
              res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
          });
        });
    };

    controller.removeDisposicaoFinal = function (req, res){
        var _id = req.params.id;

        DisposicaoFinal.destroy({where:{"id": _id}}).then(
            function(data){
                res.json({'status': 'success', 'message': 'Removido com sucesso.', 'data': data});
            }).catch(function(erro){
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
        };
        return controller;
    };
