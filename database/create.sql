BEGIN;

DROP TABLE IF EXISTS "user", "account", "transaction" CASCADE;

CREATE TABLE "user" (
  "id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "username" varchar(30) NOT NULL,
  "email" varchar(100) NOT NULL UNIQUE,
  "password" varchar(255) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz
);

CREATE TABLE "account" (
  "id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "account_name" varchar(30) NOT NULL,
  "balance" numeric(10, 2) NOT NULL DEFAULT 0.00,
  "user_id" smallint NOT NULL REFERENCES "user" ("id") ON DELETE CASCADE,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz
);

CREATE TABLE "transaction" (
  "id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "transaction_name" varchar(30) NOT NULL,
  "amount" numeric(10, 2) NOT NULL,
  "type" varchar(10) NOT NULL CHECK (type IN ('revenus', 'depenses')),
  "user_id" smallint NOT NULL REFERENCES "user" ("id") ON DELETE CASCADE,
  "account_id" smallint NOT NULL REFERENCES "account" ("id") ON DELETE CASCADE,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz
  
);
COMMIT;
