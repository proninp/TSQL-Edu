/*
* Find the manufacturers that have the most models in the Product table,
* as well as those that have the least models.
*/
WITH q AS (SELECT maker,
                  Count(DISTINCT model) models
           FROM product
           GROUP BY maker)
SELECT maker,
       models
FROM q
WHERE models = (SELECT MAX(models)
                FROM q)
      OR models = (SELECT MIN(models)
                   FROM q)