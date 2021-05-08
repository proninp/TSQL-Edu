SELECT o.ship, c.displacement, c.numGuns
FROM Outcomes o RIGHT JOIN 
 Classes c ON o.ship=c.class
WHERE o.battle = 'Guadalcanal'
UNION
SELECT o.ship, cl.displacement, cl.numGuns
FROM Outcomes o LEFT JOIN 
 Ships s ON o.ship = s.name 
LEFT JOIN Classes cl ON cl.class = s.class
WHERE o.battle = 'Guadalcanal' AND o.ship NOT IN (SELECT o.ship
FROM Outcomes o RIGHT JOIN 
 Classes c ON o.ship=c.class
WHERE o.battle = 'Guadalcanal')

-- Variant 2
SELECT ship, displacement, numGuns FROM (
SELECT o.ship, COALESCE(s.class, o.ship) [class]
FROM Outcomes o
LEFT JOIN Ships s ON s.name = o.ship
WHERE o.battle = 'Guadalcanal') q
LEFT JOIN Classes cl ON cl.class = q.class