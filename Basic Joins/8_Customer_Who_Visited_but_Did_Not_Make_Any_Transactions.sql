SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans 
FROM visits v
LEFT OUTER JOIN transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY 1;