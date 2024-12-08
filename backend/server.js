const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 3000;

//Connect the Node.js application to the mysql database by creating a connection pool
const db = mysql.createConnection({
    host: '127.0.0.1',
    //port: '3306',
    user: 'root',
    password: 'Ntimane200',
    database: 'banking_app',
    connectTimeout: 60000
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL');
})

app.use(express.json());

app.post('/register', (req, res) => {
    const {firstName, lastName, idNumber, email, cellNumber, password} = req.body;
    db.query(
        'INSERT INTO account (firstName, lastName, idNumber, emailAddress, cellNumber, password) VALUES (?, ?, ?, ?, ?, ?)',
        [firstName, lastName, idNumber, email, cellNumber, password], (err, results) => {
            if (err) {
                console.error('error inserting data:', err);
                res.json({ success: false, message: 'Database error' });

            }else {
                res.json({success: true});
            }
            
        });
});

app.listen(port, () => {
    console.log('Server running on port ${port}');
});