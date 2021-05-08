SELECT COALESCE(i.point, o.point) point,
       COALESCE(i.date, o.date) date,
       CASE
           WHEN o.point IS NULL
           THEN 'inc'
           WHEN i.point IS NULL
           THEN 'out'
           ELSE NULL
       END [type],
       COALESCE(inc, out) rem
FROM
(
    SELECT point,
           date,
           SUM(inc) inc
    FROM Income
    GROUP BY point,
             date
) i
FULL JOIN
(
    SELECT point,
           date,
           SUM(out) out
    FROM Outcome
    GROUP BY point,
             date
) o ON i.point = o.point
       AND i.date = o.date
WHERE o.point IS NULL
      OR i.point IS NULL;