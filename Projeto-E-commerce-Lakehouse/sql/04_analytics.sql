-- 1. Faturamento total
SELECT
    SUM(total_amount) AS total_revenue
FROM gold_sales;

-- 2. Produtos mais vendidos
SELECT
    product_name,
    SUM(quantity) AS units_sold
FROM gold_sales
GROUP BY product_name
ORDER BY units_sold DESC;

-- 3. Faturamento por produto
SELECT
    product_name,
    SUM(total_amount) AS revenue
FROM gold_sales
GROUP BY product_name
ORDER BY revenue DESC;

-- 4. Faturamento por cidade
SELECT
    city,
    SUM(total_amount) AS revenue
FROM gold_sales
GROUP BY city
ORDER BY revenue DESC;

-- 5. Faturamento por categoria
SELECT
    category_name,
    SUM(total_amount) AS revenue
FROM gold_sales
GROUP BY category_name
ORDER BY revenue DESC;

-- 6. Cliente que mais gastou
SELECT
    customer_name,
    SUM(total_amount) AS total_spent
FROM gold_sales
GROUP BY customer_name
ORDER BY total_spent DESC;

-- 7. Ticket médio
SELECT
    ROUND(
        SUM(total_amount) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM gold_sales;

-- 8. Ranking dos produtos
SELECT
    product_name,
    SUM(total_amount) AS revenue,
    RANK() OVER (
        ORDER BY SUM(total_amount) DESC
    ) AS ranking
FROM gold_sales
GROUP BY product_name
ORDER BY ranking;

-- 9. Faturamento mensal
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS revenue
FROM gold_sales
GROUP BY month
ORDER BY month;

-- 10. Comparação com mês anterior
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(total_amount) AS revenue
    FROM gold_sales
    GROUP BY month
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month
FROM monthly_sales
ORDER BY month;
