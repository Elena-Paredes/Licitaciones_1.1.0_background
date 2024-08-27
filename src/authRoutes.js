// /backend/src/authRoutes.js
const express = require('express');
const bcrypt = require('bcrypt');
const pool = require('./db'); // Asegúrate de exportar tu pool de conexiones en db.js

const router = express.Router();

// Ruta para registrar usuarios
router.post('/signup', async (req, res) => {
  const { firstName, lastName, username, email, phone, password, department } = req.body;

  try {
    // Cifrar la contraseña
    const hashedPassword = await bcrypt.hash(password, 10);

    // Conectar a la base de datos y guardar el usuario
    const [result] = await pool.execute(
      `INSERT INTO user (firstName, lastName, username, email, phone, password, creationDate, lastAccessDate, DeptoId) VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW(), ?)`,
      [firstName, lastName, username, email, phone, hashedPassword, department]
    );

    res.json({ message: 'Registro exitoso', userId: result.insertId });
  } catch (error) {
    console.error('Error registrando usuario:', error);
    res.status(500).json({ message: 'Error registrando usuario' });
  }
});

// Ruta para iniciar sesión
router.post('/signin', async (req, res) => {
  const { username, password } = req.body;

  try {
    console.log('Inicio de sesión para:', username);

    // Buscar el usuario en la base de datos
    const [rows] = await pool.execute('SELECT * FROM user WHERE username = ?', [username]);

    if (rows.length === 0) {
      console.log('Usuario no encontrado');
      return res.status(401).json({ message: 'Usuario no encontrado' });
    }

    const user = rows[0];
    console.log('Usuario encontrado:', user);

    // Comparar la contraseña
    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      console.log('Contraseña incorrecta');
      return res.status(401).json({ message: 'Contraseña incorrecta' });
    }

    // Actualizar la fecha de último acceso
    await pool.execute('UPDATE user SET lastAccessDate = NOW() WHERE userId = ?', [user.userId]);

    // Iniciar sesión
    res.json({ message: 'Inicio de sesión exitoso', user: { userId: user.userId, username: user.username } });
  } catch (error) {
    console.error('Error iniciando sesión:', error);
    res.status(500).json({ message: 'Error iniciando sesión' });
  }
});

module.exports = router;
