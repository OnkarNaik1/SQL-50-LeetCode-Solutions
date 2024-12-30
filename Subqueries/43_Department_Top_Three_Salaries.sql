SELECT Department, Employee, Salary
FROM
(
SELECT d.name AS Department , e.name AS Employee , e.salary AS Salary,
DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS dr
FROM employee e
INNER JOIN department d
ON e.departmentid = d.id
)A
WHERE dr BETWEEN 1 AND 3;