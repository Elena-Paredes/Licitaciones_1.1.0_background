// backend/src/catalogRoutes.js
const express = require('express');
const router = express.Router();
const pool = require('./db');

// Obtener usuarios (responsables)
router.get('/users', async (req, res) => {
  try {
    const [users] = await pool.query('SELECT userId, firstName FROM user');
    res.status(200).json(users);
  } catch (error) {
    console.error('Error al obtener los usuarios:', error);
    res.status(500).json({ message: 'Error al obtener los usuarios' });
  }
});

// Obtener unidades de negocio
router.get('/business-units', async (req, res) => {
  try {
    const [businessUnits] = await pool.query('SELECT buId, buName FROM business_unit');
    res.status(200).json(businessUnits);
  } catch (error) {
    console.error('Error al obtener las unidades de negocio:', error);
    res.status(500).json({ message: 'Error al obtener las unidades de negocio' });
  }
});

// Obtener estados
router.get('/states', async (req, res) => {
  try {
    const [states] = await pool.query('SELECT stateId, stateName FROM state');
    res.status(200).json(states);
  } catch (error) {
    console.error('Error al obtener los estados:', error);
    res.status(500).json({ message: 'Error al obtener los estados' });
  }
});

// Obtener dependencias
router.get('/dependencies', async (req, res) => {
  try {
    const [dependencies] = await pool.query('SELECT dependencyId, dependencyName FROM dependency');
    res.status(200).json(dependencies);
  } catch (error) {
    console.error('Error al obtener las dependencias:', error);
    res.status(500).json({ message: 'Error al obtener las dependencias' });
  }
});

// Obtener tipos de contratos
router.get('/contract-types', async (req, res) => {
  try {
    const [contractTypes] = await pool.query('SELECT contractTypeId, contractTypeName FROM contract_type');
    res.status(200).json(contractTypes);
  } catch (error) {
    console.error('Error al obtener los tipos de contrato:', error);
    res.status(500).json({ message: 'Error al obtener los tipos de contrato' });
  }
});

// Obtener tipos de procedimientos
router.get('/procedure-types', async (req, res) => {
  try {
    const [procedureTypes] = await pool.query('SELECT procedureTypeId, procedureTypeName FROM procedure_type');
    res.status(200).json(procedureTypes);
  } catch (error) {
    console.error('Error al obtener los tipos de procedimiento:', error);
    res.status(500).json({ message: 'Error al obtener los tipos de procedimiento' });
  }
});

// Obtener tipos de carácter
router.get('/character-types', async (req, res) => {
  try {
    const [characterTypes] = await pool.query('SELECT characterTypeId, characterTypeName FROM character_type');
    res.status(200).json(characterTypes);
  } catch (error) {
    console.error('Error al obtener los tipos de carácter:', error);
    res.status(500).json({ message: 'Error al obtener los tipos de carácter' });
  }
});

// Obtener tipos de medios
router.get('/medium-types', async (req, res) => {
  try {
    const [mediumTypes] = await pool.query('SELECT mediumTypeId, mediumTypeName FROM medium_type');
    res.status(200).json(mediumTypes);
  } catch (error) {
    console.error('Error al obtener los tipos de medios:', error);
    res.status(500).json({ message: 'Error al obtener los tipos de medios' });
  }
});

// Obtener criterios de evaluación
router.get('/criteria', async (req, res) => {
  try {
    const [criteria] = await pool.query('SELECT criteriaId, criteriaName FROM criteria');
    res.status(200).json(criteria);
  } catch (error) {
    console.error('Error al obtener los criterios de evaluación:', error);
    res.status(500).json({ message: 'Error al obtener los criterios de evaluación' });
  }
});

module.exports = router;

