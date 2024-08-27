// /backend/server.js
const express = require('express');
const cors = require('cors');
const session = require('express-session');
const morgan = require('morgan');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3001;

// Configurar CORS
app.use(cors({
  origin: 'http://localhost:3000', // URL del frontend
  credentials: true
}));

// Middleware
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
  secret: process.env.SESSION_SECRET || 'secret',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: process.env.NODE_ENV === 'production' }
}));

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
