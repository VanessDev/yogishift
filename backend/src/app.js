const express = require('express');
const cors = require('cors');

const authRoutes = require('./routes/authRoutes');

const app = express();

app.use(cors());
app.use(express.json());

console.log('app.js chargé');
console.log('authRoutes =', typeof authRoutes);

app.get('/', (req, res) => {
  res.json({ message: 'API YogiShift OK' });
});

app.use('/api/auth', authRoutes);

module.exports = app;