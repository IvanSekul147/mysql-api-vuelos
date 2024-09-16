import {pool} from '../db.js'

export const aerolineas = async (req, res) => {
    const [result] = await pool.query('SELECT * FROM aerolineas AS result')
    res.json(result)
}