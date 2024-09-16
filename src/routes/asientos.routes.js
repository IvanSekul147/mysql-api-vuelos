import {Router} from 'express'
import { asientos } from '../controllers/asientos.controller.js';


const router = Router()

router.get('/asientos', asientos );

export default router;