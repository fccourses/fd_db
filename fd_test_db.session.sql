DROP TABLE "users";
/*
 1. CONSTRAINT: Full name не пустая строка 
 2. COLUMN: height domain? containts? 
 */
CREATE TABLE "users" (
  id serial PRIMARY KEY,
  first_name varchar(64) NOT NULL CHECK (first_name != ''),
  last_name varchar(64) NOT NULL CHECK (last_name != ''),
  email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
  birthday date NOT NULL,
  height numeric(3, 2) NOT NULL CHECK (
    heght > 0.2
    AND 
    height < 2.7
  ) is_male boolean NOT NULL,
  CONSTRAINT "users_full_name_check" CHECK (
    first_name != ''
    AND last_name != ''
  ),
  CONSTRAINT "users_birthday_check" CHECK (
    birthday < current_date
    AND birthday > '1/1/1900'
  )
);
/* 
 */
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
    '20/6/1990',
    true
  );