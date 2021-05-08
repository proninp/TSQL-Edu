/*
* Print all rows from the Product table,
* except for the three rows with the lowest model numbers
* and the three rows with the highest model numbers.
*/
SELECT *
FROM Product
WHERE model NOT IN (
		  SELECT TOP 3 model
		  FROM Product
		  ORDER BY model DESC)
	  AND model NOT IN (
		  SELECT TOP 3 model
		  FROM Product
		  ORDER BY model)

