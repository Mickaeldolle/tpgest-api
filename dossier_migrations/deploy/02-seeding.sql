-- Deploy gestTp:02-seeding to pg

BEGIN;

INSERT INTO "contract" ("label") VALUES
  ('cdi'),
  ('cdd'),
  ('interim'),
  ('stagiaire'),
  ('alternant');

INSERT INTO "role" ("label") VALUES 
  ('ouvrier'),
  ('chef d''equipe'),
  ('chef de chantier'),
  ('conducteur de travaux');
  
INSERT INTO "client" ("intern_identification", "name") VALUES
  ('CL230', 'Communauté urbaine du grand Reims'),
  ('CL198', 'Eurovia');
  
INSERT INTO "construction_site" ("intern_identification", "label", "latitude", "longitude", "client_id") VALUES
  ('CH10080', 'Construction d''un giratoire', 49.413222, 2.788412, 2),
  ('CH25691', 'Aménagement VRD 18 logements', 49.275989, 4.037377, 1),
  ('CH50080', 'Réaménagement Rue Victor Etienne Fismes', 49.307056, 3.696436, 1);

INSERT INTO "team" ("name", "construction_site_id") VALUES
  ('Binouz Obar', 1),
  ('John Doe', 2),
  ('Jean Bon', 3);

INSERT INTO "status" ("label") VALUES
  ('actif'),
  ('cp'),
  ('am'),
  ('at'),
  ('demissionaire'),
  ('licencié');

INSERT INTO "employee" ("intern_identification", "firstname", "lastname", "nickname", "contract_id", "role_id", "team_id", "status_id") VALUES
  (107804, 'Jojo', 'Bernard', 'Jojo Bernard',  1, 1, 2, 1),
  (354798, 'Jean', 'Toto', 'Jean Toto', 1, 2, 2, 1),
  (106874, 'Claude', 'Tata', 'Claude Tata', 3, 1, 2, 1),
  (325845, 'Binouz', 'Obar', 'Binouz Obar', 1, 3, 1, 1),
  (65874, 'John', 'Doe', 'John Doe', 2, 3, 2, 1),
  (987452, 'Foo', 'Baz', 'Foo Baz', 1, 1, 1, 1),
  (785956, 'Bob', 'Bobby', 'Bob Bobby', 1, 1, 1, 1),
  (654258, 'Michel', 'Michmich', 'Michel Michmich', 1, 4, NULL, 1),
  (758965, 'Jean', 'Bon', 'Jean Bon', 1, 3, 3, 1),
  (956562, 'Pierre', 'Pong', 'Pierre Pong', 1, 2, 3, 1),
  (965842, 'Alphonse', 'Lecuq', 'Alphonse Lecuq', 1, 1, 3, 1),
  (956987, 'Spider', 'Man', 'Spider Man', 1, 2, 3, 1);

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


INSERT INTO "tool_type" ("type") VALUES
  ('engin'),
  ('outillage'),
  ('equipement'),
  ('transport');

INSERT INTO "tool" ("intern_identification", "label", "team_id", "attestation_id", "tool_type_id", "employee_id") VALUES
  ('MR502', 'minipelle chenille kubota 5.7t', 1, 1, 1, NULL),
  ('MR415', 'pelle pneu liebheer 18t', 2, 2, 1, NULL),
  ('MR312', 'chargeuse liebheer pneu 4t', 1, 1, 1, NULL),
  ('MR250', 'chargeuse kubota pneu 4t', 2, 1, 1, NULL),
  ('LOC21', 'plaque vibrante', 1, NULL, 2, NULL),
  ('MR1470', 'cabane de chantier', 1, NULL, 3, NULL),
  ('LOC28', 'minipelle marque inconnu 2.5t', 2, 1, 1, NULL),
  ('MR560', '8x4 bibenne 19T', 2,  8, 4, 6),
  ('MR860', '8x4 ampliroll 15T', 1, 8, 4, 2),
  ('MR985', 'Semi Benne alu 30T', 3, 8, 4, 11),
  ('LOC874', '8x4 Grue Derichebourd', 1, NULL, 4, NULL),
  ('LOC652', 'Pilonneuse', 3, NULL, 2, NULL);

INSERT INTO "rental_company" ("intern_identification", "label") VALUES
  ('LOX123', 'Loxam Reims la neuvillette'),
  ('SAL887', 'Salti Reims la neuvillette'),
  ('DER459', 'Derichebourd Soissons');

INSERT INTO "rental" ("price","tool_id", "rental_company_id") VALUES
  (12.5, 5, 2),
  (95.8, 7, 1),
  (85.9, 11, 3);

INSERT INTO "skill" ("label") VALUES
  ('maçon'),
  ('canalisateur'),
  ('regleur enrobé'),
  ('cylindreur'),
  ('chauffeur engin'),
  ('chauffeur poid lourd');

INSERT INTO "employee_has_attestation" ("employee_id","attestation_id") VALUES
  (2, 1),
  (2, 2),
  (2, 8),
  (3, 1),
  (3, 9),
  (4, 1),
  (4, 9),
  (5, 1),
  (6, 2),
  (6, 8),
  (7, 9),
  (7, 1),
  (8, 1),
  (9, 1),
  (9, 9),
  (9, 10),
  (9, 11),
  (10, 1),
  (10, 10),
  (11, 10);

INSERT INTO "employee_has_skill" ("employee_id", "skill_id") VALUES
  (1, 1),
  (1, 2),
  (2, 5),
  (2, 6),
  (3, 3),
  (4, 1),
  (4, 2),
  (5, 2),
  (5, 3),
  (5, 4),
  (5, 1),
  (6, 5),
  (7, 5),
  (7, 1),
  (8, 2),
  (9, 1),
  (10, 1),
  (11, 6),
  (12, 1);

COMMIT;