const express = require('express');
const app = express();
const io = require('socket.io');

app.listen(5000, () => {
    console.log('Express server listening on port 5000');
});

app.get("/", function (req, res) {
    res.send(" Server is Up ")
});

io.on('connection', (socket) => {
    console.log("User Connection:" + socket.id);
    socket.on('message', (msg) => {
        io.emit('message', msg);
    });
})