-- Deploy gestTp:01-tables to pg

BEGIN;

BEGIN;

CREATE TABLE "contract" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL UNIQUE
);

CREATE TABLE "role" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL UNIQUE
);

CREATE TABLE "team" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "employee" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "lastname" TEXT NOT NULL,
  "firstname" TEXT NOT NULL,
  "intern_identification" INT NOT NULL UNIQUE,
  "contract_starting" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "contract_ending" TIMESTAMPTZ,
  "contract_id" INT NOT NULL REFERENCES "contract"("id") ON DELETE CASCADE,
  "role_id" INT NOT NULL REFERENCES "role"("id") ON DELETE CASCADE DEFAULT 1,
  "team_id" INT REFERENCES "team"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "attestation" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL UNIQUE
);

CREATE TABLE "location" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "reference" TEXT UNIQUE,
  "label" TEXT NOT NULL,
  "price" DECIMAL NOT NULL,
  "starting_location" TIMESTAMPTZ NOT NULL,
  "ending_location" TIMESTAMPTZ NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "machine" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "intern_identification" TEXT NOT NULL UNIQUE,
  "label" TEXT NOT NULL,
  "attestation_id" INT REFERENCES "attestation"("id") ON DELETE CASCADE,
  "location_id" INT REFERENCES "location"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE "client" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "intern_reference" TEXT NOT NULL UNIQUE,
  "name" TEXT NOT NULL UNIQUE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "construction_site" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "intern_identification" TEXT NOT NULL UNIQUE,
  "label" TEXT NOT NULL,
  "latitude" DECIMAL,
  "longitude" DECIMAL,
  "team_id" INT REFERENCES "team"("id") ON DELETE CASCADE,
  "client_id" INT REFERENCES "client"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "skill" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL UNIQUE
);

-- Table de liaison

CREATE TABLE "employee_has_attestation" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "attestation_id" INT NOT NULL REFERENCES "attestation"("id") ON DELETE CASCADE,
  "employee_id" INT NOT NULL REFERENCES "attestation"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "employee_has_skill" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "employee_id" INT NOT NULL REFERENCES "employee"("id") ON DELETE CASCADE,
  "skill_id" INT NOT NULL REFERENCES "skill"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

COMMIT;

COMMIT;
