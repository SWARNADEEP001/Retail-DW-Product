USE retail_dw;

-- Allow Local Data Load (if needed)
SET GLOBAL local_infile = 1;

-- Load dimension tables
LOAD DATA LOCAL INFILE 'data/customers.csv'
INTO TABLE dim_customer
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/products.csv'
INTO TABLE dim_product
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/stores.csv'
INTO TABLE dim_store
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load staging sales raw data
LOAD DATA LOCAL INFILE 'data/sales.csv'
INTO TABLE stg_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Populate dim_date from stg_sales
INSERT IGNORE INTO dim_date (date_key, year, month, day, month_name, quarter)
SELECT DISTINCT
    order_date AS date_key,
    YEAR(order_date),
    MONTH(order_date),
    DAY(order_date),
    DATE_FORMAT(order_date, '%M'),
    QUARTER(order_date)
FROM stg_sales;

-- Load fact table
INSERT INTO fact_sales (
    sales_id, date_key, customer_id, product_id, store_id,
    quantity, unit_price, discount_pct, gross_amount, net_amount
)
SELECT
    sales_id,
    order_date,
    customer_id,
    product_id,
    store_id,
    quantity,
    unit_price,
    discount_pct,
    (quantity * unit_price) AS gross_amount,
    (quantity * unit_price * (1 - discount_pct/100)) AS net_amount
FROM stg_sales;