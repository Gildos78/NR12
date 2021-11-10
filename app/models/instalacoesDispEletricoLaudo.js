module.exports = function(sequelize, DataTypes){
	var InstalacoesDispEletricoLaudo =  sequelize.define('InstalacoesDispEletricoLaudo', {
		
	},
	{
		freezeTableName: true,
		timestamps: false,
		tableName:'instalacoesDispEletricolaudo',
		classMethods: {
			associate: function(models){
				InstalacoesDispEletricoLaudo.hasOne(models.Laudo, {onDelete:'cascade', foreignKey: 'id'});
				InstalacoesDispEletricoLaudo.hasOne(models.InstalacoesDispEletrico, {onDelete:'cascade', foreignKey: 'id'});
			}
		}
	});
	return InstalacoesDispEletricoLaudo;

};
