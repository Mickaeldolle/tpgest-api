-- Deploy gestTp:01-tables to pg

BEGIN;

CREATE TABLE "contract" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL UNIQUE
);

CREATE TABLE "role" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL UNIQUE
);

CREATE TABLE "client" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "intern_identification" TEXT NOT NULL UNIQUE,
  "name" TEXT NOT NULL
);

CREATE TABLE "construction_site" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "intern_identification" TEXT NOT NULL UNIQUE,
  "label" TEXT NOT NULL,
  "latitude" DECIMAL,
  "longitude" DECIMAL,
  "client_id" INT REFERENCES "client"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "team" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT NOT NULL,
  "construction_site_id" INT REFERENCES "construction_site"("id") ON DELETE CASCADE
);

CREATE TABLE "status" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL
);

CREATE TABLE "employee" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "intern_identification" INT NOT NULL UNIQUE,
  "firstname" TEXT NOT NULL,
  "lastname" TEXT NOT NULL,
  "nickname" TEXT NOT NULL,
  "contract_starting" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "contract_ending" TIMESTAMPTZ,
  "contract_id" INT NOT NULL REFERENCES "contract"("id") ON DELETE CASCADE,
  "role_id" INT NOT NULL REFERENCES "role"("id") ON DELETE CASCADE DEFAULT 1,
  "status_id" INT NOT NULL REFERENCES "status"("id") ON DELETE CASCADE DEFAULT 1,
  "team_id" INT REFERENCES "team"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "attestation" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL UNIQUE
);

CREATE TABLE "tool_type" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "type" TEXT NOT NULL UNIQUE
);

CREATE TABLE "tool" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "intern_identification" TEXT UNIQUE,
  "label" TEXT NOT NULL,
  "team_id" INT REFERENCES "team"("id") ON DELETE CASCADE,
  "employee_id" INT REFERENCES "employee"("id") ON DELETE CASCADE,
  "attestation_id" INT REFERENCES "attestation"("id") ON DELETE CASCADE,
  "tool_type_id" INT NOT NULL REFERENCES "tool_type"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE "rental_company" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "intern_identification" TEXT UNIQUE NOT NULL,
  "label" TEXT UNIQUE NOT NULL
);

CREATE TABLE "rental" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "price" DECIMAL NOT NULL,
  "rental_company_id" INT NOT NULL REFERENCES "rental_company"("id") ON DELETE CASCADE,
  "tool_id" INT NOT NULL REFERENCES "tool"("id") ON DELETE CASCADE,
  "starting_rental" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "ending_rental" TIMESTAMPTZ
);

-- CREATE TABLE "transport" (
--   "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--   "intern_identification" TEXT NOT NULL,
--   "label" TEXT NOT NULL,
--   "employee_id" INT REFERENCES "employee"("id") ON DELETE CASCADE,
--   "attestation_id" INT REFERENCES "attestation"("id") ON DELETE CASCADE
-- );

CREATE TABLE "skill" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "label" TEXT NOT NULL UNIQUE
);

-- Table de liaison

CREATE TABLE "employee_has_attestation" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "attestation_id" INT NOT NULL REFERENCES "attestation"("id") ON DELETE CASCADE,
  "employee_id" INT NOT NULL REFERENCES "attestation"("id") ON DELETE CASCADE
);

CREATE TABLE "employee_has_skill" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "employee_id" INT NOT NULL REFERENCES "employee"("id") ON DELETE CASCADE,
  "skill_id" INT NOT NULL REFERENCES "skill"("id") ON DELETE CASCADE
);

COMMIT;
