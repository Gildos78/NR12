module.exports = function(sequelize, DataTypes){
	var MiparlIntervencao =  sequelize.define('MiparlIntervencao', {
		
	},
	{
		freezeTableName: true,
		timestamps: false,
		tableName:'miparlintervencao',
		classMethods: {
			associate: function(models){
				MiparlIntervencao.hasOne(models.Intervencao, {onDelete:'cascade', foreignKey: 'id'});
				MiparlIntervencao.hasOne(models.Miparl, {onDelete:'cascade', foreignKey: 'id'});
			}
		}
	});
	return MiparlIntervencao;

};
