SELECT customer_id
FROM customer 
GROUP BY 1
HAVING COUNT(DISTINCT product_key) = 
(SELECT COUNT(product_key) FROM product);