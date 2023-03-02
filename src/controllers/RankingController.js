import {db} from '../database/database.connection.js'

export async function GetRanking(req, res){
    try{
        const ranking =  await db.query(`SELECT customers.id, customers.name, COUNT("userId") AS "linksCount", SUM("visitCount") AS "visitCount" FROM customers LEFT JOIN url ON customers.id=url."userId" GROUP BY customers.id ORDER BY "visitCount" DESC NULLS LAST`)

        

        res.status(200).send(ranking.rows.slice(0,10))

    }catch(err){
        res.status(500).send(err.message)
    }
}