import mysql from "mysql2";
import logger from './logger.js';

// manage environment variables
import * as dotenv from "dotenv";
dotenv.config();
//if (process.env.NODE_ENV !== 'production') {
//  dotenv.config();
//}
logger.info(`Database URL: ${process.env.MYSQL_HOST}...`);
logger.info(` MYSQL_DATABASE at URL: ${process.env.MYSQL_DATABASE}...`);
// create the connection to database
const db = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USERNAME,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
});

logger.info(`Connecting to Database at URL: ${process.env.MYSQL_HOST}...`);

db.connect(error => {
  if (error) throw error;
  console.log("Successfully connected to the database.");
  logger.info("Successfully connected to the database.");
});

export default db;