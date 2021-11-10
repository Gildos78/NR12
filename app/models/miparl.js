module.exports = function(sequelize, DataTypes){
	var Miparl = sequelize.define('Miparl', {
		id: {
			type:DataTypes.INTEGER,
			primaryKey: true
		},
		nome: {
			type:DataTypes.STRING,
			validate: {
				len: {
					args:[3,45],
					msg: "Tamanho deve ter entre 3 e 45 caracteres"
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
		tableName:'miparl',
        classMethods: {
            associate: function(models){
                Miparl.belongsToMany(models.Intervencao, {through:'MiparlIntervencao', foreignKey:'miparlId'});
            }
        }

	});

	return Miparl;

};