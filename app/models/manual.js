module.exports = function(sequelize, DataTypes){
	var Manual =  sequelize.define('Manual',{
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
		name:{singular:'manual', plural:'manuais'},
		tableName:'manual',
		classMethods: {
            associate: function(models){
                Manual.belongsToMany(models.Laudo, {through:'ManualLaudo', foreignKey:'manualId'});
            }
        }
		
	});
	return Manual;
};
