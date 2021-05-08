-- (0.24489997327328)
WITH sub
     AS (SELECT name,
                displacement,
                numGuns
         FROM
         (
             SELECT name,
                    class
             FROM Ships
             UNION
             SELECT DISTINCT
                    ship,
                    ship
             FROM Outcomes
         ) sh
         JOIN Classes c ON c.class = sh.class)
     SELECT name
     FROM sub q
     WHERE q.numGuns =
     (
         SELECT TOP 1 numGuns
         FROM sub s
         WHERE s.displacement = q.displacement
               AND s.numGuns IS NOT NULL ORDER BY numGuns DESC
     );


-- Variant 2 (0.094840928912163)
WITH sub
     AS (SELECT name,
                displacement,
                numGuns
         FROM
         (
             SELECT name,
                    class
             FROM Ships
             UNION
             SELECT ship,
                    ship
             FROM Outcomes
         ) sh
         JOIN Classes c ON c.class = sh.class)
     SELECT name
     FROM sub q
     WHERE q.numGuns =
     (
         SELECT MAX(numGuns)
         FROM sub s
         WHERE s.displacement = q.displacement
     );