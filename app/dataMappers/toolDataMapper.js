const db = require('../database');

const dataMapper = {
  async get() {
    const sqlQuery = `
    SELECT
      tool.intern_identification,
      tool.label,
      team.name AS team,
      type.type,
      rental.starting_rental,
      rental.ending_rental,
      rtc.label AS rental_compagny
  FROM tool 
  JOIN tool_type AS type ON type.id = tool.tool_type_id
  LEFT JOIN team ON team.id = tool.team_id
  LEFT JOIN rental ON rental.tool_id = tool.id
  LEFT JOIN rental_company AS rtc ON rtc.id = rental.rental_company_id
    `
      ;
    const result = await db.query(sqlQuery);
    return result.rows;
  },

  async getByTeamId(id) {
    const sqlQuery = `
    SELECT
      tool.intern_identification,
      tool.label,
      tool.team_id,
      type.type
    FROM tool 
    JOIN tool_type AS type ON type.id = tool.tool_type_id
    WHERE team_id = $1
    `
      ;
    const result = await db.query(sqlQuery, [id]);
    return result.rows;
  },
};

module.exports = dataMapper;
