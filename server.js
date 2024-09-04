// /backend/server.js

const express = require('express');
const cors = require('cors');
const session = require('express-session');
const morgan = require('morgan');
const pool = require('./src/db');  // Importar el pool de conexiones

require('dotenv').config();

const app = express();
const port = process.env.PORT || 3001;

// Configurar CORS de forma condicional
const corsOptions = {
    origin: process.env.NODE_ENV === 'production' ? 'https://licitacionesv2.netlify.app' : '*', // Usar el dominio correcto en producción
    methods: ['GET', 'POST', 'PUT', 'DELETE'], // Métodos permitidos
    credentials: true, // Habilitar credenciales solo si es necesario
};
app.use(cors(corsOptions));

// Middleware
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
  secret: process.env.SESSION_SECRET || 'secret',
  resave: false,
  saveUninitialized: true,
  cookie: { 
    secure: process.env.NODE_ENV === 'production', // Solo cookies seguras en producción
    httpOnly: true, // Ayuda a mitigar ataques XSS
    sameSite: 'lax' // Protege contra ataques CSRF
  }
}));

// Ruta de prueba de la base de datos
app.get('/', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT 1 + 1 AS solution');
    res.send(`¡BD conectada! Resultado: ${rows[0].solution}`);
  } catch (error) {
    console.error('Error connecting to the database:', error);
    res.status(500).send('Error connecting to the database');
  }
});

// Importar rutas
const authRoutes = require('./src/authRoutes');
const departmentRoutes = require('./src/departmentRoutes');
const tenderRoutes = require('./src/tenderRoutes');

// Usar rutas
app.use('/api', authRoutes);
app.use('/api', departmentRoutes);
app.use('/api', tenderRoutes);

// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});
