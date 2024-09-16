import {pool} from '../db.js'

export const asientos = async (req, res) => {
    const [result] = await pool.query('SELECT * FROM asientos AS result')
    res.json(result)
}