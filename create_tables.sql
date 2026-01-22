create database sales_inventory_management;
use sales_inventory_management;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    stock_qty INT,
    price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity_sold INT,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO products (product_name, stock_qty, price) VALUES
('Laptop', 30, 55000.00),
('Mobile Phone', 60, 18000.00),
('Wireless Mouse', 120, 750.00),
('Keyboard', 90, 1200.00),
('Headphones', 70, 2200.00),
('Smart Watch', 40, 8500.00),
('Tablet', 35, 22000.00),
('Bluetooth Speaker', 55, 3200.00),
('External Hard Disk', 25, 6500.00),
('USB Pen Drive', 150, 900.00);

select * from products;