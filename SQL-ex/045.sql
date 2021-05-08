SELECT name
FROM Ships
WHERE name LIKE '%[A-Za-z0-9]% %[A-Za-z0-9]% %[A-Za-z0-9]%'
UNION
SELECT ship
FROM Outcomes
WHERE ship LIKE '%[A-Za-z0-9]% %[A-Za-z0-9]% %[A-Za-z0-9]%';