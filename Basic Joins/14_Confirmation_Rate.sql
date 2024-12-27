SELECT 
DISTINCT s.user_id, 
ROUND(COALESCE((SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id)),0),2) AS confirmation_rate
FROM signups s
LEFT OUTER JOIN confirmations c
ON s.user_id = c.user_id
GROUP BY 1;