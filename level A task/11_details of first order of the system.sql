SELECT TOP 1
    soh.SalesOrderID,
    soh.OrderDate,
    soh.DueDate,
    soh.ShipDate,
    soh.Status,
    c.CustomerID,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    soh.TotalDue,
    soh.SalesOrderNumber,
    a.AddressLine1 AS ShipAddress,
    a.City AS ShipCity,
    sp.Name AS ShipStateProvince,
    a.PostalCode AS ShipPostalCode
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Person.Address a ON soh.ShipToAddressID = a.AddressID
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
WHERE soh.OnlineOrderFlag = 0 
ORDER BY soh.OrderDate ASC, soh.SalesOrderID ASC;