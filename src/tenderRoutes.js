// backend/src/tenderRoutes.js
const express = require('express');
const router = express.Router();
const pool = require('./db');  // Conexión a la base de datos

// Ruta para guardar una nueva licitación (tender)
router.post('/create', async (req, res) => {
  const {
    tenderNumber,
    purpose,
    publicationDate,
    firstName,  
    buId, 
    stateId,
    dependencyId,
    contractTypeId,
    procedureTypeId,
    characterTypeId,
    mediumTypeId,
    criteriaId,
    basePublicationDate,
    basePurchaseDate,
    visitDate,
    clarificationMeetingDate,
    prequalificationDate,
    sampleDate,
    presentationDate
  } = req.body;

  // Verificación rápida para asegurarse de que `buId` está presente
  if (!buId) {
    return res.status(400).json({ message: 'El campo buId es requerido.' });
  }

  const connection = await pool.getConnection();
  try {
    // Inicia una transacción
    await connection.beginTransaction();

    // Verifica que el responsable (firstName o userId) exista en la base de datos
    const userQuery = 'SELECT userId FROM user WHERE LOWER(firstName) = LOWER(?) LIMIT 1';
    const [userResult] = await connection.query(userQuery, [firstName]);

    if (userResult.length === 0) {
      return res.status(400).json({ message: 'El responsable seleccionado no existe' });
    }

    const userId = userResult[0].userId;

    // Ahora no es necesario hacer consulta para buId, ya que lo recibimos del frontend

    // Verificación de otros IDs (stateId, dependencyId, etc.) si son necesarios
    // Estos campos deben estar pre-seleccionados y enviados desde el frontend

    // Inserta en la tabla 'tender'
    const tenderInsertQuery = `
      INSERT INTO tender (
        tenderNumber, purpose, publicationDate, basePublicationDate, 
        basePurchaseDate, visitDate, clarificationMeetingDate, 
        prequalificationDate, sampleDate, presentationDate, userId, 
        buId, stateId, dependencyId, contractTypeId, procedureTypeId, 
        characterTypeId, mediumTypeId, criteriaId
      )
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;
    const [tenderResult] = await connection.query(tenderInsertQuery, [
      tenderNumber,
      purpose,
      publicationDate || null,
      basePublicationDate || null,
      basePurchaseDate || null,
      visitDate || null,
      clarificationMeetingDate || null,
      prequalificationDate || null,
      sampleDate || null,
      presentationDate || null,
      userId,
      buId,  
      stateId,
      dependencyId,
      contractTypeId,
      procedureTypeId,
      characterTypeId,
      mediumTypeId,
      criteriaId
    ]);

    // Commit de la transacción
    await connection.commit();

    res.status(201).json({ message: 'Licitación creada exitosamente', tenderId: tenderResult.insertId });
  } catch (error) {
    // En caso de error, rollback
    await connection.rollback();
    console.error('Error al crear la licitación:', error);
    res.status(500).json({ message: 'Error al crear la licitación' });
  } finally {
    connection.release();
  }
});

module.exports = router;




