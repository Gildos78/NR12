module.exports = function(sequelize, DataTypes){
	var DisposicaoFinalLaudo =  sequelize.define('DisposicaoFinalLaudo', {
		
	},
	{
		freezeTableName: true,
		timestamps: false,
		tableName:'disposicaofinallaudo',
		classMethods: {
			associate: function(models){
				DisposicaoFinalLaudo.hasOne(models.Laudo, {onDelete:'cascade', foreignKey: 'id'});
				DisposicaoFinalLaudo.hasOne(models.DisposicaoFinal, {onDelete:'cascade', foreignKey: 'id'});
			}
		}
	});
	return DisposicaoFinalLaudo;

};
