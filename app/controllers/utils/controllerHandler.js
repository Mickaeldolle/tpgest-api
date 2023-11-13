function controllerHandler(controller) {
  return async (request, response, next) => {
    try {
      await controller(request, response, next);
    } catch (error) {
      next(error);
    }
  };
}

module.exports = controllerHandler;
