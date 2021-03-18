const {extractUsers} = require('../utils')

class User {
  static _client = null;
  static _tableName = 'users';

  static async findAll () {
    return this._client.query(`SELECT * FROM "${this._tableName}"`);
  }
  static async bulkCreate (users) {
    return await this._client.query(`
    INSERT INTO "users" ("first_name","last_name","email","birthday","is_male")
    VALUES ${extractUsers(users)};
  `);
  }
}

module.exports = User;
