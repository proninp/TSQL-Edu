SELECT maker,
      MAX(l.price) lprice,
	 MAX(pc.price) pprice,
	 MAX(pr.price) prprice
FROM Product p
LEFT JOIN PC ON pc.model = p.model
LEFT JOIN Laptop l ON l.model = p.model
LEFT JOIN Printer pr ON pr.model = p.model
WHERE COALESCE(pc.price,l.price,pr.price,-1) > 0
GROUP BY maker