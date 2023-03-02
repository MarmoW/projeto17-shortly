import { Router } from 'express'
import ValidateMiddleware from '../middlewares/ValidateMiddleware.js'
import { SignInSchema } from '../schemas/SignInSchema.js'
import { SignUpSchema } from '../schemas/SignUpSchema.js'
import { SignUp, SignIn, GetUser } from '../controllers/CustomerController.js'


const CustomerRouter = Router()

CustomerRouter.post("/signup", ValidateMiddleware(SignUpSchema), SignUp)

CustomerRouter.post("/signin", ValidateMiddleware(SignInSchema), SignIn)

CustomerRouter.get("/users/me", GetUser) //autenticada

export default CustomerRouter