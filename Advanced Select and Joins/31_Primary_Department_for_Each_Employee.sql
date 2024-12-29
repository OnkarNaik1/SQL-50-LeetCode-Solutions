SELECT employee_id, department_id
FROM employee
WHERE  primary_flag = 'Y'
OR employee_id IN
(
SELECT employee_id
FROM employee GROUP BY 1
HAVING COUNT(department_id) = 1 
);
