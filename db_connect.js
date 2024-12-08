const mysql = require('mysql2');

// Database configuration
const DB_HOST = '127.0.0.1';
const DB_USER = 'root';
const DB_PASSWORD = '12345';
const DB_NAME = 'PortfolioDB';

// Create MySQL connection
const connection = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_NAME, // Optional, not required for database creation
    multipleStatements: true // Allows multiple SQL statements in one query
});

// Export connection for reuse
module.exports = connection;
