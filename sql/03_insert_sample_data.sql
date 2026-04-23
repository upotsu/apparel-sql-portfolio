-- customers
INSERT INTO apparel.customers
(customer_code, gender, age_group, region, membership_rank, registered_at)
VALUES
('CUST001', 'F', '20s', 'Tokyo', 'Gold', '2025-01-15 10:00:00'),
('CUST002', 'M', '30s', 'Osaka', 'Silver', '2025-02-10 11:30:00'),
('CUST003', 'F', '40s', 'Kanagawa', 'Bronze', '2025-03-05 09:15:00');

-- products
INSERT INTO apparel.products
(sku_code, product_name, category, subcategory, brand, season, unit_price, cost)
VALUES
('SKU001', 'Classic Jacket', 'Outer', 'Jacket', 'UrbanLine', '2025SS', 12000.00, 6000.00),
('SKU002', 'Slim Pants', 'Bottoms', 'Pants', 'UrbanLine', '2025SS', 8000.00, 3500.00),
('SKU003', 'Logo T-Shirt', 'Tops', 'T-Shirt', 'StreetFit', '2025SS', 4500.00, 1800.00);

-- stores
INSERT INTO apparel.stores
(store_code, store_name, area, store_type)
VALUES
('ST001', 'Shibuya Store', 'Tokyo', 'Retail'),
('ST002', 'Umeda Store', 'Osaka', 'Retail'),
('ST003', 'Nagoya Store', 'Aichi', 'Retail');

-- campaigns
INSERT INTO apparel.campaigns
(campaign_name, channel, start_date, end_date, budget, target_segment)
VALUES
('Spring SNS Campaign', 'Instagram', '2025-03-01', '2025-03-31', 300000.00, '20s Female'),
('New Customer Ads', 'Google Ads', '2025-03-10', '2025-04-10', 500000.00, 'New Visitors'),
('Repeat Buyer Push', 'LINE', '2025-03-15', '2025-04-15', 150000.00, 'Existing Customers');

-- pos_sales
INSERT INTO apparel.pos_sales
(sale_datetime, store_id, customer_id, product_id, quantity, unit_price, discount_amount, total_amount)
VALUES
('2025-03-20 14:30:00', 1, 1, 1, 1, 12000.00, 1000.00, 11000.00),
('2025-03-20 15:10:00', 2, 2, 2, 2, 8000.00, 0.00, 16000.00),
('2025-03-21 11:45:00', 1, 3, 3, 1, 4500.00, 500.00, 4000.00);

-- ec_orders
INSERT INTO apparel.ec_orders
(order_datetime, customer_id, product_id, quantity, unit_price, discount_amount, total_amount, order_status)
VALUES
('2025-03-22 09:20:00', 1, 2, 1, 8000.00, 500.00, 7500.00, 'completed'),
('2025-03-22 10:05:00', 2, 3, 2, 4500.00, 0.00, 9000.00, 'completed'),
('2025-03-23 18:40:00', 3, 1, 1, 12000.00, 2000.00, 10000.00, 'pending');

-- inventory
INSERT INTO apparel.inventory_snapshots
(snapshot_date, store_id, product_id, stock_qty)
VALUES
('2025-03-20', 1, 1, 10),
('2025-03-20', 1, 2, 5),
('2025-03-20', 2, 1, 8),
('2025-03-21', 1, 1, 7),
('2025-03-21', 2, 2, 6),
('2025-03-21', 1, 3, 9);