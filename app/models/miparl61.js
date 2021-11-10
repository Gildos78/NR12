module.exports = function(sequelize, DataTypes){
    var Miparl61 = sequelize.define('Miparl61', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        nome: {
            type: DataTypes.STRING,
            validate:{
                len:{
                    args:[3, 45],
                    msg: "O campo dever ter entre 3 e 45 caracteres."
                }
            }
        },
        descricao: {
            type: DataTypes.STRING,
            allowNull: false,
            validade:{
                len:{
                    args:[3,],
                    msg: "O campo deve ter no minimo 3 caracteres."
                }
            }
        }
        
    },
    {
        freezeTableName: true,
        timestamps: false,
        name: {singular: 'miparl61', plural: 'miparls61'},
        tableName:'miparl61',
        classMethods: {
            associate: function(models){
                Miparl61.belongsToMany(models.Intervencao, {through:'Miparl61Intervencao', foreignKey:'miparl61Id'});
            }
        }
    });

    return Miparl61;

};
