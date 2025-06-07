SELECT 
    p.ProductID,
    p.Name AS ProductName
FROM Production.Product p
WHERE NOT EXISTS (
    SELECT 1 
    FROM Sales.SalesOrderDetail sod 
    WHERE sod.ProductID = p.ProductID
)
ORDER BY p.Name;