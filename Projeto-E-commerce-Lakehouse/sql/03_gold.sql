CREATE OR REPLACE TABLE gold_sales AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    c.customer_name,
    c.city,
    c.state,
    p.product_id,
    p.product_name,
    cat.category_id,
    cat.category_name,
    oi.quantity,
    p.price,
    CAST(oi.quantity * p.price AS DECIMAL(12,2)) AS total_amount
FROM silver_orders o
JOIN silver_customers c
    ON o.customer_id = c.customer_id
JOIN silver_order_items oi
    ON o.order_id = oi.order_id
JOIN silver_products p
    ON oi.product_id = p.product_id
JOIN silver_categories cat
    ON p.category_id = cat.category_id;
