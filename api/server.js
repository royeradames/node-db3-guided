const express = require("express");
const helmet = require("helmet");

const UserRouter = require("../users/user-router.js");

const db = require('../data/db-config')

const server = express();

server.use(helmet());
server.use(express.json());

server.use("/api/users", UserRouter);

server.get('/api/posts', (req, res) => {
    /*
    select contents as Quote, username as QuoteBy
    from users as u
    join posts as p
        on p.user_id = u.id;
    */
    db('posts as p').join('users as u', 'p.user_id', 'u.id').select('contents as Quote, username as QuoteBy')
})

module.exports = server;
