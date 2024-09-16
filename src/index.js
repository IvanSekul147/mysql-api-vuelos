import express from 'express'
import vuelosRoutes from './routes/vuelos.routes.js'
import indexRoutes from './routes/index.routes.js'

const app = express()

app.use (indexRoutes)
app.use (vuelosRoutes)

app.listen(3000)
console.log('Server running on port 3000')