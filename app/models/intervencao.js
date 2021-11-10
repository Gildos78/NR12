module.exports = function(sequelize, DataTypes){
	var Intervencao =  sequelize.define('Intervencao',{
		id: {
			type:DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true
		},
		intervencao:{
			type:DataTypes.STRING
		},
		
		fotoit01: {
			type: DataTypes.STRING
		}
	},
	{
		freezeTableName: true,
		timestamps: false,
		createdAt: false,
		updatedAt: false,
		name:{singular:'intervencao', plural:'intervencoes'},
		tableName:'intervencao',
		classMethods: {
			associate: function(models){
				Intervencao.belongsTo(models.Laudo, {foreignKey:'laudoId', targetKey:'id'});
				Intervencao.belongsToMany(models.Perigo, {through:'PerigoIntervencao', foreignKey:'intervencaoId'});
				Intervencao.belongsToMany(models.Risco, {through:'RiscoIntervencao', foreignKey:'intervencaoId'});
				Intervencao.belongsToMany(models.Miparl, {through:'MiparlIntervencao', foreignKey:'intervencaoId'});
				Intervencao.belongsToMany(models.Miparl61, {through:'Miparl61Intervencao', foreignKey:'intervencaoId'});
				Intervencao.belongsToMany(models.SistemaSeguranca, {through:'SistemaSegurancaIntervencao', foreignKey:'intervencaoId'});
				Intervencao.belongsToMany(models.SistemaSeguranca2, {through:'SistemaSeguranca2Intervencao', foreignKey:'intervencaoId'});
				
			}
		}
	});
	
	return Intervencao;
};
