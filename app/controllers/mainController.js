const debug = require('debug')('projet:mainController');
const mainDataMapper = require('../dataMappers/mainDataMapper');

const mainController = {

  getAllRessources: async (req, res) => {
    const { table } = req.params;
    const ressource = table.slice(0, table.length - 1);
    const result = await mainDataMapper.getAll(ressource);
    return res.status(200).json(result);
  },

  getRessourceById: async (req, res) => {
    const { table, id } = req.params;
    const ressource = table.slice(0, table.length - 1);
    const result = await mainDataMapper.getByid(ressource, id);
    return res.status(200).json(result);
  },

  createNewRessource: async (req, res) => {
    const { table } = req.params;
    const ressource = table.slice(0, table.length - 1);
    const result = await mainDataMapper.add(req.body, ressource);
    return res.status(201).json(result);
  },

  updateRessource: async (req, res) => {
    const { table, id } = req.params;
    const ressource = table.slice(0, table.length - 1);
    const result = await mainDataMapper.update(req.body, ressource, id);
    return res.status(201).json(result);
  },

  deleteRessource: async (req, res) => {
    const { table, id } = req.params;
    const ressource = table.slice(0, table.length - 1);
    const result = await mainDataMapper.delete(ressource, id);
    return res.status(200).json(result);
  },
  async test(req, res) {
    debug("dans le ctrl")
    const details = Object.keys(req.query);
    const { data } = req.params;
    const result = await mainDataMapper.getTest(data, details)
    return res.json(result)
  }

};

module.exports = mainController;
