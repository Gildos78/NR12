module.exports = function(sequelize, DataTypes){
	var SistemaSeguranca = sequelize.define('SistemaSeguranca', {
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
		tableName:'sistemaSeguranca',
        classMethods: {
            associate: function(models){
                SistemaSeguranca.belongsToMany(models.Intervencao, {through:'SistemaSegurancaIntervencao', foreignKey:'sistemasegurancaId'});
            }
        }
	});

	return SistemaSeguranca;

};
