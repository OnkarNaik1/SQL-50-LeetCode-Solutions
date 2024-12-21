SELECT s.student_id, s.student_name, su.subject_name, COUNT(e.subject_name) AS attended_exams
FROM students s
CROSS JOIN subjects su
LEFT OUTER JOIN examinations e
ON s.student_id = e.student_id
AND e.subject_name = su.subject_name
GROUP BY 1,2,3
ORDER BY s.student_id,su.subject_name;