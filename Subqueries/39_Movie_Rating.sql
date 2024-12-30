(
SELECT
u.name AS results
FROM movierating mr
INNER JOIN users u
ON u.user_id = mr.user_id
GROUP BY 1
ORDER BY  COUNT(mr.user_id) DESC,u.name
LIMIT 1
)

UNION ALL

(
SELECT
m.title AS results
FROM movies m
INNER JOIN movierating mr
ON mr.movie_id = m.movie_id
WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 1
ORDER BY  AVG(mr.rating) DESC,m.title
LIMIT 1
);