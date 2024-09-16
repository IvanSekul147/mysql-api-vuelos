import {Router} from 'express'
import { aerolineas } from '../controllers/aerolineas.controller.js';


const router = Router()

router.get('/aerolineas', aerolineas );

export default router;