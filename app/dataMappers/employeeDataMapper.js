const db = require('../database');

const dataMapper = {
  getEmployeeWithJoin: async (id) => {
    const sqlQuery = `
    SELECT employee.*, 
      role.label AS role, 
      team.name AS team, 
      ARRAY_AGG(attestation.label) AS attestation, 
      ARRAY_AGG(skill.label) AS skill FROM employee
    LEFT JOIN employee_has_attestation AS eha ON eha.employee_id = employee.id
    LEFT JOIN attestation ON eha.attestation_id = attestation.id
    LEFT JOIN employee_has_skill AS ehs ON ehs.employee_id = employee.id
    LEFT JOIN skill ON ehs.skill_id = skill.id
    LEFT JOIN team ON team_id = team.id
    JOIN role ON role_id = role.id
    WHERE employee.id = ${id}
    GROUP BY employee.id, role.label, team.name
    `;
    const result = await db.query(sqlQuery);
    return result.rows[0];
  },
};

module.exports = dataMapper;
