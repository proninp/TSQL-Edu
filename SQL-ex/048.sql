SELECT c.class
FROM Outcomes o
     JOIN Classes c ON c.class = o.ship
WHERE o.result = 'sunk'
UNION
SELECT s.class
FROM Outcomes o
     JOIN Ships s ON s.name = o.ship
WHERE o.result = 'sunk';