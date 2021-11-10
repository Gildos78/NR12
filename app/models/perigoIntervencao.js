module.exports = function(sequelize, DataTypes){
  var PerigoIntervencao = sequelize.define('PerigoIntervencao', {
    
  },
  {
    freezeTableName: true,
    timestamps: false,
    createdAt: false,
    updatedAt: false,
    tableName:'perigointervencao',
    name:{singular:'PerigoIntervencao', plural:'PerigoIntervencoes'},
    classMethods: {
      associate: function(models){
        PerigoIntervencao.hasOne(models.Perigo, {onDelete:'cascade', foreignKey: 'id'});
        PerigoIntervencao.hasOne(models.Intervencao, {onDelete:'cascade', foreignKey: 'id'});
      }
    }
  });
  return PerigoIntervencao;
};
