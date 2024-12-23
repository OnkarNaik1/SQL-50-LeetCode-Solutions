WITH user_count AS (
SELECT COUNT(user_id)AS cnt FROM users 
)
SELECT r.contest_id, ROUND(COUNT(r.user_id)*100 /(SELECT cnt FROM user_count),2) AS percentage
FROM users u
INNER JOIN register r
ON u.user_id = r.user_id
GROUP BY 1
ORDER BY percentage DESC, r.contest_id;