const ApiError = require('../../error/ApiError');

// eslint-disable-next-line no-unused-vars
const errorHandler = (error, _, response, next) => {
  if (error instanceof ApiError) {
    if (process.env.NODE_ENV === 'development') {
      return response.status(error.status).json({ status: 'error', message: error.message, stack: error.stack });
    }
    return response.status(error.status).json({ status: 'error', message: error.status });
  }
  if (process.env.NODE_ENV === 'development') {
    return response.status(500).json({ status: 'error', message: error.message });
  }
  return response.status(500).json({ status: 'error', message: 'Internal server error' });
};

module.exports = errorHandler;
