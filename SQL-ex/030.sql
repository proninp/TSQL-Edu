SELECT COALESCE(inc.[point], outc.[point]) point,
       COALESCE(inc.[date], outc.[date]) date,
       SUM(outc.out) out,
       SUM(inc.inc) inc
FROM Income inc
     FULL JOIN Outcome outc ON 1 = 0
GROUP BY COALESCE(inc.[point], outc.[point]),
         COALESCE(inc.[date], outc.[date]);