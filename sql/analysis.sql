/* Top customers by total revenue */
SELECT
    customers.customer_id,
    SUM(transactions.revenue) AS total_revenue,
    COUNT(DISTINCT transactions.invoice_id) AS total_orders
FROM transactions
INNER JOIN customers ON transactions.customer_id = customers.customer_id
GROUP BY customers.customer_id
ORDER BY total_revenue DESC;

/* Number of customers who place more than one order */
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT
        customer_id,
        COUNT(DISTINCT invoice_id) AS order_count
    FROM transactions
    GROUP BY customer_id
) sub
GROUP BY customer_type;


/* Top selling products by number of orders */
SELECT
    products.product_id,
    products.product_name,
    COUNT(DISTINCT transactions.invoice_id) AS total_orders
FROM transactions
INNER JOIN products
    ON transactions.product_id = products.product_id
GROUP BY products.product_id, products.product_name
ORDER BY total_orders DESC;

/* Countries that generate the most revenue */
SELECT
    t.country,
    SUM(t.revenue) AS total_revenue
FROM transactions t
GROUP BY t.country
ORDER BY total_revenue DESC;



