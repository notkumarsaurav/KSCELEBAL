SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    soh.TotalDue,
    CONCAT(p.FirstName, ' ', p.LastName) AS CustomerName,
    sp.Name AS StoreName
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
LEFT JOIN Sales.Store sp ON c.StoreID = sp.BusinessEntityID
LEFT JOIN Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID AND pp.PhoneNumberTypeID = 3
WHERE pp.BusinessEntityID IS NULL
ORDER BY soh.OrderDate DESC;