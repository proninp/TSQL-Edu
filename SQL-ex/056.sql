SELECT class,
(
    SELECT COUNT(*)
    FROM
    (
        SELECT ship,
               result
        FROM Outcomes
        WHERE ship NOT IN
        (
            SELECT name
            FROM Ships
        )
        UNION ALL
        SELECT s.class,
               o.result
        FROM Outcomes o
             JOIN Ships s ON s.name = o.ship
    ) q
    WHERE ship = c.class
          AND result = 'sunk'
) qty
FROM Classes c;


-- Variant 2
SELECT class,
       COUNT(result) qty
FROM
(
    SELECT class name,
           class
    FROM Classes c
    UNION
    SELECT name,
           class
    FROM Ships
) q
LEFT JOIN Outcomes o ON o.ship = q.name
                        AND result = 'sunk'
GROUP BY class;