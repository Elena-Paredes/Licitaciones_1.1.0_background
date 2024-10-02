const express = require('express');
const router = express.Router();
const db = require('./db');   // Asume que tienes una configuración de base de datos correcta.

// Para tabla de licitaciones generales
router.get('/licitaciones', async (req, res) => {
  try {
    const query = `
      SELECT tenderId, tenderNumber, publicationDate, purpose, buName
      FROM tender
      LEFT JOIN business_unit ON tender.buId = business_unit.buId
    `;
    const [rows] = await db.query(query);
    res.json(rows);
  } catch (error) {
    console.error('Error obteniendo licitaciones:', error);
    res.status(500).json({ message: 'Error al obtener las licitaciones' });
  }
});

//Para tabla de líneas de negocio
module.exports = router;



