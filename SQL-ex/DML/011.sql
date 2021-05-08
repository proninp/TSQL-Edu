INSERT INTO PC
SELECT MIN(code) + 20 code
	,model + 1000 model_
	,MAX(speed) speed
	,MAX(ram) * 2 ram
	,MAX(hd) * 2 hd
	,(
		SELECT CONVERT(VARCHAR(10), MAX(CONVERT(NUMERIC, REPLACE(cd, 'x', '')))) + 'x'
		FROM PC
		) cd
	,CONVERT(MONEY, MAX(price) / 1.5) price
FROM Laptop
GROUP BY model