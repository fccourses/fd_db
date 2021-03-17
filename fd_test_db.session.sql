DROP TABLE "users";
CREATE TABLE "users" (
  first_name varchar(64) NOT NULL CHECK (first_name != ''),
  last_name varchar(64) NOT NULL CHECK (last_name != ''),
  email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
  birthday date NOT NULL CHECK (birthday < current_date),
  is_male boolean NOT NULL
);
INSERT INTO "users"
VALUES (
    'Test',
    'Testovich',
    'test@gmail.com',
    '20/6/2040',
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
    '20/6/200023',
    false
  ),
  (
    'Test',
    'Testovich',
    'test23@gmail.com',
    '20/6/890',
    true
  );
/* 
 
 Отношения - таблицы
 Атрибуты - столбцы таблицы
 Домены - множество допустимых значений
 Кортежи - строчка в таблице
 
 SQL: 
 DDL - CREATE
 DML - INSERT, DELETE, UPDATE
 DCL - GRANT, REVOKE
 DQL - SELECT
 TCL - transaction
 
 Command component "component";
 */
DROP TABLE "messages";
CREATE TABLE "messages"(
  "id" bigserial PRIMARY KEY,
  "body" varchar(5000) NOT NULL CHECK ("body" != ''),
  "author" varchar(128) NOT NULL CHECK ("author" != ''),
  "createdAt" timestamp NOT NULL DEFAULT current_timestamp
);
INSERT INTO "messages" ("author", "body")
VALUES ('test testovich', 'test body 1'),
  ('test testovich', 'test body 2'),
  ('test testovich', 'test body 3');