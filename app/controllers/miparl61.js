'use strict'
var models = require('../models');
module.exports = function(app){
    var Miparl61 = models.Miparl61;
    var controller = {};

    controller.listaTodos = function(req, res){

        Miparl61.all().then(
            function(data){
                if(!data) throw new Error("M.I.P.A.R.L 6.1 nao encontra")
                res.json({'data': data || [], 'status': 'success'});
            }
        );
    };

    controller.obtemMiparl61 = function(req, res){
        var _id = req.params.id;
        Miparl61.findById(_id).then(
            function(data){
                if(!data) throw new Error('M.I.P.A.R.L 6.1 não encontrada');
                res.json({'data': data, 'status': 'success'});
            }
        ).catch(function(erro){
            res.status(500).json({'status':'error', 'message': erro.message || 'Internal server Error', 'error': erro });
        });
    };

    controller.salvaMiparl61 = function(req, res){
        models.Miparl61.findOne({
            where: {
                nome: req.body.nome
            }
        }).then(function(data){
            res.status(500).json({'status':'error', 'message':'O M.I.P.A.R.L 6.1 '+data.nome+' já se encontra cadastrado', 'erro':data});
        }).catch(function(erro){
            Miparl61.create(req.body).then(
                function(data){
                    res.status(201).json({'status': 'success', 'message': 'Salvo com sucesso', 'data': data});
                }
            ).catch(function(erro){
                console.error(erro);
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
        })
    };

    controller.updateMiparl61 = function (req, res){
        var _id = req.body.id;
        models.Miparl61.findOne({where:{nome:req.body.nome}}).then(function(data){
          if(req.body.id == data.id){
            Miparl61.update(
                req.body,
                {fields:['nome', 'descricao', 'tipo'],where:{'id': _id}}
            ).then(function(data){
                res.json({'status': 'success', 'message': 'Alterado com sucesso.', 'data': data});
            }).catch(function(erro){
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
          }
          if(req.body.id != data.id){
            res.status(500).json({'status':'error', 'message':'O M.I.P.A.R.L 6.1'+data.nome+' já se encontra cadastrado', 'erro':data});
          }
        }).catch(function(erro){
          Miparl61.update(
              req.body,{fields:['nome', 'descricao', 'tipo'],where:{'id': _id}}
          ).then(function(data){
              res.json({'status': 'success', 'message': 'Alterado com sucesso.', 'data': data});
          }).catch(function(erro){
              res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
          });
        });
    };

    controller.removeMiparl61 = function (req, res){
        var _id = req.params.id;

        Miparl61.destroy({where:{"id": _id}}).then(
            function(data){
                res.json({'status': 'success', 'message': 'Removido com sucesso.', 'data': data});
            }).catch(function(erro){
                res.status(500).json({'status': 'error', 'message': 'Internal Server Error', 'error': erro});
            });
        };
        return controller;
    };
