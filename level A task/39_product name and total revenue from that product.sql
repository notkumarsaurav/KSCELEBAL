SELECT 
    p.ProductID,
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalRevenue,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    SUM(sod.OrderQty) AS TotalUnitsSold
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE soh.Status = 5 -- Shipped orders only
GROUP BY p.ProductID, p.Name
ORDER BY TotalRevenue DESC;