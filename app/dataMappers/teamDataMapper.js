const db = require('../database');

const dataMapper = {
  async get() {
    const sqlQuery = `
  SELECT 
	  DISTINCT team.id, team.name,
	  ARRAY_AGG(DISTINCT employee.nickname) AS employee,
	  construction_site.label AS site,
	  client.name AS client
  FROM team
  JOIN employee ON team.id = employee.team_id
  JOIN tool ON team.id = tool.team_id
  JOIN construction_site ON construction_site.id = team.construction_site_id
  JOIN client on construction_site.client_id = client.id
  GROUP BY team.id, construction_site.label, client.name
;
    `;
    const result = await db.query(sqlQuery);
    return result.rows;
  },
};

module.exports = dataMapper;
