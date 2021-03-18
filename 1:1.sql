/* 1:1 */
CREATE TABLE coach (id serial PRIMARY KEY, name varchar(128));
/*  */
CREATE TABLE teams(
  id serial PRIMARY KEY,
  name varchar(128),
  coach_id int REFERENCES coach (id)
);
/*  */
ALTER TABLE coach
ADD COLUMN team_id int REFERENCES teams (id);