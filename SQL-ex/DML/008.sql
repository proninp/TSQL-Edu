DELETE s
FROM Ships s
JOIN Outcomes o ON o.ship = s.name
WHERE result = 'sunk'