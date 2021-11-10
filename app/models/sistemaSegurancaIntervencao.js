module.exports = function(sequelize, DataTypes){
	var SistemaSegurancaIntervencao =  sequelize.define('SistemaSegurancaIntervencao', {
		
	},
	{
		freezeTableName: true,
		timestamps: false,
		tableName:'sistemasegurancaintervencao',
		classMethods: {
			associate: function(models){
				SistemaSegurancaIntervencao.hasOne(models.Intervencao, {onDelete:'cascade', foreignKey: 'id'});
				SistemaSegurancaIntervencao.hasOne(models.SistemaSeguranca, {onDelete:'cascade', foreignKey: 'id'});
			}
		}
	});
	return SistemaSegurancaIntervencao;

};
