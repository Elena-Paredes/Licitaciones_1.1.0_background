// /backend/src/departmentRoutes.js
const express = require('express');
const pool = require('./db'); // Asegúrate de exportar tu pool de conexiones en db.js

const router = express.Router();

// Ruta para obtener los departamentos
router.get('/departments', async (req, res) => {
  try {
    const [rows] = await pool.execute('SELECT DeptoId, deptoName FROM department');
    res.json(rows);
  } catch (error) {
    console.error('Error obteniendo departamentos:', error);
    res.status(500).json({ message: 'Error obteniendo departamentos' });
  }
});

module.exports = router;
