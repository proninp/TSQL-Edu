WITH q
     AS (
     SELECT point,
            [date],
            inc amount
     FROM Income
     UNION ALL
     SELECT point,
            date,
            -out
     FROM Outcome)
     SELECT point,
            CONVERT(VARCHAR(15), date, 103) date,
(
    SELECT SUM(q.amount)
    FROM q
    WHERE q.date <= w.date
          AND q.point = w.point
) amount
     FROM q w
     GROUP BY point,
              date;


-- second variant

WITH tot
     AS (
     SELECT point,
            date,
            inc amount
     FROM Income
     UNION ALL
     SELECT point,
            date,
            -out
     FROM Outcome)
SELECT DISTINCT point,
       CONVERT(VARCHAR, date, 103) dt,
       SUM(amount) OVER (PARTITION BY point ORDER BY date) amount
FROM tot t