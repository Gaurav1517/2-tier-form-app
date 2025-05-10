const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const app = express();

mongoose.connect('mongodb://localhost:27017/webform', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const DataSchema = new mongoose.Schema({
  name: String,
  email: String
});

const Data = mongoose.model('Data', DataSchema);

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', async (req, res) => {
  const allData = await Data.find();
  res.render('index', { data: allData });
});

app.post('/submit', async (req, res) => {
  const { name, email } = req.body;
  await Data.create({ name, email });
  res.redirect('/');
});

app.listen(3000, () => console.log('Server running on http://localhost:3000'));

