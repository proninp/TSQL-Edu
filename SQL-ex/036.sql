SELECT sh.name
FROM Ships sh
WHERE name = class
UNION
SELECT o.ship
FROM Outcomes o
     JOIN Classes cl ON cl.class = o.ship;