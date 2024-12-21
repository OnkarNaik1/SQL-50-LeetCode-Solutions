WITH cnts AS(
SELECT managerid, count(id) AS cnt
FROM employee
GROUP BY 1
HAVING cnt >=5
)
SELECT e.name 
FROM employee e
INNER JOIN cnts
ON cnts.managerid = e.id;