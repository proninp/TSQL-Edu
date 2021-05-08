WITH sub AS (
SELECT ROW_NUMBER() OVER(ORDER BY code) num,
       code,
	  price
FROM PC)
SELECT  a.code,
        AVG(b.price) avg_price
FROM sub a
JOIN sub b ON a.num <= b.num AND b.num <= a.num + 5
WHERE a.num <= ((SELECT MAX(num) FROM sub) - 5)
GROUP BY a.code

-- second option
SELECT TOP(SELECT COUNT(*)-5 from PC)
MIN(code) OVER (ORDER BY code ROWS BETWEEN CURRENT ROW AND 5 FOLLOWING)  gr_code,
AVG(price) OVER (ORDER BY code ROWS BETWEEN CURRENT ROW AND 5 FOLLOWING) avg_price
FROM PC