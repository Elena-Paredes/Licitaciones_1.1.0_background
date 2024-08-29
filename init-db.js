const fs = require('fs');
const path = require('path');
const pool = require('./src/db');  // Asegúrate de que este sea el pool de conexiones configurado correctamente

// Ruta al archivo SQL
const sqlFilePath = path.join(__dirname, 'sql', 'Tenders.sql');

// Leer el archivo SQL
fs.readFile(sqlFilePath, 'utf8', (err, sql) => {
  if (err) {
    console.error('Error reading SQL file:', err);
    return;
  }

  // Ejecutar el script SQL
  pool.query(sql, (error, results) => {
    if (error) {
      console.error('Error executing SQL script:', error);
      return;
    }
    console.log('Tables and relationships created successfully!');
  });
});
