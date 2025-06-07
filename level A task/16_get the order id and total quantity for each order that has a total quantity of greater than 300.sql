SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    SUM(sod.OrderQty) AS TotalQuantity,
    soh.TotalDue AS OrderAmount
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
GROUP BY 
    soh.SalesOrderID,
    soh.OrderDate,
    p.FirstName,
    p.LastName,
    soh.TotalDue
HAVING SUM(sod.OrderQty) > 300
ORDER BY TotalQuantity DESC;