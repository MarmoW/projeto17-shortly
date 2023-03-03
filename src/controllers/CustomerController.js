import {db} from '../database/database.connection.js'
import bcrypt from 'bcrypt'
import { v4 as uuidV4 } from 'uuid'

export async function SignUp(req, res){
    const { name, email, password} = req.body

    const passwordHashed = bcrypt.hashSync(password, 10)
    
    try{
        const checkUserExists = await db.query("SELECT * FROM customers WHERE email=$1", [email])
        
        if(checkUserExists.rowCount > 0) return res.sendStatus(409)

        await db.query(`INSERT INTO customers (name, email, password) VALUES ($1,$2,$3)`,[name, email, passwordHashed])

        res.sendStatus(201)

    }catch(err){
        res.status(500).send(err.message)
    }

}

export async function SignIn(req, res){
    const {email, password} = req.body

    try{
        const getUserInfo = await db.query("SELECT * FROM customers WHERE email=$1", [email])
        
        if(getUserInfo.rowCount == 0) return res.sendStatus(401)

        const verifyPassword = bcrypt.compareSync(password, getUserInfo.rows[0].password)
        
        if(!verifyPassword) return res.sendStatus(401)//ver dps
        
        const authToken = uuidV4()

        await db.query(`INSERT INTO sessions (token, "userId") VALUES ($1, $2)`, [authToken, getUserInfo.rows[0].id])

        const resObj = {
            token: authToken
        }

        res.status(200).send(resObj)


    }catch(err){
        res.status(500).send(err.message)
    }

}

export async function GetUser(req, res){
    const { authorization: bearerToken } = req.headers
    
    const authToken = bearerToken.replace("Bearer ", "")
    

    if(!authToken) return res.sendStatus(401)

    try{
        const getSession = await db.query("SELECT * FROM sessions WHERE token=$1", [authToken])

        if(getSession.rowCount == 0) return res.sendStatus(401)

        //const getUser = await db.query("SELECT * FROM customers WHERE id=$1", [getSession.rows[0].userId])
        //const userUrl = await db.query(`SELECT * FROM url WHERE "userId"=$1`,[getSession.rows[0].userId])
        const getLinks = await db.query(`
        SELECT
          customers.id,
          customers.name,
          SUM(urls."visitCount") AS "visitCount",
        ARRAY_AGG(json_build_object(
          'id', urls.id,
          'shortUrl', urls."shortenUrl",
          'url', urls.url,
          'visitCount', urls."visitCount"
        )) AS "shortenedUrls"
        FROM users
        LEFT JOIN urls 
          ON customers.id = urls."userId"
        WHERE customers.id = $1
        GROUP BY customers.id
        `, [getSession.rows[0].userId])

        res.status(200).send(getLinks.rows[0])


    }catch(err){
        res.status(500).send(err.message)
    }


}