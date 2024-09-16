import {pool} from '../db.js'

export const vuelos = async (req, res) => {
    const [result] = await pool.query('SELECT * FROM vuelos AS result')
    res.json(result)
}