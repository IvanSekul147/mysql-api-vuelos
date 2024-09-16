import {pool} from '../db.js'

export const aeropuertos = async (req, res) => {
    const [result] = await pool.query('SELECT * FROM aeropuertos AS result')
    res.json(result)
}