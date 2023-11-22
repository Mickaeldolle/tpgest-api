-- Revert gestTp:02-seeding from pg

BEGIN;

TRUNCATE TABLE 
"contract", "role", "client", "construction_site", "team", "employee", "attestation", "tool_type", "tool", "rental_company", "rental", "tool_type", "skill", "employee_has_attestation", "employee_has_skill" 
CASCADE;

COMMIT;
