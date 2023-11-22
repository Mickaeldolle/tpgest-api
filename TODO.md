Ajouter l'état du salarié dans la bdd > malade, absent, congé
  -> recreer une table

# Pour afficher toute les infos qu'on aura besoin dans le planning 

Besoin de récupérer le nom de l'équipe avec :
 - Tout les salariés de l'équipe
 - Tout les engins afféctés a l'équipe
 - tout le petit matériel affecté a l'équipe


---

Début de requete pour récupérer la team :

```sql
SELECT
	"team"."name",
	ARRAY_AGG(DISTINCT "e"."firstname") AS "members",
	ARRAY_AGG(DISTINCT "m"."label") AS "machines",
	"c"."label" AS "contruction_site"
FROM "team"
JOIN "employee" as "e" ON "team"."id" = "e"."team_id"
JOIN "machine" as "m" ON "team"."id" = "m"."team_id"
JOIN "construction_site" AS "c" ON "team"."id" = "c"."team_id"
GROUP BY "team".id, "c"."label"
;
```