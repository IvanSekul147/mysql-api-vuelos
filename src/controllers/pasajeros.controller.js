import {pool} from '../db.js'

export const pasajeros = async (req, res) => {
    const [result] = await pool.query('SELECT * FROM pasajeros AS result')
    res.json(result)
}