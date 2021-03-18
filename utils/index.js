module.exports.extractUsers = users => {
  return users
    .map(
      ({ name: { first, last }, email, dob: { date }, gender }) =>
        `('${first}','${last}','${email}','${date}','${gender === 'male'}')`
    )
    .join(',');
};
