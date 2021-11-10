'use strict'
var models = require('../models');
module.exports = function(app){
    var Manual = models.Manual;
    var controller = {};

    controller.listaTodos = function(req, res){

        Manual.all().then(
            function(data){
                if(!data) throw new Error("Manual nao encontra")
                res.json({'data': data || [], 'status': 'success'});
            }
        );
    };

    controller.obtemManual = function(req, res){
        var _id = req.params.id;
        Manual.findById(_id).then(
            function(data){
                if(!data) throw new Error('Manual não encontrada');
                res.json({'data': data, 'status': 'success'});
            }
        ).catch(function(erro){
            res.status(500).json({'status':'error', 'message': erro.message || 'Internal server Error', 'error': erro });
        });
    };

    controller.salvaManual = function(req, res){
        models.Manual.findOne({
            where: {
                nome: req.body.nome
            }
        }).then(function(data){
            res.status(500).json({'status':'error', 'message':'O Manual '+data.nome+' já se encontra cadastrado', 'erro':data});
        }).catch(function(erro){
            Manual.create(req.body).then(
                function(data){
                    res.status(201).json({'status': 'success', 'message': 'Salvo com sucesso', 'data': data});
                }
            ).catch(function(erro){
                console.error(erro);
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
        })
    };

    controller.updateManual = function (req, res){
        var _id = req.body.id;
        models.Manual.findOne({where:{nome:req.body.nome}}).then(function(data){
          if(req.body.id == data.id){
            Manual.update(
                req.body,
                {fields:['nome', 'descricao', 'tipo'],where:{'id': _id}}
            ).then(function(data){
                res.json({'status': 'success', 'message': 'Alterado com sucesso.', 'data': data});
            }).catch(function(erro){
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
          }
          if(req.body.id != data.id){
            res.status(500).json({'status':'error', 'message':'O Manual '+data.nome+' já se encontra cadastrado', 'erro':data});
          }
        }).catch(function(erro){
          Manual.update(
              req.body,{fields:['nome', 'descricao', 'tipo'],where:{'id': _id}}
          ).then(function(data){
              res.json({'status': 'success', 'message': 'Alterado com sucesso.', 'data': data});
          }).catch(function(erro){
              res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
          });
        });
    };

    controller.removeManual = function (req, res){
        var _id = req.params.id;

        Manual.destroy({where:{"id": _id}}).then(
            function(data){
                res.json({'status': 'success', 'message': 'Removido com sucesso.', 'data': data});
            }).catch(function(erro){
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
        };
        return controller;
    };
