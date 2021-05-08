INSERT INTO Outcomes
SELECT o.ship
	,next_Battle
	,'sunk' result
FROM Outcomes o
JOIN (
	SELECT ship
	FROM Outcomes
	GROUP BY ship
	HAVING COUNT(Battle) = 1
	) o1 ON o1.ship = o.ship
JOIN (
	SELECT name
		,LEAD(name) OVER (ORDER BY [date]) next_Battle
	FROM Battles
	) b ON b.name = o.battle
WHERE next_Battle IS NOT NULL AND o.result = 'damaged';