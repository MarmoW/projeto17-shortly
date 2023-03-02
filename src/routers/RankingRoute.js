import { Router } from 'express'
import { GetRanking } from '../controllers/RankingController.js'


const RankingRouter = Router()



RankingRouter.get("/ranking", GetRanking)

export default RankingRouter
