DROP TABLE "users";
/*
 1. CONSTRAINT: Full name не пустая строка 
 2. COLUMN: height domain? containts? 
 */
ALTER TABLE "users" DROP COLUMN height;
CREATE TABLE "users" (
  id serial PRIMARY KEY,
  first_name varchar(64) NOT NULL CHECK (first_name != ''),
  last_name varchar(64) NOT NULL CHECK (last_name != ''),
  email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
  birthday date NOT NULL,
  height numeric(3, 2) NOT NULL CHECK (
    height > 0.2
    AND height < 2.7
  ),
  is_male boolean NOT NULL,
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
/* 
 */
DROP TABLE "products";
CREATE TABLE "products"(
  "id" serial PRIMARY KEY,
  "name" varchar(256) NOT NULL CHECK ("name" != ''),
  "price" decimal(16, 2) NOT NULL CHECK ("price" > 0),
  "quantity" int NOT NULL CHECK("quantity" > 0)
);
/* СВЯЗЬ ОДИН КО МНОГИМ. С ПОМОЩЬЮ 
 REFERENCES 
 
 */
DROP TABLE "orders";
/*  */
CREATE TABLE "orders"(
  id bigserial PRIMARY KEY,
  customer_id int REFERENCES "users"("id"),
  isDone boolean,
  created_at timestamp DEFAULT current_timestamp
);
/* СВЯЗЬ МНОГОЕ КО МНОГИМ
 1. СВЯЗУЮЩАЯ ТАБЛИЦА
 2. СОСТАВНОЙ ПЕРВИЧНЫЙ КЛЮЧ
 */
CREATE TABLE "products_to_orders"(
  order_id int REFERENCES "orders" ("id"),
  product_id int REFERENCES "products" ("id"),
  quantity int NOT NULL CHECK("quantity" > 0),
  PRIMARY KEY (order_id, product_id)
);
INSERT INTO "products" ("name", "price", "quantity")
VALUES ('iphone 10', 50000, 12000),
  ('samsung', 15000, 1200),
  ('nokia 3310', 500, 120);
INSERT INTO "orders"("customer_id")
VALUES(4);
INSERT INTO "products_to_orders" ("order_id", "product_id", "quantity")
VALUES (2, 2, 4),
  (2, 1, 1),
  (2, 3, 10);
/*  */
DROP TABLE "chats";
/*  */
CREATE TABLE "chats"(
  id serial PRIMARY KEY,
  owner_id int REFERENCES "users" ("id"),
  chat_name varchar(64),
  description varchar(100),
  UNIQUE (chat_name, owner_id)
);
/*  */
INSERT INTO "chats" ("owner_id", "chat_name", "description")
VALUES (21, 'CANT', 'test');
/*  */
CREATE TABLE "users_to_chats"(
  "chat_id" int REFERENCES "chats"("id"),
  "user_id" int REFERENCES "users" ("id"),
  PRIMARY KEY ("chat_id", "user_id")
);
/*  */
CREATE TABLE "messages"(
  "id" serial PRIMARY KEY,
  "author_id" int,
  "chat_id" int,
  "body" text,
  "created_at" timestamp NOT NULL DEFAULT current_timestamp,
  FOREIGN KEY ("chat_id", "author_id") REFERENCES "users_to_chats"("chat_id", "user_id")
);
/*  */
CREATE TABLE content(
  "id" serial PRIMARY KEY,
  "name" varchar(255) NOT NULL CHECK("name" != ''),
  "author_id" int REFERENCES "users" ("id"),
  "description" text,
  "created_at" timestamp NOT NULL DEFAULT current_timestamp
);
/*  */
INSERT INTO content ("name", "author_id")
VALUES ('rtest 1', 4),
  ('rtest 2', 4),
  ('rtest 3', 4);
/*  */
CREATE TABLE "user_reactions"(
  "content_id" int REFERENCES "content" ("id"),
  "user_id" int REFERENCES "users" ("id"),
  "is_liked" boolean,
  "review" text CHECK ("review" != ''),
  PRIMARY KEY ("content_id", "user_id")
);
/*  */
INSERT INTO "user_reactions" ("content_id", "user_id", "is_liked")
VALUES (2, 3, true),
  (2, 6, false),
  (2, 5, true),
  (2, 4, false);
/*  */
