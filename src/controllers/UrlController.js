import {db} from '../database/database.connection.js'
import { nanoid } from 'nanoid'



export async function ShortenUrl(req, res){
    const { url } = req.body
    const { authorization: bearerToken } = req.headers
    
    const authToken = bearerToken.replace("Bearer ", "")
     
    if(!authToken) return res.status(401).send("token não informado")

    try{
        const findSession = await db.query(`SELECT * FROM sessions WHERE "token"=$1`,[authToken])
        
        if(findSession.rowCount === 0) return res.status(401).send("Faça login novamente")

        const compactUrl = nanoid(8)

        await db.query(`INSERT INTO url ("shortUrl", url, "userId", "visitCount") VALUES ($1,$2,$3, 0)`, [compactUrl, url, findSession.rows[0].userId])

        const urlId = await db.query(`SELECT * FROM url WHERE "shortUrl"=$1`,[compactUrl])

        res.status(201).send({
            id: urlId.rows[0].id,
            shortUrl: compactUrl
        })
        

    }catch(err){
        res.status(500).send(err.message)
    }

}

export async function GetShortUrlById(req, res){
    const { id } = req.params
     
    try{    
        const fullUrl = await db.query("SELECT * FROM url WHERE id=$1", [id])

        if(fullUrl.rowCount === 0) return res.sendStatus(404)

        res.status(200).send({
            id: id,
            url: fullUrl.rows[0].url,
            shortUrl: fullUrl.rows[0].shortUrl
        })

    }catch(err){
        res.status(500).send(err.message)
    }

}

export async function OpenShortUrl(req, res){
    const { shortUrl} = req.params

    try{
        const fullUrl = await db.query(`SELECT * FROM url WHERE "shortUrl"=$1`,[shortUrl])

        if(fullUrl.rowCount == 0) return res.sendStatus(404)

        const updatedVisits = fullUrl.rows[0].visitCount +1

        await db.query(`UPDATE url SET "visitCount" = $1 WHERE "shortUrl" = $2`, [updatedVisits, shortUrl])

        res.redirect(fullUrl.rows[0].url)

    }catch(err){
        res.status(500).send(err.message)
    }

}

export async function DeleteById(req, res){
    const { id } = req.params
    const { authorization: bearerToken } = req.headers
    
    let authToken = bearerToken

    if(!authToken) return res.sendStatus(404)

    authToken = bearerToken.replace("Bearer ", "")

    try{
        const fullUrl = await db.query("SELECT * FROM url WHERE id=$1", [id])
        const getSession = await db.query("SELECT * FROM sessions WHERE token=$1", [authToken])

        if(fullUrl.rowCount == 0) return res.sendStatus(404)
        if(fullUrl.rows[0].userId !== getSession.rows[0].userId) return res.sendStatus(401)

        await db.query("DELETE FROM url WHERE id=$1", [id])
        
        res.sendStatus(204)


    }catch(err){
        res.status(500).send(err.message)
    }




}