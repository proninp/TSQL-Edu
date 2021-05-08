INSERT INTO Outcomes
       SELECT 'Rodney' ship,
(
    SELECT name
    FROM Battles
    WHERE date = '19441025'
) battle,
              'sunk' result
       UNION ALL
       SELECT 'Nelson' ship,
(
    SELECT name
    FROM Battles
    WHERE date = '19450128'
) battle,
              'damaged' result;