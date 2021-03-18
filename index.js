const { loadUsers } = require('./api');
const { User, client } = require('./models');

(async () => {
  await client.connect();

  const users = await loadUsers();
  const result = await User.bulkCreate(users);
  console.log(result);

  await client.end();
})();
