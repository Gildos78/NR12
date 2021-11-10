module.exports = function(sequelize, DataTypes){
	var Miparl61Intervencao =  sequelize.define('Miparl61Intervencao', {
		
	},
	{
		freezeTableName: true,
		timestamps: false,
		tableName:'miparl61intervencao',
		classMethods: {
			associate: function(models){
				Miparl61Intervencao.hasOne(models.Intervencao, {onDelete:'cascade', foreignKey: 'id'});
				Miparl61Intervencao.hasOne(models.Miparl61, {onDelete:'cascade', foreignKey: 'id'});
			}
		}
	});
	return Miparl61Intervencao;

};
