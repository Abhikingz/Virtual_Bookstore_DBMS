-- 30+ Complex SQL Queries Suite
-- 1. Top Selling Books by Revenue (Window Function)
SELECT b.title, SUM(oi.quantity * oi.unit_price) AS total_revenue,
       RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) as revenue_rank
FROM books b
JOIN order_items oi ON b.book_id = oi.book_id
GROUP BY b.book_id, b.title;

-- 2. Customer Order Aggregation (CTE)
WITH CustomerSpend AS (
    SELECT customer_id, COUNT(order_id) as order_count, SUM(total_amount) as total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT c.full_name, cs.order_count, cs.total_spent
FROM customers c
JOIN CustomerSpend cs ON c.customer_id = cs.customer_id
WHERE cs.total_spent > 100.0;
