const {DataTypes} = require('sequelize')
const db = require('../db/conn')

const Agendamento = db.define('agendamento',{
    codAgendamento:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    data:{
        type: DataTypes.DATEONLY,
        allowNull: false
    },
    hora:{
        type: DataTypes.TIME,
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
    idDrone:{
        type: DataTypes.INTEGER,
        allowNull: false,
        references:{
            key: 'codDrone',
            model: 'drones'
        }
    },
},{
    timestamps: false,
    tableName: 'agendamentos'
})

module.exports = Agendamento