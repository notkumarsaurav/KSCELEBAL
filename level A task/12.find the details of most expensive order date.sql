SELECT TOP 1
    soh.SalesOrderID,
    soh.OrderDate,
    soh.TotalDue AS OrderAmount,
    c.CustomerID,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    soh.SalesOrderNumber,
    st.Name AS SalesTerritory,
    a.AddressLine1 AS ShipAddress,
    a.City AS ShipCity,
    sp.Name AS ShipStateProvince,
    a.PostalCode AS ShipPostalCode,
    cr.Name AS ShipCountry
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
JOIN Person.Address a ON soh.ShipToAddressID = a.AddressID
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
ORDER BY soh.TotalDue DESC;