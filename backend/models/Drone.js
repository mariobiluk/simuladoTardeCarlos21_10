const {DataTypes} = require('sequelize')
const db = require('../db/conn')

const Drone = db.define('drone',{
    codDrone:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    modelo:{
        type: DataTypes.STRING,
        allowNull: false
    },
    marca:{
        type: DataTypes.STRING,
        allowNull: false
    },
    numSerie:{
        type: DataTypes.INTEGER,
        allowNull: false
    },
    tipoServico:{
        type: DataTypes.STRING,
        allowNull: false
    },
    idCliente:{
        type: DataTypes.INTEGER,
        allowNull: false,
        references:{
            key: 'codCliente',
            model: 'clientes'
        }
    },
},{
    timestamps: false,
    tableName: 'drones'
})

module.exports = Drone