SELECT e.employee_id , e.name, COUNT(e.employee_id) AS reports_count, ROUND(AVG(e1.age)) AS average_age
FROM employees e
INNER JOIN employees e1
ON e.employee_id = e1.reports_to
GROUP BY 1,2
ORDER BY e.employee_id;