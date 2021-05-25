CREATE TABLE "clients" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "full_name" varchar,
  "email" varchar,
  "phone" varchar,
  "car" varchar
);

CREATE TABLE "mechanics" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "full_name" varchar,
  "clients" int
);

CREATE TABLE "typeOfWork" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "name" varchar,
  "mechanic_id" int
);

CREATE TABLE "progressOfWork" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "client_id" int,
  "time_wasted" timestamp,
  "status" boolean
);

ALTER TABLE "clients" ADD FOREIGN KEY ("id") REFERENCES "mechanics" ("clients");

ALTER TABLE "mechanics" ADD FOREIGN KEY ("id") REFERENCES "typeOfWork" ("mechanic_id");

ALTER TABLE "progressOfWork" ADD FOREIGN KEY ("client_id") REFERENCES "clients" ("id");
