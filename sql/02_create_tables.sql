-- customers
CREATE TABLE apparel.customers (
    customer_id SERIAL PRIMARY KEY,
    customer_code VARCHAR(50) UNIQUE,
    gender VARCHAR(10),
    age_group VARCHAR(20),
    region VARCHAR(50),
    membership_rank VARCHAR(20),
    registered_at TIMESTAMP
);

-- products
CREATE TABLE apparel.products (
    product_id SERIAL PRIMARY KEY,
    sku_code VARCHAR(50) UNIQUE,
    product_name VARCHAR(255),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    brand VARCHAR(100),
    season VARCHAR(50),
    unit_price NUMERIC(10,2),
    cost NUMERIC(10,2)
);

-- stores
CREATE TABLE apparel.stores (
    store_id SERIAL PRIMARY KEY,
    store_code VARCHAR(50) UNIQUE,
    store_name VARCHAR(255),
    area VARCHAR(100),
    store_type VARCHAR(50)
);

-- campaigns
CREATE TABLE apparel.campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(255),
    channel VARCHAR(50),
    start_date DATE,
    end_date DATE,
    budget NUMERIC(12,2),
    target_segment VARCHAR(100)
);

-- pos_sales
CREATE TABLE apparel.pos_sales (
    pos_sale_id SERIAL PRIMARY KEY,
    sale_datetime TIMESTAMP,
    store_id INT REFERENCES apparel.stores(store_id),
    customer_id INT REFERENCES apparel.customers(customer_id),
    product_id INT REFERENCES apparel.products(product_id),
    quantity INT,
    unit_price NUMERIC(10,2),
    discount_amount NUMERIC(10,2),
    total_amount NUMERIC(12,2)
);

-- ec_orders
CREATE TABLE apparel.ec_orders (
    ec_order_id SERIAL PRIMARY KEY,
    order_datetime TIMESTAMP,
    customer_id INT REFERENCES apparel.customers(customer_id),
    product_id INT REFERENCES apparel.products(product_id),
    quantity INT,
    unit_price NUMERIC(10,2),
    discount_amount NUMERIC(10,2),
    total_amount NUMERIC(12,2),
    order_status VARCHAR(50)
);

-- inventory_snapshots
CREATE TABLE apparel.inventory_snapshots (
    inventory_snapshot_id SERIAL PRIMARY KEY,
    snapshot_date DATE,
    store_id INT REFERENCES apparel.stores(store_id),
    product_id INT REFERENCES apparel.products(product_id),
    stock_qty INT
);