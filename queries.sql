-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.ProductName, c.CategoryName from Product as p join Category as c on c.Id = p.CategoryID;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select Id as OrderId, ShipName from [order] where OrderDate < '2012-08-09' ;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select o.Quantity, p.ProductName from OrderDetail as o join Product as p on o.ProductId = p.Id where OrderId=10251 order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.Id as OrderId, c.CompanyName as CustomersCompanyName, e.LastName as EmployeesLastName from [order] as o
join Customer as c on o.CustomerId = c.Id 
join Employee as e on e.Id= o.EmployeeId;

-- Stretch Problems

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT CategoryName, count(p.CategoryID) as CategoryCount FROM [Products] AS p JOIN Categories AS c ON p.CategoryID = c.CategoryID  GROUP BY p.CategoryID

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records

SELECT o.OrderID, count(od.Quantity) AS ItemCount FROM [Orders] as o JOIN OrderDetails AS od ON od.OrderID = o.OrderID GROUP BY o.OrderID