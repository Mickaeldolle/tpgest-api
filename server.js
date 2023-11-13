require('dotenv').config();
const express = require('express');
const debug = require('debug')('projet:server');

const cors = require('cors')
const router = require('./app/routers');

const port = process.env.PORT ?? 3000;

const app = express();

app.use(cors());

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(router);

app.listen(port, () => debug(`Server is running on http://localhost:${port}`));
