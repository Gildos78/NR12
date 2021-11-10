module.exports = function(sequelize, DataTypes){
	var DisposicaoFinal =  sequelize.define('DisposicaoFinal',{
		id: {
			type:DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: 'true'
		},
		nome: {
			type: DataTypes.STRING,
			validate:{
				len:{
					args:[3,45],
					msg: "Título deve ter entre 3 e 45 caracteres."
				}
			}
		},
		descricao: {
			type: DataTypes.STRING,
			validate:{
				len:{
					args:[3,],
					msg: "Descrição deve ter no mínimo 3 caracteres."
				}
			}
		}
	},
	{
		freezeTableName: true,
		timestamps: false,
		name:{singular:'disposicaoFinal', plural:'disposicaoFinais'},
		tableName:'disposicaofinal',
		classMethods: {
            associate: function(models){
                DisposicaoFinal.belongsToMany(models.Laudo, {through:'DisposicaoFinalLaudo', foreignKey:'disposicoesFinaisId'});
            }
        }
		
	});
	return DisposicaoFinal;
};
