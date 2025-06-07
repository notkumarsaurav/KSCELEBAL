SELECT
    c.CustomerID,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    a.AddressLine1,
    a.City,
    sp.Name AS StateProvince,
    a.PostalCode,
    cr.Name AS CountryRegion,
    COUNT(DISTINCT soh.SalesOrderID) AS TotalOrdersWithTofu
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product prod ON sod.ProductID = prod.ProductID
WHERE prod.Name = 'Tofu'  -- or use prod.ProductID = 14
GROUP BY
    c.CustomerID,
    p.FirstName,
    p.LastName,
    a.AddressLine1,
    a.City,
    sp.Name,
    a.PostalCode,
    cr.Name
ORDER BY TotalOrdersWithTofu DESC, p.LastName, p.FirstName;