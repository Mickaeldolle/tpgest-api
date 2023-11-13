// const debug = require('debug')('projet:MainController');
const db = require('../database');

const dataMapper = {
  getAll: async (table) => {
    const sqlQuery = `SELECT * FROM ${table}`;
    const result = await db.query(sqlQuery);
    return result.rows;
  },

  getByid: async (table, id) => {
    const sqlQuery = `SELECT * FROM ${table} WHERE id = ${id}`;
    const result = await db.query(sqlQuery);
    return result.rows[0];
  },

  add: async (data, table) => {
    const values = [];
    const parameters = [];
    Object.keys(data).forEach((key, index) => {
      parameters.push(`$${index + 1}`);
      values.push(data[key]);
    });

    const sqlQuery = {
      text: `
      INSERT INTO "${table}"
        (${Object.keys(data).join()}) VALUES 
        (${parameters.join()})
      `,
      values,
    };
    const result = await db.query(sqlQuery);
    return result.rowCount;
  },

  update: async (data, table, id) => {
    // TODO : Inclure le updated_at ! Il faut formatter le la date
    let queryString = `UPDATE ${table}`;
    const values = [];
    Object.entries(data).forEach(([key, value], index) => {
      values.push(value);
      if (index === 0) {
        queryString += ` SET ${key} = $${index + 1}`;
        return;
      }
      queryString += `, ${key} = $${index + 1} `;
    });
    queryString += `WHERE id = '${id}' RETURNING *`;
    const result = await db.query(queryString, values);
    return result.rows[0];
  },

  delete: async (table, id) => {
    const sqlQuery = `DELETE FROM ${table} WHERE id = '${id}' RETURNING *`;
    const result = await db.query(sqlQuery);
    return result.rows[0];
  },
};

module.exports = dataMapper;
