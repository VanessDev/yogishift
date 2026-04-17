const pool = require('../config/db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const register = async (req, res) => {
  try {
    const { email, password, userType } = req.body;

    if (!email || !password || !userType) {
      return res.status(400).json({
        message: 'Email, password et userType sont obligatoires',
      });
    }

    const allowedRoles = ['teacher', 'studio', 'admin'];

    if (!allowedRoles.includes(userType)) {
      return res.status(400).json({
        message: 'userType invalide',
      });
    }

    
    const [existingUsers] = await pool.query(
      'SELECT id_user FROM users WHERE email = ?',
      [email]
    );

    if (existingUsers.length > 0) {
      return res.status(409).json({
        message: 'Cet email est déjà utilisé',
      });
    }

    
    const hashedPassword = await bcrypt.hash(password, 10);

   
    const [result] = await pool.query(
      'INSERT INTO users (email, password, userType) VALUES (?, ?, ?)',
      [email, hashedPassword, userType]
    );

    return res.status(201).json({
      message: 'Utilisateur créé avec succès',
      user: {
        id_user: result.insertId,
        email,
        userType,
      },
    });

  } catch (error) {
    console.error('Erreur register :', error);
    return res.status(500).json({
      message: 'Erreur serveur',
    });
  }
};


const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({
        message: 'Email et password obligatoires',
      });
    }

    // Récupérer user
    const [users] = await pool.query(
      'SELECT * FROM users WHERE email = ?',
      [email]
    );

    if (users.length === 0) {
      return res.status(401).json({
        message: 'Utilisateur introuvable',
      });
    }

    const user = users[0];

  
    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
      return res.status(401).json({
        message: 'Mot de passe incorrect',
      });
    }

    // Token JWT
    const token = jwt.sign(
      {
        id_user: user.id_user,
        userType: user.userType,
      },
      process.env.JWT_SECRET || 'secret_dev',
      { expiresIn: '1d' }
    );

    return res.status(200).json({
      message: 'Connexion réussie',
      token,
      user: {
        id_user: user.id_user,
        email: user.email,
        userType: user.userType,
      },
    });

  } catch (error) {
    console.error('Erreur login :', error);
    return res.status(500).json({
      message: 'Erreur serveur',
    });
  }
};

module.exports = {
  register,
  login,
};