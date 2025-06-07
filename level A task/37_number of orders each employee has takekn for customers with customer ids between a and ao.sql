SELECT 
    e.BusinessEntityID AS employee_id,
    p.FirstName + ' ' + p.LastName AS employee_name,
    COUNT(soh.SalesOrderID) AS number_of_orders
FROM Sales.SalesOrderHeader soh
JOIN HumanResources.Employee e ON soh.SalesPersonID = e.BusinessEntityID
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person pp ON c.PersonID = pp.BusinessEntityID
WHERE pp.LastName BETWEEN 'A' AND 'AO'
GROUP BY e.BusinessEntityID, p.FirstName, p.LastName
ORDER BY number_of_orders DESC;