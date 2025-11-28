USE retail_dw;

-- Dimension tables (InfoObjects equivalent)
CREATE TABLE IF NOT EXISTS dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(150),
    customer_segment VARCHAR(50),
    customer_city VARCHAR(100),
    customer_state VARCHAR(100),
    customer_country VARCHAR(100),
    signup_date DATE
);

CREATE TABLE IF NOT EXISTS dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    brand VARCHAR(100),
    unit_price DECIMAL(10,2),
    cost_price DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(150) NOT NULL,
    store_city VARCHAR(100),
    store_state VARCHAR(100),
    store_region VARCHAR(50),
    store_type VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dim_date (
    date_key DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    month_name VARCHAR(20),
    quarter INT
);

-- Staging layer (like BW Staging ADSO)
CREATE TABLE IF NOT EXISTS stg_sales (
    sales_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    store_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_pct DECIMAL(5,2)
);

-- Fact table (BW ADSO / Fact)
CREATE TABLE IF NOT EXISTS fact_sales (
    sales_id INT PRIMARY KEY,
    date_key DATE,
    customer_id INT,
    product_id INT,
    store_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_pct DECIMAL(5,2),
    gross_amount DECIMAL(12,2),
    net_amount DECIMAL(12,2),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);