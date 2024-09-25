// /backend/src/tenderRoutes.js
const express = require('express');

const pool = require('./db'); // Asegúrate de exportar tu pool de conexiones en db.js

const router = express.Router();

// Ruta para obtener las licitaciones
router.get('/licitaciones', async (req, res) => {
  try {
    const [rows] = await pool.execute(`
      SELECT 
        tender.tenderId,
        tender.tenderName,
        tender.purpose,
        business_unit.buName, 
        tender_type.tenderTypeName,
        procedure_type.procedureTypeName
      FROM 
        tender
      LEFT JOIN 
        business_unit ON tender.buId = business_unit.buId
      LEFT JOIN 
        tender_type ON tender.tenderTypeId = tender_type.tenderTypeId
      LEFT JOIN 
        procedure_type ON tender.procedureTypeId = procedure_type.procedureTypeId
    `);
    res.json(rows);
  } catch (error) {
    console.error('Error obteniendo licitaciones:', error);
    res.status(500).json({ message: 'Error obteniendo licitaciones' });
  }
});

module.exports = router;



