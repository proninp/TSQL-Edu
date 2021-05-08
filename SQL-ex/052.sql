SELECT name
FROM Ships s
     LEFT JOIN Classes c ON c.class = s.class
WHERE c.type = 'bb'
      AND country = 'Japan'
      AND COALESCE(numGuns, 9) >= 9
      AND COALESCE(bore, 0) < 19
      AND COALESCE(displacement, 0) <= 65000;