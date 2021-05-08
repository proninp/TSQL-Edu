SELECT name
FROM Ships s
JOIN Classes c ON c.class = s.class
WHERE (IIF(numGuns = 8,1,0) +
       IIF(bore = 15,1,0) +
	  IIF(displacement = 32000,1,0) +
	  IIF(type = 'bb',1,0) +
	  IIF(launched = 1915,1,0) +
	  IIF(c.class = 'Kongo',1,0) +
	  IIF(country = 'USA',1,0)) > 3