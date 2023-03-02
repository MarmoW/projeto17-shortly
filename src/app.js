import express from  'express';
import cors from 'cors';
import CustomerRouter from './routers/CustomerRoute.js';


const server = express();

server.use(express.json());

server.use(cors());

server.use([CustomerRouter]);

server.listen(5000, () => {
    console.log('Server on')
  }); // 