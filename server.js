const express = require('express');
const app = express();

app.get('/', (req, res) => {
    const obj = {
        "message": "My name is Angel",
        "timestamp": Date.now()
    };
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify(obj, null, 2));
});

app.listen(3000)