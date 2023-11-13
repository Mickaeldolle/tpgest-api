-- Deploy gestTp:02-seeding to pg

BEGIN;

BEGIN;

INSERT INTO "contract" ("label") VALUES
  ('cdi'),
  ('cdd'),
  ('interim'),
  ('stagiaire'),
  ('alternant');

INSERT INTO "team" ("name") VALUES
  ('Binouz Obar'),
  ('John Doe');

INSERT INTO "role" ("label") VALUES 
  ('ouvrier'),
  ('chef d''equipe'),
  ('chef de chantier'),
  ('conducteur de travaux');

INSERT INTO "employee" ("lastname", "firstname", "intern_identification", "contract_starting", "contract_id", "role_id", "team_id", "created_at") VALUES
  ('Jojo', 'bernard', 107804, NOW(), 1, 1, 2, NOW()),
  ('Jean', 'Toto', 354798, NOW(), 1, 2, 2, NOW()),
  ('Claude', 'tata', 106874, NOW(), 3, 1, 2, NOW()),
  ('Binouz', 'Obar', 325845, NOW(), 1, 3, 2, NOW()),
  ('John', 'Doe', 65874, NOW(), 2, 3, 1, NOW()),
  ('Foo', 'Baz', 987452, NOW(), 1, 1, 1, NOW()),
  ('Bob', 'Bobby', 785956, NOW(), 1, 1, 1, NOW()),
  ('Michel', 'Michmich', 654258, NOW(), 1, 4, NULL, NOW());



INSERT INTO "location" ("reference", "label", "price", "starting_location", "ending_location", "created_at") VALUES
('LOX487', 'plaque vibrante 70kg', 22.5, NOW() + INTERVAL '15 days', NOW() + INTERVAL '20 days', NOW()),
('KIL874', 'minipelle marque inconnu 2.5t', 80.00, NOW() + INTERVAL '5 days', NOW() + INTERVAL '12 days', NOW());

 INSERT INTO "attestation" ("label") VALUES
  ('CACES A'),
  ('CACES B'),
  ('CACES C1'),
  ('CACES C2'),
  ('CACES D'),
  ('CACES E'),
  ('CACES F'),
  ('permis C'),
  ('AIPR'),
  ('decoupeuse'),
  ('SST');

INSERT INTO "machine" ("intern_identification", "label", "attestation_id", "location_id", "created_at") VALUES
  ('MR502', 'minipelle chenille kubota 5.7t', 1, NULL, NOW()),
  ('MR415', 'pelle pneu liebheer 18t', 2, NULL, NOW()),
  ('MR312', 'chargeuse liebheer pneu 4t', 1, NULL, NOW()),
  ('MR250', 'chargeuse kubota pneu 4t', 1, NULL, NOW()),
  ('MR560', '8x4 bibenne', 8, NULL, NOW()),
  ('MR360', '8x4 grue', 8, NULL, NOW()),
  ('MR860', '8x4 ampliroll', 8, NULL, NOW()),
  ('MR1470', 'cabane de chantier', NULL, NULL, NOW()),
  ('LOC21', 'plaque vibrante', NULL, 1, NOW()),
  ('LOC28', 'minipelle marque inconnu 2.5t', 1, 2, NOW());

INSERT INTO "client" ("intern_reference", "name", "created_at") VALUES
  ('CL230', 'Communauté urbaine du grand Reims', NOW()),
  ('CL198', 'Eurovia', NOW());

INSERT INTO "construction_site" ("intern_identification", "label", "latitude", "longitude", "team_id", "client_id", "created_at") VALUES
  ('CH10080', 'Construction d''un giratoire', 49.413222, 2.788412, 1, 2, NOW()),
  ('CH25691', 'Aménagement VRD 18 logements', 49.275989, 4.037377, 2, 1, NOW());

INSERT INTO "skill" ("label") VALUES
  ('maçon'),
  ('canalisateur'),
  ('regleur enrobé'),
  ('cylindreur'),
  ('chauffeur engin'),
  ('chauffeur poid lourd');

INSERT INTO "employee_has_attestation" ("attestation_id", "employee_id", "created_at") VALUES
  (1, 2, NOW()),
  (1, 3, NOW()),
  (1, 4, NOW()),
  (1, 5, NOW()),
  (2, 2, NOW()),
  (2, 6, NOW()),
  (9, 7, NOW()),
  (9, 3, NOW()),
  (9, 4, NOW()),
  (11, 2, NOW()),
  (11, 4, NOW()),
  (11, 7, NOW()),
  (11, 8, NOW()),
  (8, 2, NOW()),
  (8, 6, NOW());

INSERT INTO "employee_has_skill" ("employee_id", "skill_id", "created_at") VALUES
  (1, 1, NOW()),
  (1, 2, NOW()),
  (2, 5, NOW()),
  (2, 6, NOW()),
  (3, 3, NOW()),
  (4, 1, NOW()),
  (4, 2, NOW()),
  (5, 2, NOW()),
  (5, 3, NOW()),
  (5, 4, NOW()),
  (5, 1, NOW()),
  (6, 5, NOW()),
  (6, 5, NOW()),
  (7, 1, NOW());

COMMIT;

COMMIT;
