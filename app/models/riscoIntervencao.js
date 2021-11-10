module.exports = function(sequelize, DataTypes){
  var RiscoIntervencao = sequelize.define('RiscoIntervencao',{

  },
  {
   freezeTableName: true,
   timestamps: false,
   createdAt: false,
   updatedAt: false,
   name:{singular:'riscoIntervencao', plural:'riscoIntervencoes'},
   tableName:'riscointervencao',
   classMethods: {
     associate: function(models){
       RiscoIntervencao.hasOne(models.Intervencao, {onDelete:'cascade', foreignKey: 'id'});
       RiscoIntervencao.hasOne(models.Risco, {onDelete:'cascade', foreignKey: 'id'});
     }
   }
  });
  return RiscoIntervencao;
};
