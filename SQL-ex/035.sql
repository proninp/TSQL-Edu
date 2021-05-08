SELECT model,
       type
FROM Product
WHERE (model NOT LIKE '%[^0-9]%')
UNION
SELECT model,
       type
FROM Product
WHERE (model NOT LIKE '%[^A-Za-z]%')