const express = require('express');
const app = express();
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Rehearsal Scheduler API');
});

// Add rehearsal, user, and calendar endpoints here

app.listen(3001, () => {
  console.log('API running on port 3001');
});
