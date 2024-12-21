WITH counts AS
(
SELECT s.user_id, c.action,count(s.user_id) AS confirm_count
FROM signups s
LEFT OUTER JOIN confirmations c
ON s.user_id = c.user_id
WHERE c.action = 'confirmed'
GROUP BY 1
)
SELECT s.user_id,  ROUND(COALESCE(counts.confirm_count/count(s.user_id),0),2) AS confirmation_rate 
FROM signups s
LEFT OUTER JOIN confirmations c
ON s.user_id = c.user_id
LEFT OUTER JOIN counts
ON counts.user_id = s.user_id
GROUP BY 1;