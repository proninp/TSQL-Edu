SELECT CAST(AVG(numGuns * 1.0) AS NUMERIC(8, 2)) avg_numGuns
FROM
(
    SELECT name,
           class
    FROM Ships
    UNION
    SELECT ship,
           ship
    FROM Outcomes
) q
JOIN Classes c ON c.class = q.class
WHERE type = 'bb';