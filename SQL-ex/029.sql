SELECT COALESCE(inc.[point], outc.[point]) point,
       COALESCE(inc.[date], outc.[date]) date,
       inc.inc,
       outc.out
FROM Income_o inc
     FULL JOIN Outcome_o outc ON inc.point = outc.point
                                 AND inc.date = outc.date;