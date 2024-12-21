SELECT w2.Id
FROM weather w1
INNER JOIN weather w2
ON DATEDIFF(w2.recorddate, w1.recorddate) = 1
WHERE w2.temperature > w1.temperature;
