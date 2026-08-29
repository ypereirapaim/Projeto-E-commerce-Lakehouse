CREATE OR REPLACE TABLE silver_customers AS
SELECT
    customer_id,
    TRIM(name) AS customer_name,
    TRIM(city) AS city,
    UPPER(TRIM(state)) AS state
FROM bronze_customers;

CREATE OR REPLACE TABLE silver_categories AS
SELECT
    category_id,
    TRIM(category_name) AS category_name
FROM bronze_categories;

CREATE OR REPLACE TABLE silver_products AS
SELECT
    product_id,
    TRIM(product_name) AS product_name,
    CAST(price AS DECIMAL(10,2)) AS price,
    category_id
FROM bronze_products;

CREATE OR REPLACE TABLE silver_orders AS
SELECT
    order_id,
    customer_id,
    CAST(order_date AS DATE) AS order_date
FROM bronze_orders;

CREATE OR REPLACE TABLE silver_order_items AS
SELECT
    order_id,
    product_id,
    CAST(quantity AS INTEGER) AS quantity
FROM bronze_order_items;
