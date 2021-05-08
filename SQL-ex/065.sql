WITH cte
     AS (
     SELECT ROW_NUMBER() OVER(ORDER BY maker,
                                       ordr) num,
            maker,
            type
     FROM
(
    SELECT DISTINCT
           maker,
           type,
           CASE
               WHEN type = 'PC'
               THEN 'a'
               WHEN type = 'Laptop'
               THEN 'b'
               WHEN type = 'Printer'
               THEN 'c'
           END [ordr]
    FROM Product
) q)
     SELECT num,
            CASE
                WHEN(num > 1)
                    AND maker =
(
    SELECT c1.maker
    FROM cte c1
    WHERE c1.num = (c.num - 1)
)
                THEN ''
                ELSE c.maker
            END maker,
            type
     FROM cte c
     ORDER BY num;