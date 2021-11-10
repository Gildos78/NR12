module.exports = function(sequelize, DataTypes){
	var SistemaSeguranca2 = sequelize.define('SistemaSeguranca2', {
		id: {
			type:DataTypes.INTEGER,
			primaryKey: true
		},
		nome: {
			type:DataTypes.STRING,
			validate: {
				len: {
					args:[3,100],
					msg: "Tamanho deve ter entre 3 e 100 caracteres"
				}
			}
		},
		descricao: {
			type: DataTypes.STRING,
			allowNull: true,
			validate: {
				len: {
					args:[3,500],
					msg: "Tamanho deve ter entre 3 e 500 caracteres"
				}
			}
		}
	},
	{
		freezeTableName: true,
		timestamps: false,
		createdAt: false,
		updatedAt: false,
		tableName:'sistemaSeguranca2',
        classMethods: {
            associate: function(models){
				SistemaSeguranca2.belongsToMany(models.Intervencao, {through:'SistemaSeguranca2Intervencao', foreignKey:'sistemaseguranca2Id'});
            }
        }
	});

	return SistemaSeguranca2;

};
