UPDATE Laptop
SET price -= 100
,screen += 1
WHERE model IN (
SELECT l.model
FROM Laptop l
JOIN Product p ON p.model = l.model
WHERE p.type = 'Laptop' AND p.maker IN ('E','B'))