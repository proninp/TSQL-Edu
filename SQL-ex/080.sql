SELECT maker
FROM product
EXCEPT
SELECT maker
FROM Product p
     JOIN
(
    SELECT model
    FROM Product
    WHERE type LIKE 'PC'
    EXCEPT
    SELECT model
    FROM PC
) m ON m.Model = p.Model;

/* Option 2 */

SELECT maker
FROM Product
EXCEPT
SELECT maker
FROM product p
LEFT JOIN pc ON pc.model = p.model
WHERE type = 'PC' AND pc.model IS NULL