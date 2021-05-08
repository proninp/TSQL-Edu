SELECT maker,
       MIN(type) + IIF(COUNT(DISTINCT type) > 1, '/' + IIF(COUNT(DISTINCT type) = 3, 'PC/', '') + MAX(type),'') [Product types]
FROM Product
GROUP BY maker