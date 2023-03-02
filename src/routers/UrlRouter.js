import { Router } from 'express'
import ValidateMiddleware from '../middlewares/ValidateMiddleware.js'
import { UrlSchema } from '../schemas/UrlSchema.js'
import { ShortenUrl, GetShortUrlById, OpenShortUrl, DeleteById } from '../controllers/UrlController.js'

const UrlRouter = Router()


UrlRouter.post("/urls/shorten", ValidateMiddleware(UrlSchema), ShortenUrl) //autenticada

UrlRouter.get("/urls/:id", GetShortUrlById) //autenticada

UrlRouter.get("/urls/open/:shortUrl", OpenShortUrl) 

UrlRouter.delete("/urls/:id", DeleteById)

export default UrlRouter