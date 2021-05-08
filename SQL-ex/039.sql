SELECT DISTINCT o.ship
FROM Outcomes o
     JOIN Battles b ON b.name = o.battle
     JOIN
(
    SELECT ship,
           b.date
    FROM Outcomes o
         JOIN Battles b ON b.name = o.battle
) a ON a.ship = o.ship
       AND a.date > b.date
WHERE o.result = 'damaged';