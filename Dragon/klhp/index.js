const express = require('express');
const csv = require('csv-parser');
const fs = require('fs');

const app = express();
const port = 80;
const csvFilePath = 'data.csv';

app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});

app.post('/submit', (req, res) => {
  const formData = req.body;

  // Convert form data to CSV format
  const csvData = Object.values(formData).join(',') + '\n';

  // Append the data to the CSV file
  fs.appendFile(csvFilePath, csvData, (err) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error saving data');
    } else {
      res.send('Data saved successfully');
    }
  });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

