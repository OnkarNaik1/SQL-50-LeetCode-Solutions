-- WITH DRNK AS
-- (
-- SELECT player_id,event_date,
-- DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS rnk
-- FROM activity
-- )
-- SELECT 
-- ROUND((COUNT(DISTINCT a.player_id)/(SELECT COUNT(DISTINCT player_id) FROM activity)),2) AS fraction
-- FROM activity a
-- INNER JOIN DRNK b
-- ON DATEDIFF(b.event_date, a.event_date) = 1
-- AND a.player_id = b.player_id
-- WHERE rnk IN (1,2);

SELECT 
ROUND((COUNT(DISTINCT player_id)/(SELECT COUNT(DISTINCT player_id) FROM activity)),2) AS fraction
FROM activity 
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY))
IN (
SELECT player_id, MIN(event_date)
FROM activity
GROUP BY 1
);