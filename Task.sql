USE GDGC;

--HR_DB--

-- 1
SELECT * FROM Employees;

--2
SELECT * FROM Employees WHERE CountryID = 1;

--3
SELECT * FROM Employees WHERE DepartmentID = 3;

--4
SELECT * FROM Employees WHERE Salary > 5000;

--5
SELECT * FROM Employees WHERE HireDate > '2020-01-01';

--6
SELECT * FROM Employees WHERE ExitDate IS NOT NULL;

--7
SELECT * FROM Employees WHERE BonusPercentage > 10;



--Shop_Database--

--8
SELECT * FROM Customers CROSS JOIN Orders;

--9
SELECT Orders.*, Customers.CustomerName 
FROM Orders 
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--10
SELECT Customers.*, Orders.OrderID 
FROM Customers 
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--11
SELECT Orders.*, Customers.CustomerName 
FROM Orders 
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--12
SELECT Orders.*, Customers.*
FROM Orders 
FULL OUTER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--13
SELECT CustomerName, COUNT(*) 
FROM Customers 
GROUP BY CustomerName 
HAVING COUNT(*) > 1;

--14
SELECT Orders.*, Customers.CustomerName 
FROM Orders 
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.Amount > 500;

--15
SELECT * FROM Customers 
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

--16
SELECT CustomerID, COUNT(OrderID) AS OrderCount 
FROM Orders 
GROUP BY CustomerID;

--17
SELECT Customers.CustomerName, SUM(Orders.Amount) AS TotalSpent 
FROM Orders 
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerName;

--18
UPDATE Orders 
SET Amount = Amount * 1.10 
WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE CustomerName = 'John Doe');


--19
DELETE FROM Orders 
WHERE CustomerID NOT IN (SELECT CustomerID FROM Customers);
