SELECT *
FROM orders;

--Find the number of orders placed by each customer.

SELECT user_id,COUNT(*) AS number_of_orders
FROM orders
GROUP BY user_id
ORDER BY number_of_orders DESC;



--Find the total amount spent by each customer.

SELECT user_id,SUM(total_amount) AS amount_spent_on_each
FROM orders
GROUP BY user_id
ORDER BY amount_spent_on_each DESC;


--Find the average order amount.

SELECT ROUND(AVG(total_amount),2) AS average_order_amount
FROM orders;



--Find the number of orders for each order status.

SELECT order_status,count(order_id) AS number_of_orders
FROM orders
GROUP BY order_status;


--Find the customers who have placed more than 3 orders.

SELECT user_id,count(order_id) AS total_orders
FROM orderS
GROUP BY user_id
HAVING count(order_id)>3
ORDER BY total_orders DESC;



--Find the highest order amount.

SELECT MAX(total_amount) AS highest_order_amount
FROM orders;


--Find the top 10 customers by total spending.

SELECT user_id,SUM(total_amount) AS total_spending
FROM orders
GROUP BY user_id
ORDER BY total_spending DESC
LIMIT 10;


SELECT *
FROM products;

--Find the number of products in each category.

SELECT category,COUNT(product_id) AS number_of_products
FROM products
GROUP BY category;


--Find the average product price for each category.

SELECT category,ROUND(AVG(price),2) AS price_per_category
FROM products
GROUP BY category;


--Find the products with a rating greater than 4.5.

SELECT product_name,rating
FROM products
WHERE rating>4.5;


SELECT *
FROM users;


--Display the customer name and their order amount.

SELECT name, total_amount
FROM users u
JOIN orders o
ON u.user_id=o.user_id;


--Find customers who have never placed an order.

SELECT name,user_id,total_amount
FROM orders o
JOIN users u
ON u.user_i
WHERE total_amount=0;


--Find the total amount spent by each customer, showing their name instead of just user_id.

SELECT name,SUM(total_amount) AS total_spending 
FROM users u 
RIGHT JOIN orders o 
ON u.user_id=o.user_id 
GROUP BY name 
ORDER BY total_spending DESC;


--Find the number of orders placed by customers from each city.

SELECT city,count(order_id) AS num_of_orders
FROM orders o
JOIN users u
ON u.user_id=o.user_id
GROUP BY city
ORDER BY num_of_orders DESC;


--Find the top 10 customers by total spending, along with their name and city.

SELECT name,city, SUM(total_amount) AS total_spending
FROM orders o
JOIN users u
ON o.user_id=u.user_id
GROUP BY name,city
ORDER BY total_spending DESC
LIMIT 10;


--Find the total quantity sold for each product.

SELECT *
FROM order_items;

SELECT *
FROM products;

SELECT product_name,SUM(quantity) AS total_quantity
FROM products p
JOIN order_items o
ON p.product_id=o.product_id
GROUP BY product_name
ORDER BY total_quantity DESC;


--Find the top 10 products by total sales amount.

SELECT product_name,SUM(item_total) AS total_sales_amount
FROM products p
JOIN order_items o
ON p.product_id=o.product_id
GROUP BY product_name
ORDER BY total_sales_amount DESC
LIMIT 10;


--Find the total sales for each product category.

SELECT category,SUM(item_total) AS total_sales_amount
FROM products p
JOIN order_items o
ON p.product_id=o.product_id
GROUP BY category
ORDER BY total_sales_amount DESC;


--Find the average order value for each customer.

SELECT *
FROM users;

SELECT *
FROM orders;


SELECT name,ROUND(AVG(total_amount),2) AS avg_item_price
FROM users u
JOIN orders o
ON u.user_id=o.user_id
WHERE order_status='completed'
GROUP BY name
ORDER BY avg_item_price DESC;
