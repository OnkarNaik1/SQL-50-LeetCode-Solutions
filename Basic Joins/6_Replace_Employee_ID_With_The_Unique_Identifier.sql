SELECT eu.unique_id, e.name
FROM employees e
LEFT OUTER JOIN employeeuni eu
ON e.id = eu.id;