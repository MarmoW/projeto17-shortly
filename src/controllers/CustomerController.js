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

        res.status(200).send({authToken})


    }catch(err){
        res.status(500).send(err.message)
    }

}

export async function GetUser(req, res){
    const {Authorization} = req.headers
    

    if(!Authorization) return res.sendStatus(409)

    try{
        const getSession = await db.query("SELECT * FROM sessions WHERE token=$1", [Authorization])

        if(getSessions.rowCount == 0) return res.sendStatus(404)

        const getUser = await db.query("SELECT * FROM customers WHERE id=$1", [getSession.rows[0].userId])
        const userUrl = await db.query("SELECT * FROM url WHERE 'userId'=$1",[getSession.rows[0].userId])


        const objRes = {
            id: getUser.rows[0].id,
            name: getUser.rows[0].name,
            visitCount: 0,
            shortenedUrls: userUrl.rows
        }

        res.status(201).send(objRes)


    }catch(err){
        res.status(500).send(err.message)
    }


}