SELECT TOP 1
    soh.OrderDate,
    soh.SalesOrderID,
    soh.TotalDue AS OrderTotal,
    CONCAT(p.FirstName, ' ', p.LastName) AS CustomerName,
    (
        SELECT STRING_AGG(p.Name, ', ')
        FROM Sales.SalesOrderDetail sod
        JOIN Production.Product p ON sod.ProductID = p.ProductID
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS ProductsInOrder
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
ORDER BY soh.TotalDue DESC;