SELECT AVG(price) price
FROM
(
    SELECT p.model,
           price
    FROM PC p
    UNION ALL
    SELECT l.model,
           price
    FROM Laptop l
) a
JOIN Product pr ON pr.model = a.model
                   AND pr.maker = 'A';