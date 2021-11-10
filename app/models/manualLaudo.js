module.exports = function(sequelize, DataTypes){
	var ManualLaudo =  sequelize.define('ManualLaudo', {
		
	},
	{
		freezeTableName: true,
		timestamps: false,
		tableName:'manuallaudo',
		classMethods: {
			associate: function(models){
				ManualLaudo.hasOne(models.Laudo, {onDelete:'cascade', foreignKey: 'id'});
				ManualLaudo.hasOne(models.Manual, {onDelete:'cascade', foreignKey: 'id'});
			}
		}
	});
	return ManualLaudo;

};
