const Cliente = require('../models/Cliente')
const cryptoJs = require('crypto-js')
const CHAVE_SECRETA = 'segredo'

const logar = async (req, res) => {
    const valores = req.body

    if (!valores.email || !valores.senha) {
        return res.status(400).json({ message: 'Preencha todos os campos!' })
    }

    try {
        const cliente = await Cliente.findOne({ where: { email: valores.email } })
        if (!cliente) {
            return res.status(400).json({ message: 'Email inválido, tente novamente!' })
        }

        const bytes = cryptoJs.AES.decrypt(cliente.senha, CHAVE_SECRETA)
        const senhaDescriptografada = bytes.toString(cryptoJs.enc.Utf8)

        if (valores.senha !== senhaDescriptografada) {
            return res.status(400).json({ message: 'Senha inválida, tente novamente!' })
        }

        const tempoEmMs = 2 * 60 * 60 * 1000
        const tempoExpira = Date.now() + tempoEmMs

        const payload = {
            idCliente: cliente.codCliente,
            nome: cliente.nome,
            expiraEm: tempoExpira
        }

        const token = cryptoJs.AES.encrypt(JSON.stringify(payload), CHAVE_SECRETA).toString()

        return res.status(200).json({
            message: 'cliente logado!',
            nome: cliente.nome,
            token: token
        })

    } catch (err) {
        console.error('Erro ao logar cliente!', err)
        return res.status(500).json({ message: 'Erro ao logar cliente!' })
    }
}

module.exports = { logar }