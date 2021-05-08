DELETE
FROM Laptop
WHERE model IN (
		SELECT model
		FROM Product
		WHERE type = 'Laptop'
			AND maker IN (
				SELECT maker
				FROM Product
				EXCEPT
				SELECT maker
				FROM Product
				WHERE type = 'Printer'
				)
		)