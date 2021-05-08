SELECT class
FROM
(
    SELECT class,
           name
    FROM Ships
    
    UNION
    SELECT DISTINCT
           o.ship,
           o.ship
    FROM Outcomes o
         JOIN Classes c ON c.class = o.ship
) a
GROUP BY class
HAVING COUNT(name) = 1;