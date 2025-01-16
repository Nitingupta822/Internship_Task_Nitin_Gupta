create database retail_s;

use retail_s;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    join_date DATE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Customers VALUES
(1, 'Jay', 'Gupta', 'jay@gmail.com', '9874567890', '123 Elm Street', '2025-01-01'),
(2, 'Vineet', 'Mishra', 'vineet@gmail.com', '0987654321', '456 Oak Avenue', '2025-01-15'),
(3, 'Varun', 'Patail', 'varun@gmail.com', '9551234567', '789 Pine Lane', '2024-03-10'),
(4, 'Mohit', 'Jain', 'Mohit@gmail.com', '9349876543', '321 Maple Drive', '2024-04-05'),
(5, 'Abhay', 'Singh', 'abhay@gmail.com', '9336547890', '654 Cedar Road', '2024-05-20'),
(6, 'Vivek', 'Kushvaha', 'vivek@gmail.com', '9423456789', '987 Spruce Court', '2024-06-25'),
(7, 'Divya', 'Dwivedi', 'divya@gmail.com', '9775671234', '654 Birch Boulevard', '2024-07-30'),
(8, 'Bipeen', 'Gupta', 'bipeen@gmail.com', '8887893456', '321 Aspen Avenue', '2024-08-15'),
(9, 'Haider', 'Ansare', 'haider@gmail.com', '9998901234', '567 Willow Way', '2024-09-10'),
(10, 'Prakash', 'Mishra', 'prakash@gmail.com', '9112345678', '890 Redwood Terrace', '2024-10-05');

select * from Customers;

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 800.00, 50),
(2, 'Headphones', 'Electronics', 50.00, 200),
(3, 'Keyboard', 'Electronics', 30.00, 150),
(4, 'Mouse', 'Electronics', 20.00, 180),
(5, 'Chair', 'Furniture', 120.00, 60),
(6, 'Desk', 'Furniture', 200.00, 40),
(7, 'Notebook', 'Stationery', 5.00, 300),
(8, 'Pen', 'Stationery', 1.50, 500),
(9, 'Monitor', 'Electronics', 150.00, 70),
(10, 'Printer', 'Electronics', 120.00, 30);

select * from Products;

INSERT INTO Orders VALUES
(1, 1, '2024-09-01', 850.00, 'Shipped'),
(2, 2, '2024-09-05', 300.00, 'Pending'),
(3, 3, '2024-09-10', 500.00, 'Shipped'),
(4, 4, '2024-09-15', 100.00, 'Pending'),
(5, 5, '2024-09-20', 600.00, 'Shipped'),
(6, 6, '2024-09-25', 400.00, 'Pending'),
(7, 7, '2024-09-30', 50.00, 'Shipped'),
(8, 8, '2024-10-05', 75.00, 'Pending'),
(9, 9, '2024-10-10', 220.00, 'Shipped'),
(10, 10, '2024-10-15', 330.00, 'Pending');

select * from Orders;

INSERT INTO OrderDetails VALUES
(1, 1, 1, 1, 800.00),
(2, 1, 2, 1, 50.00),
(3, 2, 5, 2, 240.00),
(4, 2, 8, 10, 15.00),
(5, 3, 9, 3, 450.00),
(6, 3, 7, 10, 50.00),
(7, 4, 10, 2, 240.00),
(8, 4, 6, 1, 200.00),
(9, 5, 4, 1, 20.00),
(10, 6, 3, 3, 90.00);

select * from OrderDetails;

INSERT INTO Payments VALUES
(1, 1, '2024-09-02', 850.00, 'Credit Card'),
(2, 2, '2024-09-06', 300.00, 'UPI'),
(3, 3, '2024-09-11', 500.00, 'Credit Card'),
(4, 4, '2024-09-16', 100.00, 'Debit Card'),
(5, 5, '2024-09-21', 600.00, 'Credit Card'),
(6, 6, '2024-09-26', 400.00, 'UPI'),
(7, 7, '2024-10-01', 50.00, 'Debit Card'),
(8, 8, '2024-10-06', 75.00, 'Credit Card'),
(9, 9, '2024-10-11', 220.00, 'UPI'),
(10, 10, '2024-10-16', 330.00, 'Credit Card');

select * from Payments;

-- 1. Find the Total Number of Orders for Each Customer

SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
COUNT(o.order_id) AS total_orders FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;


-- 2. Find the Total Sales Amount for Each Product (Revenue per Product)

SELECT p.product_id,p.product_name,
SUM(od.quantity * od.unit_price) AS total_revenue
FROM Products p LEFT JOIN 
OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name;

-- 3. Find the Most Expensive Product Sold

SELECT p.product_id, p.product_name, p.price AS highest_price
FROM Products p WHERE 
p.price = (SELECT MAX(price) FROM Products);

-- 4. Get the List of Customers Who Have Placed Orders in the Last 30 Days

SELECT DISTINCT c.customer_id,
CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM Customers c INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

-- 5. Calculate the Total Amount Paid by Each Customer

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
SUM(p.payment_amount) AS total_amount_paid
FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 6. Get the Number of Products Sold by Category

SELECT p.category, SUM(od.quantity) AS total_products_sold
FROM Products p LEFT JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.category;

-- 7. List All Orders That Are Pending (i.e., Orders that haven't been shipped yet)

SELECT o.order_id, CONCAT(c.first_name, ' ', c.last_name) AS 
customer_name, o.order_date, o.total_amount FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'Pending';

-- 8. Find the Average Order Value (Total Order Amount / Number of Orders)

SELECT AVG(total_amount) AS average_order_value
FROM Orders;

-- 9. List the Top 5 Customers Who Have Spent the Most Money

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
SUM(o.total_amount) AS total_spent FROM Customers c INNER JOIN Orders o ON 
c.customer_id = o.customer_id GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC LIMIT 5;

-- 10. Find the Products That Have Never Been Sold

SELECT p.product_id, p.product_name FROM Products p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
WHERE od.product_id IS NULL;
