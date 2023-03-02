import { Router } from 'express'
import ValidateMiddleware from '../middlewares/ValidateMiddleware.js'
import { SignInSchema } from '../schemas/SignInSchema.js'
import { SignUpSchema } from '../schemas/SignUpSchema.js'
import { SignUp } from '../controllers/CustomerController.js'
import { SignIn} from '../controllers/CustomerController.js'


const CustomerRouter = Router()

CustomerRouter.post("/signup", ValidateMiddleware(SignUpSchema), SignUp)

CustomerRouter.post("/signin", ValidateMiddleware(SignInSchema), SignIn)

export default CustomerRouter