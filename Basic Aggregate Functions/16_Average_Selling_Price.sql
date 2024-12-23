SELECT p.product_id, COALESCE(ROUND(SUM( p.price * u.units)/SUM(u.units),2),0) AS average_price 
FROM prices p
LEFT OUTER JOIN unitssold u
ON u.purchase_date BETWEEN p.start_date AND p.end_date
AND p.product_id = u.product_id
GROUP BY 1;