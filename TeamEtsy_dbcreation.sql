/*TeamEtsy: Will Bermant, Kylie Stevens, Jill Klinvex*/

CREATE DATABASE EtsyDatabase;
GO

USE EtsyDatabase;
GO

CREATE TABLE Suppliers(
	SupplierID bigint NOT NULL PRIMARY KEY,
	SupplierName varchar (50) NOT NULL,
	SupplierStreet varchar (50) NOT NULL,
	SupplierCity varchar (50) NOT NULL,
	SupplierState varchar (2) NOT NULL,
	SupplierZip varchar (5) NOT NULL,
	SupplierPhone varchar (10) NOT NULL);

CREATE TABLE Products(
	ProductID bigint NOT NULL PRIMARY KEY,
	ProductName varchar (50) NOT NULL,
	ProductCost decimal(10,2) NOT NULL,
	ProductPrice decimal(10,2) NOT NULL,
	CategoryID bigint NOT NULL,
	SupplierID bigint NOT NULL);

CREATE TABLE Category(
	CategoryID bigint NOT NULL PRIMARY KEY,
	CategoryName varchar (50) NOT NULL);

CREATE TABLE Subcategory(
	SubcategoryID bigint NOT NULL PRIMARY KEY,
	SubcategoryName varchar (50) NOT NULL,
	CategoryID bigint NOT NULL);

CREATE TABLE OrderDetail(
	OrderDetailID bigint NOT NULL PRIMARY KEY,
	Quantity integer NOT NULL,
	ProductID bigint NOT NULL,
	OrderID	bigint NOT NULL);

CREATE TABLE Orders(
	OrderID bigint NOT NULL PRIMARY KEY,
	CustomerID bigint NOT NULL,
	OrderDate datetime NOT NULL,
	ShipDate date NOT NULL,
	DueDate date NOT NULL,
	ShipCost decimal(10,2) NOT NULL,
	TaxAmount decimal(10,2) NOT NULL,
	OrderTotal decimal(10,2) NOT NULL);

CREATE TABLE Customers(
	CustomerID bigint NOT NULL PRIMARY KEY,
	CustFirstName varchar (50) NOT NULL,
	CustLastName varchar (50) NOT NULL);

CREATE TABLE CustomerInfo(
	CustomerInfoID bigint NOT NULL PRIMARY KEY,
	CustomerID bigint NOT NULL,
	CustomerEmail varchar (50) NOT NULL,
	CustomerPhone varchar (10) NOT NULL,
	CustomerStreet varchar (50) NOT NULL,
	CustomerCity varchar (50) NOT NULL,
	CustomerState varchar (2) NOT NULL,
	CustomerZip varchar (5) NOT NULL);


ALTER TABLE Products ADD CONSTRAINT FK_Products_Category 
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

ALTER TABLE Products ADD CONSTRAINT FK_Products_Supplier 
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);

ALTER TABLE Subcategory ADD CONSTRAINT FK_Subcategory_Category 
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Products 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Orders
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customers 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE CustomerInfo ADD CONSTRAINT FK_CustomerInfo_Customers 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

GO

/* Category Data */
INSERT INTO [dbo].[Category] ([CategoryID], [CategoryName]) VALUES 
(1101, 'Necklace/Jewelry'),
(1102, 'Bracelet/Jewelry'),
(1103, 'Hats'),
(1104, 'Art'),
(1105, 'Boots/Shoes'),
(1106, 'Dress/Youth Girls'),
(1107, 'Eyewear'),
(1108, 'Hair Accessories'),
(1109, 'Bags and Leather Goods'),
(1110, 'Belts/Belt Accessories'),
(1111, 'Baking Accessory');

/*Subcategory Data*/
INSERT INTO [dbo].[Subcategory] ([SubcategoryID], [SubcategoryName], [CategoryID]) VALUES 
	(2201, 'Bakings Novelty', 1111),
	(2202, 'Barretes', 1101),
	(2203, 'Baseball Cap', 1103),
	(2204, 'Sunglasses', 1107),
	(2205, 'Knee High Boots', 1105),
	(2206, 'Leather Purses', 1109),
	(2207, 'Canvas Backpacks', 1109),
	(2208, 'Girls Dress', 1106),
	(2209, 'Personalised Necklaces', 1101),
	(2210, 'Belt Buckles', 1110),
	(2211, 'Bracelets', 1102);

/* Supplier Data*/
INSERT INTO Suppliers(SupplierID, SupplierName, SupplierStreet, SupplierCity, SupplierState, SupplierZip, SupplierPhone) VALUES 
	(111, 'Goodtouch', '6 South Gulf Drive', 'Franklin', 'MA', '10010', '7777777777'),
	(112, 'Accesory Planet', '7685 North Albany Drive', 'Pembroke Pines', 'FL', '10020', '7777777778'),
	(113, 'Island Representatives', '913 East Westminster Street', 'Olympia', 'WA', '10060', '7777777782'),
	(114, 'Bill & Bob''s', '778 Manhattan Street ', 'Torrington', 'CT', '10070', '7777777783'),
	(115, 'Stuff Magic', '304 Spruce Ave', 'Reston', 'VA', '10080', '7777777784'),
	(116, 'Leather and Co', '40 Cedar Swamp St', 'Westport', 'CT', '10090', '7777777785'),
	(117, 'Open Baking', '258 Lyme Lane ', 'Falls Church', 'VA', '10110', '7777777787'),
	(118, 'Best Modern', '21 Ohio Avenue', 'Ithica', 'NY', '10040', '7777777780'),
	(119, 'John''s Stores', '8288 Bald Hill Street ', 'La Vergne', 'TN', '10050', '7777777781'),
	(120, 'Blue Glass Products', '333 South Penn Street ', 'North Bergen', 'NJ', '10030', '7777777779'),
	(121, 'Accesory Design', '542 Peg Shop St', N'Nanuet', 'NY', '10100', '7777777786');

/* Product Data */
INSERT INTO [dbo].[Products] ([ProductID], [ProductName], [ProductCost], [ProductPrice], [CategoryID], [SupplierID]) VALUES 
	(211, 'Moongramed Knee High Boots', 30.00, 55.00, 1105, 111),
	(212, 'Skeleton Barrette', 9.00, 15.00, 1102, 112),
	(213, 'Black Leather Messanger Bag', 100.00, 200.00, 1109, 113),
	(214, 'SuperMan Cookie Cutter', 2.00, 5.00, 1111, 111),
	(215, 'Gold Tree Belt Buckle', 29.00, 39.00, 1110, 114),
	(216, 'Zodiac Bracelet', 15.00, 40.00, 1102, 115),
	(217, 'Personalized Heart Necklace', 35.00, 50.00, 1101, 117),
	(218, 'Sorority Baseball Cap', 10.00, 25.00, 1103, 118),
	(219, '1990 Diamond Sunglasses', 30.00, 45.00, 1107, 119),
	(220, 'Men''s Canvas Backpack', 20.00, 35.00, 1110, 119),
	(221, 'White Flower Girl''s Dress', 15.00, 35.00, 1106, 119);

/* Customers Data */
INSERT INTO Customers (CustomerID, CustFirstName, CustLastName) VALUES 
	(3301, 'Dylan', 'Brown'),
	(3302, 'Adam', 'Anderson'),
	(3303, 'Claire', 'Graham'),
	(3304, 'Ava', 'Martin'),
	(3305, 'Donna', 'Scott'),
	(3306, 'Wendy', 'Sharpe'),
	(3307, 'Amanda', 'Joans'),
	(3308, 'Sonia', 'Ross'),
	(3309, 'Dorothy', 'Paterson'),
	(3310, 'Deidre', 'Hughes'),
	(3311, 'Ruth', 'Miller');

/* CustomerInfo Data */
INSERT INTO CustomerInfo (CustomerInfoID, CustomerID, CustomerEmail, CustomerPhone, CustomerStreet, CustomerCity, CustomerState, CustomerZip) VALUES 
	(4407, 3307, 'ajoans@yahoo.com', '5555555555', '100 Grove Street', 'Kansas City', 'MO', '64101'),
	(4408, 3303, 'cgraham@gmail.com', '5555555556', '50 Union Street', 'Columbus', 'OH', '43085'),
	(4409, 3310, 'dhughes@hotmail.com', '5555555557', '300 Forest Road', 'Raleigh', 'NC', '21601'),
	(4410, 3311, 'rmiller3@hotmail.com', '5555555558', '24 Parks Road', 'Dallas', 'TX', '76048'),
	(4411, 3304, 'amartin@yahoo.com', '5555555559', '36 Washington Street', 'Scottsdale', 'AZ', '85250'),
	(4412, 3302, 'dpaterson@babson.edu', '5555555560', '46B Baker Road', 'Boston', 'MA', '24570'),
	(4413, 3305, 'dscott@yahoo.com', '5555555561', '92 Lincoln Square', 'Atlanta', 'GA', '30301'),
	(4414, 3311, 'rmiller@hotmail.com', '5555555562', '67 Hilltop Road', 'Sealttle', 'WA', '98101'),
	(4415, 3308, 'sross@gmail.com', '5555555563', '83 Elliot Place', 'Sacramento', 'CA', '94203'),
	(4416, 3302, 'aanderson@hotmail.com', '5555555564', '72 West Main Street', 'Keene', 'NH', '34310'),
	(4417, 3306, 'wsharpe@gmail.com', '5555555565', '62 Concord Road', 'Orlando', 'FL', '32082');

/* Orders Data */
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipDate, DueDate, ShipCost, TaxAmount, OrderTotal) VALUES 
	(9299, 3311, '2016-01-01 00:00:00', '2016-01-02', '2016-01-08', 10.00, 4.25, 69.25),
	(9300, 3307, '2016-01-01 00:00:01', '2016-01-03', '2016-01-09', 10.00, 12.55, 208.55),
	(9301, 3306, '2016-01-02 00:00:02', '2016-01-02', '2016-01-10', 10.00, 18.19, 303.19),
	(9302, 3310, '2016-01-03 00:00:03', '2016-01-04', '2016-01-11', 10.00, 10.66, 170.66),
	(9303, 3311, '2016-01-04 00:00:04', '2016-01-05', '2016-01-12', 20.00, 86.56, 1471.56),
	(9304, 3306, '2016-01-04 00:00:05', '2016-01-05', '2016-01-11', 14.00, 2.29, 26.29),
	(9305, 3304, '2016-01-04 00:00:06', '2016-01-05', '2016-01-14', 6.00, 9.01, 145.01),
	(9306, 3306, '2016-01-05 00:00:07', '2016-01-06', '2016-01-15', 6.00, 2.61, 41.80),
	(9307, 3303, '2016-01-07 00:00:08', '2016-01-08', '2016-01-16', 10.00, 13.88, 222.00),
	(9308, 3304, '2016-01-08 00:00:09', '2016-01-09', '2016-01-14', 14.00, 3.21, 51.34),
	(9309, 3302, '2016-01-08 00:00:10', '2016-01-09', '2016-01-15', 12.00, 1.29, 20.60);

/* OrderDetail Data */
INSERT INTO OrderDetail(OrderDetailID, Quantity, ProductID, OrderID) VALUES 
	(4404, 1, 211, 9299),
	(4405, 2, 212, 9300),
	(4406, 4, 215, 9300),
	(4407, 5, 211, 9301),
	(4408, 3, 217, 9302),
	(4409, 6, 213, 9303),
	(4410, 3, 211, 9303),
	(4411, 2, 214, 9304),
	(4412, 1, 221, 9305),
	(4413, 1, 219, 9305),
	(4414, 2, 218, 9305);
 
 GO

