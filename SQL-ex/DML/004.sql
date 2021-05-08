INSERT INTO PC (code, model, speed, ram, hd, price)
SELECT (MIN(Code) + 20) code
       ,CONVERT(VARCHAR(10), CONVERT(numeric, model) + 1000) model
       ,max(speed) speed
       ,max(ram) * 2 ram
       ,max(hd) * 2 hd
       ,CONVERT(money, max(price)/1.5) price
FROM Laptop
GROUP BY model