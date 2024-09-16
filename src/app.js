import express from 'express'
import vuelosRoutes from './routes/vuelos.routes.js'
import aerolineasRoutes from './routes/aerolineas.routes.js'
import aeropuertosRoutes from './routes/aeropuertos.routes.js'
import asientosRoutes from './routes/asientos.routes.js'
import avionesRoutes from './routes/aviones.routes.js'
import pasajerosRoutes from './routes/pasajeros.routes.js'
import reservasRoutes from './routes/reservas.routes.js'

const app = express()

app.use ('/api', vuelosRoutes)
app.use ('/api', aerolineasRoutes)
app.use ('/api', aeropuertosRoutes)
app.use ('/api', asientosRoutes)
app.use ('/api', avionesRoutes)
app.use ('/api', pasajerosRoutes)
app.use ('/api', reservasRoutes)

export default app;