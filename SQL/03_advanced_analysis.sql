-- ============================================================
-- PROJECT: E-Commerce Sales & Customer Analytics
-- FILE: 03_advanced_analysis.sql
-- ============================================================
USE ecommerce_analysis;

-- Q11. Top customers by completed-order revenue using a CTE
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, c.city
)
SELECT
    customer_id,
    customer_name,
    city,
    completed_revenue
FROM customer_revenue
ORDER BY completed_revenue DESC
LIMIT 10;

-- Q12. Customer ranking using a window function
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, c.city
)
SELECT
    customer_id,
    customer_name,
    city,
    completed_revenue,
    RANK() OVER (ORDER BY completed_revenue DESC) AS revenue_rank
FROM customer_revenue
ORDER BY revenue_rank;

-- Q13. Customer contribution to completed revenue
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        SUM(oi.quantity * oi.unit_price) AS completed_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, c.city
)
SELECT
    customer_id,
    customer_name,
    city,
    ROUND(completed_revenue, 2) AS completed_revenue,
    ROUND(
        completed_revenue * 100.0 /
        SUM(completed_revenue) OVER (),
        2
    ) AS revenue_contribution_pct
FROM customer_revenue
ORDER BY completed_revenue DESC;

-- Q14. Monthly completed revenue
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- Q15. Category revenue from completed orders
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY completed_revenue DESC;
