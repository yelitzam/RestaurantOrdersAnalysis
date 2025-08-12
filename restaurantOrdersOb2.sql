-- Objective one: exploring the order_details table

-- 1. View the order_details table
SELECT * FROM order_details;

-- 2. What is the date range of the table?
SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- 3. How many orders were made within this date range?
SELECT COUNT(distinct order_id) 
FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT COUNT(order_details_id)
FROM order_details;

-- 5. Which orders had the most number of items?
SELECT order_id, COUNT(item_id) as num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT COUNT(*) FROM 
	(
	SELECT order_id, COUNT(item_id) as num_items  -- this gives us all the orders with more than 12 items
	FROM order_details
	GROUP BY order_id
	HAVING num_items > 12
    ) as num_orders;