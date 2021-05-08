DELETE
FROM Classes
WHERE class IN (
SELECT c.class
FROM Classes c
LEFT JOIN (
  SELECT name, class
  FROM Ships
  UNION
  SELECT ship, ship
  FROM Outcomes
) s ON c.class = s.class
GROUP BY c.class
HAVING COUNT(name) < 3)