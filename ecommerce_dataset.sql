-- SCHEMA

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    email TEXT,
    address TEXT
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_total DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category_id INT,
    price DECIMAL(10, 2)
);

-- Categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name TEXT
);

-- Order Items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_each DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- DATA

-- Insert into customers
INSERT INTO customers VALUES
(1, 'Alice', 'alice@example.com', 'New York'),
(2, 'Bob', 'bob@example.com', 'Los Angeles'),
(3, 'Carol', 'carol@example.com', 'Chicago');

-- Insert into categories
INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Home Appliances'),
(3, 'Accessories');

-- Insert into products
INSERT INTO products VALUES
(101, 'Laptop Pro 15', 1, 1200.00),
(102, 'Smartphone X', 1, 999.00),
(103, 'Blender', 2, 150.00),
(104, 'Headphones', 3, 199.00);

-- Insert into orders
INSERT INTO orders VALUES
(201, 1, '2023-01-05', 1350.00),
(202, 2, '2023-01-07', 999.00),
(203, 3, '2023-01-10', 199.00);

-- Insert into order_items
INSERT INTO order_items VALUES
(301, 201, 101, 1, 1200.00),
(302, 201, 104, 1, 150.00),
(303, 202, 102, 1, 999.00),
(304, 203, 104, 1, 199.00);
