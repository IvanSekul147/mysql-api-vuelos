import {pool} from '../db.js'

export const aviones = async (req, res) => {
    const [result] = await pool.query('SELECT * FROM aviones AS result')
    res.json(result)
}