WITH q AS (
SELECT p.model
       , CONVERT(NUMERIC(6,0),p.model) int_model
FROM Product p
LEFT JOIN PC pc ON pc.model = p.model
WHERE p.type = 'PC' AND pc.model IS NULL
)
INSERT INTO PC
SELECT q.int_model + (SELECT MAX(code) FROM PC)
       ,q.model
       ,(SELECT MAX(speed) FROM PC)
       ,(SELECT MAX(ram) FROM PC)
       ,(SELECT MAX(hd) FROM PC)
       ,(SELECT CONVERT(VARCHAR(10), MAX(CONVERT(NUMERIC,REPLACE(cd,'x','')))) + 'x' FROM PC)
       ,(SELECT CONVERT(money,AVG(price)) FROM PC
        WHERE model NOT IN (SELECT model FROM q))

FROM q