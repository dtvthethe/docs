const express = require('express');
const app = express();
const port = 3000;
app.set('view engine', 'pug');
app.set('views', './layouts');

app.get('/', (req, res) => {
    res.send('Hi!');
});

app.get('/test', (req, res) => {
    res.render('test', {
        param1 : 'Hihi'
    });
});

app.get('/query', (req, res) => {
    console.log(req.query);
});

app.listen(port, () => {
    console.log('Server is running on port: ' + port);
});