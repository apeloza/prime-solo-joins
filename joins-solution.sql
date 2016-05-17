--Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON addresses.customer_id = customers.id;
--Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON orders.id = line_items.order_id;
--Which warehouses have cheetos?
SELECT * FROM warehouse
JOIN warehouse_product ON warehouse_product.warehouse_id = warehouse.id
JOIN products ON products.id = warehouse_product.product_id WHERE product_id = 5
--Which warehouses have diet pepsi?
SELECT * FROM warehouse
JOIN warehouse_product ON warehouse_product.warehouse_id = warehouse.id
JOIN products ON products.id = warehouse_product.product_id WHERE product_id = 6;
--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT(orders.id) FROM customers
JOIN addresses ON addresses.customer_id = customers.id
JOIN orders ON orders.address_id = addresses.id
GROUP BY(customers.first_name, customers.last_name);
--How many customers do we have?
SELECT COUNT(customers.id) FROM customers
--How many products do we carry?
SELECT COUNT(products.id) FROM products
--What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) FROM warehouse_product WHERE product_id = 6
