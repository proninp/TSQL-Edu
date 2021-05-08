WITH q
     AS (
     SELECT class,
            COUNT(result) sunkedCount
     FROM
(
    SELECT class name,
           class
    FROM Classes cl
    UNION
    SELECT name,
           class
    FROM Ships s
) q
LEFT JOIN Outcomes o ON o.ship = q.name
                        AND o.result = 'sunk'
     GROUP BY class
     HAVING COUNT(result) > 0)
     SELECT e.class,
            q.sunkedCount
     FROM
(
    SELECT class,
           COUNT(name) shipCount
    FROM
(
    SELECT c.class,
           s.name
    FROM Classes c
         JOIN Ships s ON s.class = c.class
    UNION
    SELECT c.class,
           o.ship
    FROM Classes c
         JOIN Outcomes o ON o.ship = c.class
) w
    GROUP BY class
    HAVING COUNT(name) > 2
) e
JOIN q ON q.class = e.class;