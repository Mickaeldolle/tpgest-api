-- Revert gestTp:01-tables from pg

BEGIN;

DROP TABLE IF EXISTS 
"contract", "role", "client", "construction_site", "team", "employee", "attestation", "tool_type", "tool", "rental_company", "rental", "skill", "employee_has_attestation", "employee_has_skill" 
CASCADE;

COMMIT;
