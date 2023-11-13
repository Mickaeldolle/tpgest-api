const express = require('express');

const router = express.Router();

const mainController = require('../controllers/mainController');
const employeeController = require('../controllers/employeeController');

const errorHandler = require('../controllers/utils/errorHandler');
const controllerHandler = require('../controllers/utils/controllerHandler');

router.get('/', (_, res) => {
  res.end('hello');
});

router.get('/employees/:id(\\d+)/details', controllerHandler(employeeController.getEmployeeByIdAndDetails));

router.route('/:table')
  .get(controllerHandler(mainController.getAllRessources))
  .post(controllerHandler(mainController.createNewRessource));
router.route('/:table/:id(\\d+)')
  .get(controllerHandler(mainController.getRessourceById))
  .get(controllerHandler(mainController.updateRessource))
  .get(controllerHandler(mainController.deleteRessource));

router.use(errorHandler);

module.exports = router;
