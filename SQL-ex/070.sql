SELECT DISTINCT
       battle
FROM
(
    SELECT name,
           country
    FROM Ships s
         JOIN Classes c ON c.class = s.class
    UNION ALL
    SELECT class,
           country
    FROM Classes
) q
JOIN Outcomes o ON o.ship = q.name
GROUP BY country,
         battle
HAVING COUNT(DISTINCT name) > 2;