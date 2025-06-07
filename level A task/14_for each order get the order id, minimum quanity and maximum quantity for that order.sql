SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    MIN(sod.OrderQty) AS MinimumQuantity,
    MAX(sod.OrderQty) AS MaximumQuantity
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
GROUP BY 
    soh.SalesOrderID,
    soh.OrderDate,
    p.FirstName,
    p.LastName
ORDER BY soh.SalesOrderID;