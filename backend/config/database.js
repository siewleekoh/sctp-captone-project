import mysql from "mysql2";

// create the connection to database

const db = mysql.createConnection({
    host: "ce5-group2.chheppac9ozc.us-east-1.rds.amazonaws.com",
    user: "admin",
    password: "8k-G1^-k",
    database: "db_restaurant"
});


db.connect(error => {
  if (error) throw error;
  console.log("Successfully connected to the database.");
});

export default db;