WITH All_models
     AS (
     SELECT model,
            price
     FROM PC
     UNION
     SELECT model,
            price
     FROM Laptop
     UNION
     SELECT model,
            price
     FROM Printer)
     SELECT TOP 1 WITH TIES model
     FROM All_models ORDER BY price DESC;