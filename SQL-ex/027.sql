SELECT pr3.maker,
       AVG(p.hd) hd
FROM PC p
     JOIN Product pr3 ON pr3.model = p.model
                         AND pr3.maker IN
(
    SELECT DISTINCT
           pr1.maker
    FROM Product pr1
         JOIN Product pr2 ON pr1.maker = pr2.maker
    WHERE pr1.type = 'PC'
          AND pr2.type = 'Printer'
)
GROUP BY pr3.maker;
 
 --- Var 2
SELECT maker,
       AVG(hd)
FROM product pr,
     pc
WHERE pr.model = pc.model
      AND maker IN
(
    SELECT maker
    FROM product
    WHERE type = 'printer'
)
GROUP BY maker;