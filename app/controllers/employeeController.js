// const debug = require('debug')('projet:EmployeeController');
const dataMapper = require('../dataMappers/employeeDataMapper');

const employeeController = {
  async getAllEmployeeWidthDetails(_, res) {
    const result = await dataMapper.getAllEmployeeWithJoin();
    res.status(200).json(result);
  },
  getEmployeeByIdAndDetails: async (req, res) => {
    const result = await dataMapper.getEmployeeByIdWithJoin(req.params.id);
    res.status(200).json(result);
  },
};

module.exports = employeeController;
