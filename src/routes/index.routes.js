import {Router} from 'express'
import { aviones } from '../controllers/index.controller';


const router = Router()

app.get('/aviones', aviones );

export default router