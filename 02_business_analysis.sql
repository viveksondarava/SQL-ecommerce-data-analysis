-- ============================================================
-- PROJECT: E-Commerce Sales & Customer Analytics
-- FILE: 02_business_analysis.sql
-- ============================================================
USE ecommerce_analysis;

-- Q1. Total revenue across all order items
SELECT ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM order_items;

-- Q2. Total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Q3. Total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Q4. Revenue by product category
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Q5. Top 10 products by revenue
SELECT
    p.product_name,
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;

-- Q6. Top 10 customers by revenue across all order statuses
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_revenue DESC
LIMIT 10;

-- Q7. Order status distribution
SELECT
    status,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS percentage_of_orders
FROM orders
GROUP BY status
ORDER BY total_orders DESC;

-- Q8. Monthly revenue trend
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- Q9. Business-friendly order classification using CASE WHEN
SELECT
    order_id,
    status,
    CASE
        WHEN status = 'Completed' THEN 'Successful'
        WHEN status = 'Cancelled' THEN 'Cancelled'
        WHEN status = 'Returned' THEN 'Returned'
        ELSE 'Other'
    END AS order_category
FROM orders
ORDER BY order_id;

-- Q10. Revenue from completed orders only
SELECT
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Completed';
