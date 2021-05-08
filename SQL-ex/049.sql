SELECT name
FROM Ships s
     JOIN Classes c ON c.class = s.class
WHERE c.bore = 16
UNION
SELECT ship
FROM Outcomes o
     JOIN Classes c ON c.class = o.ship
WHERE c.bore = 16;

--Variant 2
SELECT DISTINCT ISNULL(name, ship)
FROM Classes c
     LEFT JOIN Ships s ON s.class = c.class
     LEFT JOIN Outcomes o ON o.ship = c.class
WHERE c.bore = 16
      AND ISNULL(name, ship) IS NOT NULL;