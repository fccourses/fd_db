const { Client } = require('pg');
const { loadUsers } = require('./api');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'fd_test'
};

const dbClient = new Client(config);

(async () => {
  await dbClient.connect();
  const users = await loadUsers();

  const result = await dbClient.query(`
    INSERT INTO "users" ("first_name","last_name","email","birthday","is_male")
    VALUES ${extractUsers(users)};
  `);

  console.log(result);

  await dbClient.end();
})();

function extractUsers (users) {
  return users
    .map(
      ({ name: { first, last }, email, dob: { date }, gender }) =>
        `('${first}','${last}','${email}','${date}','${gender === 'male'}')`
    )
    .join(',');
}
