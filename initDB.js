// Import required modules
const fs = require('fs');
const mysql = require('mysql2/promise');
require('dotenv').config(); // Load environment variables from .env file

// Load environment variables
const DB_HOST = process.env.DB_HOST;
// const DB_HOST = process.env.DB_HOST || '127.0.0.1';
const DB_USER = process.env.DB_USER;
const DB_PASSWORD = process.env.DB_PASSWORD;
const DB_NAME = process.env.DB_NAME;
const DB_PORT = process.env.DB_PORT || 3306;

// Main function to initialize the database
(async () => {
  let connection;

  try {
    // Create a connection to MySQL
    connection = await mysql.createConnection({
      host: DB_HOST,
      user: DB_USER,
      password: DB_PASSWORD,
      port: DB_PORT,
    });

    console.log('Connected to MySQL');

    // Drop and recreate the database
    await connection.query(`DROP DATABASE IF EXISTS \`${DB_NAME}\`;`);
    console.log(`Database '${DB_NAME}' dropped successfully`);

    await connection.query(`CREATE DATABASE \`${DB_NAME}\`;`);
    console.log(`Database '${DB_NAME}' created successfully`);

    // Use the created database
    await connection.changeUser({ database: DB_NAME });

    // Read SQL files
    const createDatabaseSQL = fs.readFileSync('./sql/create_database.sql', 'utf8');
    const insertDataSQL = fs.readFileSync('./sql/insert_data.sql', 'utf8');

    // Helper function to execute SQL statements
    const executeSQL = async (sqlContent, description) => {
      const statements = sqlContent.split(';').filter(statement => statement.trim() !== '');
      console.log(`Step: Executing ${description} SQL...`);
      for (const statement of statements) {
        try {
          console.log(`Executing SQL: ${statement.trim().substring(0, 50)}...`); 
          await connection.query(statement);
        } catch (err) {
          console.error(`Error in ${description} SQL at statement: ${statement.trim()}`, err);
          throw err; // Stop further execution if an error occurs
        }
      }
      console.log(`${description} SQL executed successfully.`);
    };

    // Execute SQL statements
    await executeSQL(createDatabaseSQL, 'database creation');
    await executeSQL(insertDataSQL, 'data insertion');

    console.log('Database initialization completed successfully.');
  } catch (err) {
    console.error('An error occurred during database initialization:', err);
  } finally {
    if (connection) {
      await connection.end();
      console.log('MySQL connection closed.');
    }
  }
})();
