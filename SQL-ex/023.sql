SELECT maker
FROM Product pr
     JOIN PC p ON p.model = pr.model
                  AND p.speed >= 750
INTERSECT
SELECT maker
FROM Product pr
     JOIN Laptop l ON l.model = pr.model
                      AND l.speed >= 750;