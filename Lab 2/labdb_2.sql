CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "full_name" varchar,
  "email" varchar,
  "phone_number" int,
  "city" varchar,
  "address" varchar
);

CREATE TABLE "order_items" (
  "id" SERIAL PRIMARY KEY,
  "order_id" int,
  "product_id" int,
  "quantity" int DEFAULT 1
);

CREATE TABLE "orders" (
  "id" int PRIMARY KEY,
  "user_id" int UNIQUE NOT NULL,
  "status" varchar
);

CREATE TABLE "products" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "price" int,
  "status" int
);

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("id") REFERENCES "order_items" ("product_id");
