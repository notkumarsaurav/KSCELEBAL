SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    soh.Status AS OrderStatus,
    p.Name AS ProductName,
    sod.OrderQty,
    sod.UnitPrice,
    (sod.OrderQty * sod.UnitPrice) AS LineTotal
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
ORDER BY soh.SalesOrderID, p.Name;