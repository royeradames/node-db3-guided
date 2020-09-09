const db = require("../data/db-config.js");

module.exports = {
    getAll,
    findById,
    update,
    add
}

function getAll() {
    return db("users")
}
function findById(id) {
    return db("users").where({ id }).first()
}
function update(id) {
    return db("users").where({ id }).first().update(changes).then(() => {
        return findById(id)
    })
}
function add(user) {
    return db("users")
        .insert(user, "id")
        .then(([id]) => {
            return findById(id)
        })
}