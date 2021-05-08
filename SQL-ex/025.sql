SELECT TOP 1 WITH TIES maker
FROM
(
    SELECT DISTINCT
           pr.maker,
           p.ram,
           p.speed
    FROM pc p
         JOIN Product pr ON pr.model = p.model
    WHERE maker IN
    (
        SELECT DISTINCT
               maker
        FROM Product pr
        WHERE type = 'printer'
    )
) a ORDER BY a.ram,
             a.speed DESC;