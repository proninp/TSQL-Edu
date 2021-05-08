SELECT c.country,
       b.name
FROM Classes c,
     Battles b
EXCEPT
(
    SELECT c.country,
           o.battle
    FROM Outcomes o
         JOIN Ships s ON s.name = o.ship
         JOIN Classes c ON c.class = s.class
    UNION
    SELECT c.country,
           o.battle
    FROM Outcomes o
         JOIN Classes c ON c.class = o.ship
);

/* Option 2 */

SELECT country,
       b.name
FROM Classes c
CROSS JOIN Battles b
EXCEPT (
    SELECT country,
           battle
    FROM (
	   SELECT ship class,
			battle
	   FROM Outcomes
	   UNION
	   SELECT s.class,
			battle
	   FROM Outcomes o
	   JOIN Ships s ON s.name = o.ship) q
    JOIN Classes c ON c.class = q.class)
