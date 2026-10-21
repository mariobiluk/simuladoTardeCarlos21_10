const Drone = require('../models/Drone')
const Cliente = require('../models/Cliente')
const cryptoJs = require('crypto-js')
const CHAVE_SECRETA = 'segredo'

const cadastrar = async (req, res) => {
    const valores = req.body

    if (!valores.modelo || !valores.marca || !valores.numSerie || !valores.tipoServico || !valores.idCliente) {
        return res.status(400).json({ message: 'Preencha todos os campos!' })
    }

    try {
        const cliente = await Cliente.findByPk(id)
        if(!cliente){
            return res.status(400).json({message: 'Cliente informado inexistente!'})
        }


        const numSerieCripto = cryptoJs.AES.encrypt(valores.numSerie, CHAVE_SECRETA).toString()

        await Cliente.create({
            modelo: valores.modelo,
            marca: valores.marca,
            numSerie: numSerieCripto,
            tipoServico: valores.tipoServico,
            idCliente: valores.idCliente
        })

        return res.status(201).json({ message: 'Drone cadastrado com sucesso!' })
    } catch (err) {
        console.error('Erro ao cadastrar drone!', err)
        return res.status(500).json({ message: 'Erro ao cadastrar drone!' })
    }
}


module.exports = { cadastrar}
