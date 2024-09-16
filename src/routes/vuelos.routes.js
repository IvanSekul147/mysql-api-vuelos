import {Router} from 'express'
import { vuelos } from '../controllers/vuelos.controller.js';


const router = Router()

router.get('/vuelos', vuelos );

export default router;