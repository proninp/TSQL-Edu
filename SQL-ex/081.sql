SELECT o.code
       ,o.point
       ,o.date
       ,o.out
FROM Outcome o
JOIN (
    SELECT TOP 1 WITH TIES DATEPART(m,[date]) m
		 ,DATEPART(yyyy,[date]) y
		 ,SUM(out) am
    FROM Outcome
    GROUP BY DATEPART(m,[date]), DATEPART(yyyy,[date])
    ORDER BY am DESC) q
ON q.m = DATEPART(m,o.[date]) AND q.y = DATEPART(yyyy,o.[date])


/* Option 2 */

SELECT TOP 1 WITH TIES code, point, date, out
FROM Outcome
ORDER BY SUM(out) OVER(PARTITION BY YEAR(date), MONTH(date)) DESC