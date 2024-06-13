const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Konfigurasi koneksi database
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'db_pariwisata',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Connect ke database
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    throw err;
  }
  console.log('MySQL Connected...');
  connection.release(); // release the connection
});

// LOGIN: Verifikasi pengguna
app.post('/api/login', (req, res) => {
  const { username, password } = req.body;
  const sql = 'SELECT * FROM tb_login WHERE username = ? AND password = ?';
  pool.query(sql, [username, password], (err, results) => {
    if (err) {
      console.error('Error during login:', err);
      return res.status(500).json({
        status: false,
        message: 'Error during login',
        error: err.message
      });
    }

    if (results.length > 0) {
      res.status(200).json({
        status: true,
        message: 'Login successful',
        user: results[0]
      });
    } else {
      res.status(401).json({
        status: false,
        message: 'Invalid username or password'
      });
    }
  });
});

// Endpoint untuk mendapatkan daftar wisata
app.get('/api/getList', (req, res) => {
  const query = 'SELECT * FROM wisata';
  pool.query(query, (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).json({
        status: false,
        message: 'Failed to retrieve data'
      });
      return;
    }

    res.status(200).json({
      status: true,
      message: 'List of tourist spots',
      data: results
    });
  });
});

// Endpoint untuk mendapatkan detail wisata berdasarkan ID
app.get('/api/getList/:id', (req, res) => {
  const { id } = req.params;
  const query = 'SELECT * FROM wisata WHERE id = ?';
  pool.query(query, [id], (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).json({
        status: false,
        message: 'Failed to retrieve data'
      });
      return;
    }

    if (results.length > 0) {
      res.status(200).json({
        status: true,
        message: 'Tourist spot details',
        data: results[0]
      });
    } else {
      res.status(404).json({
        status: false,
        message: 'Tourist spot not found'
      });
    }
  });
});

// Endpoint untuk mendapatkan ulasan berdasarkan ID wisata
app.get('/api/ulasan/:wisataId', (req, res) => {
  const { wisataId } = req.params;
  const sql = 'SELECT * FROM ulasan WHERE wisata_id = ? ORDER BY created_at DESC';
  pool.query(sql, [wisataId], (err, results) => {
    if (err) {
      console.error('Error fetching reviews: ' + err.stack);
      res.status(500).json({ error: 'Failed to fetch reviews' });
      return;
    }
    res.json({ data: results });
  });
});

// Endpoint untuk menambahkan ulasan
app.post('/api/addUlasan', (req, res) => {
  const { wisata_id, username, rating, review } = req.body;
  const sql = 'INSERT INTO ulasan (wisata_id, username, rating, review) VALUES (?, ?, ?, ?)';
  pool.query(sql, [wisata_id, username, rating, review], (err, result) => {
    if (err) {
      console.error('Error adding review: ' + err.stack);
      res.status(500).json({ error: 'Failed to add review' });
      return;
    }
    res.status(200).json({ message: 'Review added successfully' });
  });
});

app.listen(port, '192.168.1.53', () => {
  console.log(`Server running on http://localhost:${port}`);
});
