const cryptoJs = require('crypto-js')
const CHAVE_SECRETA = 'segredo'

function authMiddleware(req, res, next) {
    const token = req.headers['authorization']
    console.log('token =',token)
    
    if (!token) {
        return res.status(400).json({ message: 'Token não fornecido. Faça login novamente!' })
    }

    try {
        const bytes = cryptoJs.AES.decrypt(token, CHAVE_SECRETA)
        const dadosDescriptografados = bytes.toString(cryptoJs.enc.Utf8)

        console.log('dados descriptografados =',dadosDescriptografados)

        if (!dadosDescriptografados) {
            return res.status(400).json({ message: 'Token Inválido, faça login novamente!' })
        }

        const payload = JSON.parse(dadosDescriptografados)

        if (Date.now() > payload.expiraEm) {
            return res.status(400).json({ message: 'Sessão expirada, faça login novamente!' })
        }

        req.usuario = payload

        next()
    } catch (err) {
        return res.status(500).json({ message: 'Erro ao validar token' })
    }
}

module.exports = authMiddleware