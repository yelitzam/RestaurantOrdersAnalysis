-- objective 3 exploring both tables together

-- 1. Combine the menu_items and order_details tables into a single table
SELECT * FROM order_details o
JOIN menu_items m 
ON o.item_id = m.menu_item_id;

-- 2. What were the least and most ordered items? What categories are they in?
SELECT m.item_name, m.category, COUNT(m.menu_item_id) as total
FROM order_details o
JOIN menu_items m 
ON o.item_id = m.menu_item_id
GROUP BY m.menu_item_id
ORDER BY total DESC
LIMIT 1;

SELECT m.item_name, m.category, COUNT(m.menu_item_id) as total
FROM order_details o
JOIN menu_items m 
ON o.item_id = m.menu_item_id
GROUP BY m.menu_item_id
ORDER BY total
LIMIT 1;

-- 3. What were the top 5 orders that spent the most money?
SELECT o.order_id, SUM(m.price) as order_total
FROM order_details o
JOIN menu_items m 
ON o.item_id = m.menu_item_id
GROUP BY o.order_id
ORDER BY order_total DESC
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT * FROM order_details o
JOIN menu_items m 
ON o.item_id = m.menu_item_id
WHERE order_id = 440;
								-- a variety of different food items but italian plates are by far the popular.8 italian, 2 of the rest this makes sense since we previously
								-- saw that italian dishes are the more expensive option on average.

-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the results?
SELECT order_id, COUNT(order_id) as total_items FROM order_details o
JOIN menu_items m 
ON o.item_id = m.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id;

-- all the orders but one are made up of 14 items

SELECT category, COUNT(category) FROM order_details o
JOIN menu_items m 
ON o.item_id = m.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category;
-- the most ordered category is Italian the least being American

-- keep italian dishes since the higher orders consist of italian dishes whichbrings in money because they are also on average more expensive