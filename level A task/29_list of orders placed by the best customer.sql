WITH TopCustomer AS (
    SELECT TOP 1 c.CustomerID
    FROM Sales.Customer c
    JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
    GROUP BY c.CustomerID
    ORDER BY SUM(soh.TotalDue) DESC
)
SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    soh.TotalDue,
    CONCAT(p.FirstName, ' ', p.LastName) AS CustomerName
FROM TopCustomer tc
JOIN Sales.SalesOrderHeader soh ON tc.CustomerID = soh.CustomerID
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
ORDER BY soh.OrderDate DESC;