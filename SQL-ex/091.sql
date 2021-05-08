/*
* With an accuracy of two decimal places, determine the average amount of paint on the square.
*/
SELECT  CONVERT(NUMERIC(6,2), (SUM(ISNULL(B_VOL, 0)) * 1.0) / (SELECT COUNT(Q_ID) FROM utQ)) avg_paint
FROM utQ q
LEFT JOIN utB b ON b.B_Q_ID = q.Q_ID