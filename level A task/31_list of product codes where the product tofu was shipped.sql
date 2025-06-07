SELECT
    p.ProductNumber AS ProductCode,
    p.Name AS ProductName,
    sod.SalesOrderDetailID,
    soh.SalesOrderID,
    soh.ShipDate,
    soh.ShipMethodID,
    sm.Name AS ShipMethod,
    sod.OrderQty AS QuantityShipped,
    a.AddressLine1 AS ShipToAddress,
    a.City AS ShipToCity
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Purchasing.ShipMethod sm ON soh.ShipMethodID = sm.ShipMethodID
JOIN Person.Address a ON soh.ShipToAddressID = a.AddressID
WHERE p.Name = 'Tofu'
AND soh.Status = 5  
ORDER BY soh.ShipDate DESC;