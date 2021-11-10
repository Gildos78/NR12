module.exports = function(sequelize, DataTypes){
	var InstalacoesDispEletrico =  sequelize.define('InstalacoesDispEletrico',{
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
		name:{singular:'instalacoesDispEletrico', plural:'instalacoesDispEletricos'},
		tableName:'instalacoesDispEletrico',
		classMethods: {
            associate: function(models){
                InstalacoesDispEletrico.belongsToMany(models.Laudo, {through:'InstalacoesDispEletricoLaudo', foreignKey:'instalacoesDispEletricoId'});
            }
        }
		
	});
	return InstalacoesDispEletrico;
};
