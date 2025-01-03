-- WITH DRNK AS(
-- SELECT customer_id,delivery_id,order_date,customer_pref_delivery_date ,
-- DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS DR 
-- FROM delivery
-- )
-- SELECT ROUND(((SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)*100)/COUNT(delivery_id)),2) AS immediate_percentage 
-- FROM DRNK
-- WHERE DR = 1;

SELECT ROUND(((SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)*100)/COUNT(delivery_id)),2) AS immediate_percentage 
FROM delivery
WHERE (customer_id, order_date)
IN (
SELECT customer_id, MIN(order_date) 
FROM delivery
GROUP BY 1
);