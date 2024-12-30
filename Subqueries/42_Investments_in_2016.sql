SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016 
FROM insurance
WHERE tiv_2015
IN 
(
SELECT tiv_2015
FROM insurance
GROUP BY 1
HAVING COUNT(*) > 1
)
AND (lat,lon)
IN
(
SELECT lat,lon
FROM insurance
GROUP BY 1,2
HAVING COUNT(*) = 1
);