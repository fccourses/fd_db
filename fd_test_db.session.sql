DROP TABLE "users";


CREATE TABLE "users" (
  id serial PRIMARY KEY,
  first_name varchar(64) NOT NULL CHECK (first_name != ''),
  last_name varchar(64) NOT NULL CHECK (last_name != ''),
  email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
  birthday date NOT NULL ,
  is_male boolean NOT NULL
  CONSTRAINT "users_birthday_check" CHECK (birthday < current_date)
);


DROP TABLE a;

/* ПАРЫ ЧИСЕЛ b и c - уникальны. */
CREATE TABLE A(
  b int,
  c int,
  CONSTRAINT "U_B_C" UNIQUE(b, c)
);


INSERT INTO A
VALUES (1, 1),
  (2, 1);


INSERT INTO "users" (
    "first_name",
    "last_name",
    "email",
    "birthday",
    "is_male"
  )
VALUES (
    'Test',
    'Testovich',
    'test@gmail.com',
    '20/6/2000',
    true
  ),
  (
    'GGG',
    'Testovich',
    'test1@gmail.com',
    '20/6/2000',
    false
  ),
  (
    'Test',
    'SDGSDG',
    'test2@gmail.com',
    '20/6/2000',
    false
  ),
  (
    'DSFGSDGF',
    'sdfsdfsd',
    'test13@gmail.com',
    '20/6/2000',
    false
  ),
  (
    'Test',
    'Testovich',
    'hahah',
    '20/6/2000',
    false
  ),
  (
    'Test',
    'Testovich',
    'test23@gmail.com',
    '20/6/890',
    true
  );