// const mysql = require('mysql2');

// // Database configuration
// const DB_HOST = '127.0.0.1';
// const DB_USER = 'root';
// const DB_PASSWORD = '12345';
// const DB_NAME = 'PortfolioDB';

// // Create MySQL connection
// const connection = mysql.createConnection({
//     host: DB_HOST,
//     user: DB_USER,
//     password: DB_PASSWORD,
//     database: DB_NAME, // Optional, not required for database creation
//     multipleStatements: true // Allows multiple SQL statements in one query
// });

// // Export connection for reuse
// module.exports = connection;

const mysql = require('mysql2');
const url = require('url');

// Load DATABASE_URL from environment variables
const DATABASE_URL =
    process.env.DATABASE_URL || 'mysql://haha12134:12345678@db4free.net:3306/portfoliodb_2024';

// Parse the DATABASE_URL using the URL module
const connectionConfig = url.parse(DATABASE_URL);
const [username, password] = connectionConfig.auth.split(':');

// Create a MySQL database connection
const connection = mysql.createConnection({
    host: connectionConfig.hostname, // Extract hostname from DATABASE_URL
    user: username,                  // Extract username
    password: password,              // Extract password
    database: connectionConfig.pathname.replace('/', ''), // Remove leading '/'
    port: connectionConfig.port || 3306, // Default port 3306
    multipleStatements: true         // Allow multiple SQL statements in a single query
});

// Test the database connection
connection.connect((err) => {
    if (err) {
        console.error('Database connection failed:', err.message); // Log error message
    } else {
        console.log('Database connection successful!'); // Log success message
    }
});

// Export the connection object for reuse
module.exports = connection;
