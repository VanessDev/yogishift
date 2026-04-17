const express = require('express');
const router = express.Router();

const { register, login } = require('../controllers/authController');
const verifyToken = require('../middlewares/authMiddleware');

router.get('/test', (req, res) => {
  res.json({ message: 'auth route ok' });
});

router.post('/register', register);
router.post('/login', login);

router.get('/me', verifyToken, (req, res) => {
  res.json({
    message: 'Utilisateur authentifié',
    user: req.user,
  });
});

module.exports = router;