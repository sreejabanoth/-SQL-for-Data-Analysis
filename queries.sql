
-- 1. Top 10 products based on price
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 10;

-- 2. Orders from January
SELECT * FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-31';

-- 3. Total sales per customer
SELECT customer_id, SUM(order_total) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 4. Average product price per category
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- 5. Customer orders using INNER JOIN
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- 6. Product categories using LEFT JOIN
SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;

-- 7. Customers spending more than average
SELECT customer_id, SUM(order_total) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > (
    SELECT AVG(order_total) FROM orders
);

-- 8. View for top-selling products
CREATE VIEW top_selling_products AS
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC;

-- 9. Select from view
SELECT * FROM top_selling_products;

-- 10. Create indexes
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_category_id ON products(category_id);
