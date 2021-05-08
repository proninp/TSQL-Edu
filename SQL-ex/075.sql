SELECT name, launched, battle FROM (
SELECT sh.name, sh.launched, 
b.name battle
FROM Ships sh, Battles b
WHERE b.date = (SELECT top 1 btl.date FROM Battles btl WHERE DATEPART(YEAR, btl.date) >= sh.launched ORDER BY btl.date ASC) AND sh.launched IS NOT NULL 
AND EXISTS (SELECT name FROM Battles WHERE DATEPART(YEAR, date) >= sh.launched)
UNION
SELECT shi.name, shi.launched, b.name
FROM Ships shi
LEFT JOIN Battles b ON DATEPART(YEAR, date) >= shi.launched
WHERE NOT EXISTS (SELECT name FROM Battles WHERE DATEPART(YEAR, date) >= shi.launched) AND shi.launched IS NOT NULL
UNION
SELECT s.name, s.launched, b.name
FROM Ships s, Battles b
WHERE s.launched IS NULL AND b.date = (SELECT MAX(date) FROM Battles)) q
ORDER BY name