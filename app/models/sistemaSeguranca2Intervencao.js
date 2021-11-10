module.exports = function(sequelize, DataTypes){
	var SistemaSeguranca2Intervencao =  sequelize.define('SistemaSeguranca2Intervencao', {
		
	},
	{
		freezeTableName: true,
		timestamps: false,
		tableName:'sistemaseguranca2intervencao',
		classMethods: {
			associate: function(models){
				SistemaSeguranca2Intervencao.hasOne(models.Intervencao, {onDelete:'cascade', foreignKey: 'id'});
				SistemaSeguranca2Intervencao.hasOne(models.SistemaSeguranca2, {onDelete:'cascade', foreignKey: 'id'});
			}
		}
	});
	return SistemaSeguranca2Intervencao;

};
