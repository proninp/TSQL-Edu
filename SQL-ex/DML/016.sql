DELETE
FROM Product
WHERE model NOT IN (
  SELECT model FROM PC
  UNION
  SELECT model FROM Printer
  UNION
  SELECT model FROM Laptop)