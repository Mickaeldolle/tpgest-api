-- Revert gestTp:01-tables from pg

BEGIN;

DROP TABLE IF EXISTS 
"employee", "contract", "attestation", "role", "team", "machine", "construction_site", "location", "skill", "client", "employee_has_attestation", "employee_has_skill" 
CASCADE;

COMMIT;
