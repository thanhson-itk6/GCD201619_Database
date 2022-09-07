CREATE DATABASE QLBHFPT

USE QLBHFPT

CREATE TABLE customers(

 customer_id  CHAR(4) NOT NULL  PRIMARY KEY,
 customer_name VARCHAR (100) NOT NULL,
 customer_mail VARCHAR(100),
 customer_address VARCHAR(100),
 customer_phone VARCHAR(100),
);
insert into customers VALUES
('KH01','Duong Van Thanh Son','thanhsonitk6@gmail.com','62 An Duong Vuong, Hoi AN','8823451'),
('KH02','Ly Ngoc Hieu','ngochieuitk6@gmail.com','23 Hung Vuong, Hoi An','908256478'),
('KH03','Trinh Le Nguyen','lenguyenitk6@gmail.com','45 Cam Chau, Hoi An','938776266'),
('KH04','Nguyen Tran Kim Vi','kimviitk6@gmail.com','50 Thanh Ha, Hoi An','917325476'),
('KH05','Le Duy Duc ','duyducitk6@gmail.com','34 Cam Chau, Hoi An','8246108'),
('KH06','Ho Duc Tan','ductanitk6@gmail.com','227 Triem Trung, Dien Ban','8631738'),
('KH07','Tong Quoc Hai','quochaiitk6@gmail.com','32/3 Cam Ha, Hoi An','916783565'),
('KH08','Le Doan Phu','duyducitk6@gmail.com','45 An Duong Vuong, Dien Duong','938435756'),
('KH09','Nguyen Minh Huy','minhuyitk6@gmail.com','873 Dien Hoa, Dien Ban','8654763'),
('KH10','Le Thanh Huy','thanhhuyitk6@gmail.com','34/34B Cam Thanh, Hoi An','8768904')

CREATE TABLE salespersons(
 salesperson_id  CHAR(4) NOT NULL  PRIMARY KEY,
 salesperson_name  VARCHAR(100) NOT NULL UNIQUE,
 salesperson_phone  VARCHAR(100) NOT NULL UNIQUE,
 salesperson_age INT,
 salesperson_mail VARCHAR(100) NOT NULL UNIQUE,
);
insert into salespersons VALUES
('NV01','Nguyen Hoang Lieu','927345678',20,'hoanglieuitk6@gmail.com'),
('NV02','Hua Thi Yen Le','987567390',20,'yenleitk6@gmail.com'),
('NV03','Huynh Xuan Dieu','997047382',20,'xuandieuitk6@gmail.com'),
('NV04','Vo Thanh Tuan','913758498',20,'thanhtuanitk6@gmail.com'),
('NV05','Duong Thi Cam Gam','918590387',21,'camgamv6k6@gmail.com')
CREATE TABLE stores(
	stores_id CHAR(5) NOT NULL  PRIMARY KEY,
	stores_name VARCHAR(100) NOT NULL UNIQUE ,
	stores_adress VARCHAR(100) NOT NULL,
	stores_mail  VARCHAR(100) NOT NULL UNIQUE ,
	stores_phone VARCHAR(100) NOT NULL,
);
insert into stores VALUES
('FPT01','FPT Ly Thuong Kiet','1771 Ly Thuong Kiet, Hoi An ','FptLy Thuong Kiet@.fpt.com','29292929'),
('FPT02','FPT Cam Chau','947 Cam Chau, Hoi An','FptCam Chau@.fpt.com','7272729'),
('FPT03','FPT Vinh Dien','4508 Vinh Dien, Dien Ban','FptVinh Dien@.fpt.com','9292929'),
('FPT04','FPT Dien Nam','11750 Dien Nam, Dien Ban','FptDien Nam@.fpt.com','2942925929'),
('FPT05','FPT Dien Duong','728 Dien Duong, Dien Ban','FptDien Duong@.fpt.com','292329247929');


CREATE TABLE brands
(
 brand_id  CHAR(4) NOT NULL PRIMARY KEY,
 brand_name  VARCHAR(100) NOT NULL unique,
);
insert into brands VALUES
('H01','Apple'),
('H02','Xiaomi'),
('H03','Samsung'),
('H04','Huawei'),
('H05','Oppo');


CREATE TABLE products
(
 product_id  CHAR(6)  NOT NULL PRIMARY KEY,
 product_kind VARCHAR(100) NOT NULL unique ,
 product_price  MONEY NOT NULL,
 brand_id CHAR(4) NOT NULL FOREIGN  KEY (brand_id) REFERENCES brands(brand_id)
);


INSERT INTO products VALUES
('Pro01','Iphone 13 mini',5290000,'H01'),
('Pro02','Macbook Pro M1 13-inch',7990000,'H01'),
('Pro03','Airpods 2nd',4490000,'H01'),
('Pro04','Ipad mini',10990000,'H01'),
('Pro05','Galaxy S22 Ultra',2690000,'H03'),
('Pro06','Galaxy Buds2',4690000,'H03'),
('Pro07','Redmi Note 9 Pro',2850000,'H04'),
('Pro08','Nova 9 5G',2690000,'H02'),
('Pro09','Reno 7 Z 5G',3490000,'H02'),
('Pro010','Oppo Pad',3890000,'H05');


CREATE TABLE orders(
order_id CHAR(5) NOT NULL  PRIMARY KEY,
order_day  DATE default GETDATE(),
customer_id CHAR(4)  NOT NULL FOREIGN KEY  (customer_id) REFERENCES customers (customer_id),
salesperson_id CHAR(4)  NOT NULL FOREIGN  KEY (salesperson_id) REFERENCES salespersons (salesperson_id),
stores_id CHAR(5) FOREIGN  KEY  (stores_id) REFERENCES stores (stores_id),
totalprice MONEY  NOT NULL
);

insert into  orders VALUES
(1001,'2021/1/2','KH01','NV01','FPT01',15870000),
(1002,'2021/1/2','KH02','NV01','FPT01',39950000),
(1003,'2021/1/2','KH03','NV02','FPT02',26940000),
(1004,'2021/1/3','KH04','NV02','FPT02',10990000),
(1005,'2021/1/3','KH05','NV03','FPT03',5380000),
(1006,'2021/1/5','KH06','NV03','FPT03',14070000),
(1007,'2021/1/5','KH07','NV04','FPT04',11400000),
(1008,'2021/2/13','KH08','NV05','FPT04',13450000),
(1009,'2021/2/14','KH09','NV05','FPT05',6980000),
(1010,'2021/2/15','KH10','NV05','FPT05',11670000);

CREATE TABLE order_detail(

order_id CHAR(5)  NOT NULL FOREIGN KEY   (order_id) REFERENCES orders (order_id),
product_id CHAR(6)  NOT NULL FOREIGN  KEY (product_id) REFERENCES products(product_id),
CONSTRAINT PK_order_detail PRIMARY KEY ( order_id,product_id),
order_quantity INT  NOT NULL,
);

insert into order_detail VALUES
(1001,'Pro01',3),
(1002,'Pro02',5),
(1003,'Pro03',6),
(1004,'Pro04',1),
(1005,'Pro05',2),
(1006,'Pro06',3),
(1007,'Pro07',4),
(1008,'Pro08',5),
(1009,'Pro09',2),
(1010,'Pro010',3)

SELECT * FROM dbo.customers
SELECT * FROM dbo.salespersons
SELECT * FROM dbo.stores
SELECT * FROM dbo.brands
SELECT * FROM dbo.products
SELECT * FROM dbo.orders
SELECT * FROM dbo.order_detail

--Update dbo.salespersons---
--Set salesperson_phone = '686868'
--Where salesperson_id='NV01'--

--DELETE FROM dbo.order_detail --
--WHERE product_id='Pro01'--

--DELETE FROM dbo.products--
--WHERE product_id='Pro01'--

--top 3 product best seller--
SELECT TOP (3) product_id, SUM(order_quantity) AS Quantity
FROM dbo.order_detail
GROUP BY product_id 
ORDER BY SUM(order_quantity) DESC

--top 3 product bad seller--
SELECT TOP (3) product_id, SUM(order_quantity) AS Quantity
FROM dbo.order_detail
GROUP BY product_id 
ORDER BY SUM(order_quantity) ASC

--top 3 salesperson best seller--
SELECT TOP(3) salespersons.salesperson_name ,
SUM(order_detail.order_quantity) AS Quantity
FROM salespersons, order_detail, orders, products
WHERE (salespersons.salesperson_id = orders.salesperson_id) 
AND (orders.order_id = order_detail.order_id) 
AND (dbo.products.product_id= order_detail.product_id)
GROUP BY salespersons.salesperson_name
ORDER BY SUM(order_quantity) DESC;

--Calculate total price of each bill:--
SELECT orders.order_id,
SUM(products.product_price*order_detail.order_quantity) AS [Total price]
FROM orders 
JOIN order_detail ON order_detail.order_id = orders.order_id
JOIN products ON products.product_id = order_detail.product_id
GROUP BY orders.order_id

--Revenue statistis of each day(Test)--
SELECT SUM(Orderinday.Total_Price) AS Revenue, Orderinday.Date
FROM 
	(SELECT orders.order_id, orders.order_day AS Date, SUM(Orders_Item.Order_Price) AS Total_Price
	FROM dbo.orders,
		(SELECT orders.order_id AS orderID, (products.product_price*order_detail.order_quantity) AS Order_Price, orders.order_day
		FROM dbo.orders, dbo.order_detail, dbo.products
		WHERE order_detail.product_id= products.product_id AND orders.order_id=order_detail.order_id) AS Orders_Item
	WHERE dbo.orders.order_id=Orders_Item.orderID 
	GROUP BY dbo.orders.order_id, dbo.orders.order_day) AS Orderinday
GROUP BY Orderinday.Date

--Revenue statistis of each day--
SELECT  orders.order_day, SUM(Orders_Item.Order_Price) AS Revenue
FROM dbo.orders,
		(SELECT orders.order_id AS orderID, 
		(products.product_price*order_detail.order_quantity) AS Order_Price, orders.order_day
		FROM dbo.orders, dbo.order_detail, dbo.products
		WHERE order_detail.product_id= products.product_id 
		AND orders.order_id=order_detail.order_id) AS Orders_Item
WHERE dbo.orders.order_id=Orders_Item.orderID 
GROUP BY orders.order_day

--Find out the day has highest revenue of month (Test)--
SELECT TOP(1) SUM(Orderinday.Total_Price) AS Revenue, Orderinday.Date
FROM 
	(SELECT orders.order_id, orders.order_day AS Date, SUM(Orders_Item.Order_Price) AS Total_Price
	FROM dbo.orders,
		(SELECT orders.order_id AS orderID, (products.product_price*order_detail.order_quantity) AS Order_Price, orders.order_day
		FROM dbo.orders, dbo.order_detail, dbo.products
		WHERE order_detail.product_id= products.product_id AND orders.order_id=order_detail.order_id) AS Orders_Item
	WHERE dbo.orders.order_id=Orders_Item.orderID 
	GROUP BY dbo.orders.order_id, dbo.orders.order_day) AS Orderinday
WHERE (Orderinday.Date BETWEEN '2021/1/1' AND '2021/1/30')
GROUP BY Orderinday.Date

--Find out the day has highest revenue of month--
SELECT TOP(1)  orders.order_day, SUM(Orders_Item.Order_Price) AS Revenue 
FROM dbo.orders,
		(SELECT orders.order_id AS orderID, 
		(products.product_price*order_detail.order_quantity) AS Order_Price, orders.order_day
		FROM dbo.orders, dbo.order_detail, dbo.products
		WHERE order_detail.product_id= products.product_id 
		AND orders.order_id=order_detail.order_id) AS Orders_Item
WHERE dbo.orders.order_id=Orders_Item.orderID 
GROUP BY orders.order_day

 --Revenue statistics by month (Test)--
SELECT SUM(Orderinday.Total_Price) AS Revenue
FROM 
	(SELECT orders.order_id, orders.order_day AS Date, SUM(Orders_Item.Order_Price) AS Total_Price
	FROM dbo.orders,
		(SELECT orders.order_id AS orderID, (products.product_price*order_detail.order_quantity) AS Order_Price, orders.order_day
		FROM dbo.orders, dbo.order_detail, dbo.products
		WHERE order_detail.product_id= products.product_id AND orders.order_id=order_detail.order_id) AS Orders_Item
	WHERE dbo.orders.order_id=Orders_Item.orderID 
	GROUP BY dbo.orders.order_id, dbo.orders.order_day) AS Orderinday
WHERE (Orderinday.Date BETWEEN '2021/1/1' AND '2021/1/30')

 --Revenue statistics by month--
SELECT SUM(Orders_Item.Order_Price) AS Revenue 
FROM dbo.orders,
		(SELECT orders.order_id AS orderID, 
		(products.product_price*order_detail.order_quantity) AS Order_Price, 
		orders.order_day
		FROM dbo.orders, dbo.order_detail, dbo.products
		WHERE order_detail.product_id= products.product_id 
 		AND orders.order_id=order_detail.order_id) AS Orders_Item
WHERE dbo.orders.order_id=Orders_Item.orderID 
AND dbo.orders.order_day BETWEEN '2021/1/1' AND '2021/1/30'


