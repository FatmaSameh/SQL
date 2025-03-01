CREATE DATABASE OnlineShoppingSystem;

USE OnlineShoppingSystem;
CREATE TABLE Customer (
    CustomerID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber NVARCHAR(15) NOT NULL,
    Address NVARCHAR(255)
);


INSERT INTO Customer (Name, Email, PhoneNumber, Address) 
VALUES 
('Ahmed Ali', 'ahmed@example.com', '0123456789', 'Cairo, Egypt'),
('Mona Hassan', 'mona@example.com', '0112233445', 'Giza, Egypt');


CREATE TABLE Orders (
    OrderID INT IDENTITY PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETUTCDATE(),
    TotalAmount DECIMAL(10,2) ,
    Status NVARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) 
VALUES 
(1, GETUTCDATE(), 500.00, 'Completed'),
(2, GETUTCDATE(), 300.00, 'Pending');

UPDATE Orders
SET OrderDate = GETDATE() WHERE OrderID > 0;



CREATE TABLE Product (
    ProductID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    Category NVARCHAR(50) DEFAULT 'New'
);

INSERT INTO Product (Name, Description, Price, Category) 
VALUES 
('Laptop', 'Dell XPS 13', 15000.00, 'Electronics'),
('Smartphone', 'iPhone 14 Pro', 25000.00, 'Electronics');


ALTER TABLE Product
ADD Rating DECIMAL(3,2) DEFAULT 0;

ALTER TABLE Product 
ADD CONSTRAINT DF_Product_Category DEFAULT 'new' FOR Category;

ALTER TABLE Product
DROP COLUMN Rating;


DELETE FROM Product
WHERE Name IS NOT NULL AND Name <> 'Null';


CREATE TABLE OrderDetails (
    OrderDetailsID INT IDENTITY PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) 
VALUES 
(1, 1, 1, 15000.00),
(2, 2, 1, 25000.00);

CREATE TABLE Supplier (
    SupplierID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    ContactInfo NVARCHAR(255)
);

INSERT INTO Supplier (Name, ContactInfo) 
VALUES 
('Tech Supplier', 'contact@techsupplier.com'),
('Mobile World', 'info@mobileworld.com');


CREATE TABLE Supply (
    SupplierID INT NOT NULL,
    ProductID INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    PRIMARY KEY (SupplierID, ProductID)
);

INSERT INTO Supply (SupplierID, ProductID) 
VALUES 
(1, 1),
(2, 2);

