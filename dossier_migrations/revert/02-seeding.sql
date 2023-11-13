-- Revert gestTp:02-seeding from pg

BEGIN;

TRUNCATE TABLE "employee", "contract", "attestation", "role", "team", "machine", "construction_site", "location", "skill", "client", "employee_has_attestation", "employee_has_skill" 
CASCADE;

COMMIT;
