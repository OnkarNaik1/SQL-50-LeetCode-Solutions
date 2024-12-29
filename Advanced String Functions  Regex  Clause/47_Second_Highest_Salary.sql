SELECT COALESCE(MAX(salary),NULL) AS SecondHighestSalary 
FROM employee
WHERE salary NOT IN (SELECT MAX(salary) FROM employee);