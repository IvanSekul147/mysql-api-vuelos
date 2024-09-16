import {Router} from 'express'
import { aviones } from '../controllers/aviones.controller.js';


const router = Router()

router.get('/aviones', aviones );

export default router;