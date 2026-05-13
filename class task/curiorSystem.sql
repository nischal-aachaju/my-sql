create database curior;

create table  customer(
customer_id			 INT PRIMARY KEY AUTO_INCREMENT,
customer_name 		 VARCHAR(100) NOT NULL,
email 				 VARCHAR(150) UNIQUE,
phone 				 VARCHAR(15),
city 				 VARCHAR(100),
created_at    		 TIMESTAMP DEFAULT current_timestamp
);

INSERT INTO customer (customer_name, email, phone, city) VALUES
('Nischal Shrestha',   'nischal@gmail.com',  '9801234567', 'Kathmandu'),
('Anurag Sharma',   'anurag@gmail.com',   '9812345678', 'Pokhara'),
('Priya Patel',     'priya@gmail.com',    '9823456789', 'Lalitpur'),
('Rohan Gurung',    'rohan@gmail.com',    '9834567890', 'Bhaktapur'),
('Sita Rai',        'sita@gmail.com',     '9845678901', 'Chitwan'),
('Bikash Limbu',    'bikash@gmail.com',   '9856789012', 'Butwal'),
('Anita Karki',     'anita@gmail.com',    '9867890123', 'Dharan'),
('Suraj Magar',     'suraj@gmail.com',    '9878901234', 'Biratnagar'),
('Kamala Tamang',   'kamala@gmail.com',   '9889012345', 'Hetauda'),
('Dev Shrestha',    'dev@gmail.com',      '9890123456', 'Janakpur');

CREATE TABLE orders(
order_id 			INT PRIMARY KEY auto_increment,
customer_id			INT,
product_name    	VARCHAR(100) NOT NULL,
quality				INT,
price 				DECIMAL(10,2),
order_date 			DATE,
status				VARCHAR(20) DEFAULT 'Pending',
FOREIGN KEY (customer_id )references customer(customer_id)
);

INSERT INTO orders (customer_id, product_name, quality, price, order_date, status) VALUES
(1,  'Gaming Laptop',    2, 185000.00, '2025-01-05', 'Delivered'),
(2,  'Smartphone',       1,  45000.00, '2025-01-12', 'Pending'),
(3,  'Wireless Headset', 3,  22000.00, '2025-02-03', 'Shipped'),
(4,  'Smart TV 55"',     1, 120000.00, '2025-02-18', 'Delivered'),
(5,  'Mechanical Keyboard', 2, 28000.00, '2025-03-07', 'Pending'),
(6,  'Gaming Monitor',   1, 95000.00, '2025-03-22', 'Cancelled'),
(7,  'Laptop Stand',     4,  21000.00, '2025-04-01', 'Shipped'),
(8,  'RTX 4060 GPU',     1, 175000.00, '2025-04-15', 'Delivered'),
(9,  'USB-C Hub',        5,  20500.00, '2025-05-02', 'Pending'),
(10, 'Webcam 4K',        2,  35000.00, '2025-05-10', 'Shipped');

select * from orders;

select customer_name,city from customer; -- 2 qn
select * from customer where city="kathmandu"; -- 3qn
select * from orders where `status`="delivered"; -- 4qn
alter table customer add column gender  enum("male","female","others") after customer_name; -- 5qn
select count(customer_id) from customer; -- 6qn
select max(price),product_name
 from orders 
 group by product_name
  order by max(price) desc limit 1;
  
select max(price) from orders;



