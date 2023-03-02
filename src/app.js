import express from  'express';
import cors from 'cors';
import CustomerRouter from './routers/CustomerRoute.js';
import UrlRouter from './routers/UrlRouter.js';
import RankingRouter from './routers/RankingRoute.js';

const server = express();

server.use(express.json());

server.use(cors());

server.use([CustomerRouter, UrlRouter, RankingRouter]);

server.listen(5000, () => {
    console.log('Server on')
  }); 
