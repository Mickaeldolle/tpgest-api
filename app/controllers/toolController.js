// const debug = require('debug')('projet:ToolController');
const dataMapper = require('../dataMappers/toolDataMapper');

const toolController = {
  async getAllTools(_, res) {
    const result = await dataMapper.get();
    res.status(200).json(result);
  },
  getToolsDetails: async (req, res) => {
    const result = await dataMapper.getByTeamId(req.params.teamId);
    res.status(200).json(result);
  },
};

module.exports = toolController;
