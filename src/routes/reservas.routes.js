import {Router} from 'express'
import { reservas } from '../controllers/reservas.controller.js';


const router = Router()

router.get('/reservas', reservas );

export default router;