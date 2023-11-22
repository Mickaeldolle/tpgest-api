// const debug = require('debug')('projet:TeamController');
const dataMapper = require('../dataMappers/teamDataMapper');

const TeamController = {
  getTeamsDetails: async (req, res) => {
    const result = await dataMapper.get();
    res.status(200).json(result);
  },
};

module.exports = TeamController;
