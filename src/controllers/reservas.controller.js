import {pool} from '../db.js'

export const reservas = async (req, res) => {
    const [result] = await pool.query('SELECT * FROM reservas AS result')
    res.json(result)
}