import {Router} from 'express'
import { pasajeros } from '../controllers/pasajeros.controller.js';


const router = Router()

router.get('/pasajeros', pasajeros);

export default router