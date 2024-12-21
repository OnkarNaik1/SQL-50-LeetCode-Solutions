WITH start1 AS(
SELECT machine_id,process_id, timestamp
FROM activity
WHERE activity_type = 'start'
),
end1 AS(
SELECT machine_id,process_id, timestamp
FROM activity
WHERE activity_type = 'end'
)
SELECT start1.machine_id, ROUND(AVG(end1.timestamp - start1.timestamp),3) AS processing_time 
FROM end1
INNER JOIN start1
ON end1.machine_id = start1.machine_id
AND end1.process_id = start1.process_id
GROUP BY 1;