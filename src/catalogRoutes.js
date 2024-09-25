const express = require('express');
const router = express.Router();
const pool = require('./db');  // Cambiado de 'db' a 'pool'

// Ruta para obtener todos los catálogos
router.get('/catalogs', async (req, res) => {
  try {
    const [users] = await pool.query('SELECT userId, firstName FROM user');
    const [businessUnits] = await pool.query('SELECT buId, buName FROM business_unit');
    const [states] = await pool.query('SELECT stateId, stateName FROM state');
    const [dependencies] = await pool.query('SELECT dependencyId, dependencyName FROM dependency');
    const [contractTypes] = await pool.query('SELECT contractTypeId, contractTypeName FROM contract_type');
    const [procedureTypes] = await pool.query('SELECT procedureTypeId, procedureTypeName FROM procedure_type');
    const [characterTypes] = await pool.query('SELECT characterTypeId, characterTypeName FROM character_type');
    const [mediumTypes] = await pool.query('SELECT mediumTypeId, mediumTypeName FROM medium_type');
    const [criteria] = await pool.query('SELECT criteriaId, criteriaName FROM criteria');

    res.json({
      users,
      businessUnits,
      states,
      dependencies,
      contractTypes,
      procedureTypes,
      characterTypes,
      mediumTypes,
      criteria
    });
  } catch (error) {
    console.error('Error al obtener los catálogos:', error);
    res.status(500).json({ message: 'Error al obtener los catálogos' });
  }
});

module.exports = router;


