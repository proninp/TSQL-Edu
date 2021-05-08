SELECT c.class,
       s.name,
       c.country
FROM Ships s,
     Classes c
WHERE c.numGuns > 9
      AND c.class = s.class;