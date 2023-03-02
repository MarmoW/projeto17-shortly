import {db} from '../database/database.connection.js'

export async function ShortenUrl(req, res){
    const { url } = req.body
    const { Authorization } = req.headers

    if(!Authorization) return res.send("token não informado")

    try{
        const findSession = await db.query("SELECT * FROM session WHERE token=$1",[Authorization])

        if(findSession) return res.status(409).send("Faça login novamente")
        

    }catch(err){
        res.status(500).send(err.message)
    }



}