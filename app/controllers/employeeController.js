// const debug = require('debug')('projet:EmployeeController');
const dataMapper = require('../dataMappers/employeeDataMapper');

const employeeController = {
  getEmployeeByIdAndDetails: async (req, res) => {
    const result = await dataMapper.getEmployeeWithJoin(req.params.id);
    res.status(200).json(result);
  },
};

module.exports = employeeController;
