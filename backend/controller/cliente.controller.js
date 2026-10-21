const Cliente = require('../models/Cliente')
const cryptoJs = require('crypto-js')
const CHAVE_SECRETA = 'segredo'

const cadastrar = async (req, res) => {
    const valores = req.body

    if (!valores.nome || !valores.email || !valores.senha || !valores.cpf || !valores.telefone) {
        return res.status(400).json({ message: 'Preencha todos os campos!' })
    }

    if (valores.cpf.length !== 11) {
        return res.status(400).json({ message: 'CPF inválido!' })
    }

    try {
        const senhaCripto = cryptoJs.AES.encrypt(valores.senha, CHAVE_SECRETA).toString()
        const cpfCripto = cryptoJs.AES.encrypt(valores.cpf, CHAVE_SECRETA).toString()

        await Cliente.create({
            nome: valores.nome,
            email: valores.email,
            senha: senhaCripto,
            cpf: cpfCripto,
            telefone: valores.telefone
        })

        return res.status(201).json({ message: 'Cliente cadastrado com sucesso!' })
    } catch (err) {
        console.error('Erro ao cadastrar cliente!', err)
        return res.status(500).json({ message: 'Erro ao cadastrar cliente!' })
    }
}

const listar = async (req, res) => {
    try {
        const clientes = await Cliente.findAll()
        let resultado = []

        clientes.forEach((el) => {
            let cpfDescriptografado = ''
            try {
                const bytes = CryptoJS.AES.decrypt(el.cpf, CHAVE_SECRETA)
                cpfDescriptografado = bytes.toString(CryptoJS.enc.Utf8)
            } catch (err) {
                cpfDescriptografado = 'Erro ao descriptografar'
                console.error(cpfDescriptografado, err)
            }
            resultado.push({
                codCliente: el.codCliente,
                nome: el.nome,
                email: el.email,
                cpf: cpfDescriptografado,
                telefone: el.telefone
            })
        })

        return res.status(200).json(resultado)
    } catch (err) {
        console.error('Erro ao listar clientes:', err)
        return res.status(500).json({ message: 'Erro ao listar clientes!' })
    }
}


module.exports = { cadastrar, listar}
