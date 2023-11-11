const express = require ('express')
const mysql = require('mysql');

const app = express();
const port = 3000;

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'seguranca_fisica'
});

db.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
    return;
  }
  console.log('Conectado ao banco de dados MySQL');
});

app.use(express.json());

// Rota para criar um novo registro
app.post('/items', (req, res) => {
  const { Modelo, IP, Resolucao, Deleted } = req.body;
  if (!Modelo || !IP || !Resolucao || !Deleted) {
    res.status(400).json({ error: 'Ta faltando alguma coisa ae amigao' });
    return;
  }

  const newItem = { Modelo, IP, Resolucao, Deleted };
  db.query('INSERT INTO cameras SET ?', newItem, (err, result) => {
    if (err) {
      console.error('Erro ao criar um novo registro:', err);
      res.status(500).json({ error: 'Erro interno do servidor' });
      return;
    }
    newItem.id = result.insertId;
    res.status(201).json(newItem);
  });
});

// Rota para buscar todos os registros
app.get('/items', (req, res) => {
  db.query('SELECT * FROM cameras', (err, results) => {
    if (err) {
      console.error('Erro ao buscar os registros:', err);
      res.status(500).json({ error: 'Erro interno do servidor' });
      return;
    }
    res.json(results);
  });
});

// Rota para buscar um registro por ID
app.get('/items/:id', (req, res) => {
  const itemId = req.params.id;
  db.query('SELECT * FROM cameras WHERE id = ?', [itemId], (err, results) => {
    if (err) {
      console.error('Erro ao buscar o registro por ID:', err);
      res.status(500).json({ error: 'Erro interno do servidor' });
      return;
    }
    if (results.length === 0) {
      res.status(404).json({ error: 'Registro não encontrado' });
    } else {
      res.json(results[0]);
    }
  });
});

// Rota para atualizar um registro por ID
app.put('/items/:id', (req, res) => {
  const itemId = req.params.id;
  const { Modelo, IP, Resolucao, Deleted } = req.body;
  if (!Modelo || !IP || !Resolucao || !Deleted) {
    res.status(400).json({ error: 'Ta faltando alguma coisa ae amigao' });
    return;
  }

  const updatedItem = { Modelo, IP, Resolucao, Deleted };
  db.query('UPDATE cameras SET ? WHERE id = ?', [updatedItem, itemId], (err, result) => {
    if (err) {
      console.error('Erro ao atualizar o registro:', err);
      res.status(500).json({ error: 'Erro interno do servidor' });
      return;
    }
    if (result.affectedRows === 0) {
      res.status(404).json({ error: 'Registro não encontrado' });
    } else {
      res.json({ message: 'Registro atualizado com sucesso' });
    }
  });
});

//Rota para Soft Delete por ID
app.put('/items/:id/Deleted', (req, res) => {
    const itemId = req.params.id;
    const novoValor = req.body.novoValor;
  
    if (novoValor === undefined) {
      res.status(400).json({ error: 'O novo valor é obrigatório' });
      return;
    }
  
    const query = 'UPDATE cameras SET Deleted = ? WHERE id = ?';
  
    db.query(query, [novoValor, itemId], (err, result) => {
      if (err) {
        console.error('Erro ao atualizar a coluna Deleted:', err);
        res.status(500).json({ error: 'Erro interno do servidor' });
        return;
      }
      if (result.affectedRows === 0) {
        res.status(404).json({ error: 'Registro não encontrado' });
      } else {
        res.json({ message: 'Coluna Deleted atualizada com sucesso' });
      }
    });
  });
  
  app.listen(port, () => {
console.log(`API está escutando na porta ${port}`);
  });
