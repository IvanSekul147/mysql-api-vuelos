import {Router} from 'express'
import { aeropuertos } from '../controllers/aeropuertos.controller.js';


const router = Router()

router.get('/aeropuertos', aeropuertos );

export default router;