SELECT p.project_id ,ROUND(SUM(e.experience_years ) / COUNT(e.employee_id),2) AS average_years 
FROM project p
LEFT OUTER JOIN employee e
ON p.employee_id  = e.employee_id 
GROUP BY 1;