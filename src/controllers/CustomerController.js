import {db} from '../database/database.connection.js'
import bcrypt from 'bcrypt'
import { v4 as uuidV4 } from 'uuid'

export async function SignUp(req, res){
    const { name, email, password} = req.body

    const passwordHashed = bcrypt.hashSync(password, 10)
    
    try{
        const checkUserExists = await db.query("SELECT * FROM customers WHERE email=$1", [email])
        
        if(checkUserExists.rows.length > 0) return res.sendStatus(409)

        await db.query("INSERT INTO customers (name, email, passwordHashed) VALUES ($1,$2,$3)",[name, email, passwordHashed])

        res.sendStatus(201)

    }catch(err){
        res.status(500).send(err.message)
    }

}

export async function SignIn(req, res){
    const {email, password} = req.body

    try{
        const getUserInfo = await db.query("SELECT * FROM customers WHERE email=$1", [email])

        if(getUserInfo.rows.length < 1) return res.sendStatus(409)

        const verifyPassword = bcrypt.compareSync(password, getUserInfo.rows[0].password)

        if(!verifyPassword) return res.sendStatus(409)

        const authToken = uuidV4()

        await db.query("INSERT ONE sessions (email, token) VALUES ($1, $2)", [email, authToken])

        res.status(200).send(authToken)


    }catch(err){
        res.status(500).send(err.message)
    }

}