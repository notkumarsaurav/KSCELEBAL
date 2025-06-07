SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    i.Quantity AS UnitsInStock,
    p.SafetyStockLevel,
    CASE 
        WHEN i.Quantity < 5 THEN 'CRITICAL'
        WHEN i.Quantity < 10 THEN 'LOW'
        ELSE 'OK'
    END AS StockStatus
FROM Production.Product p
JOIN Production.ProductInventory i ON p.ProductID = i.ProductID
WHERE i.Quantity < 10
AND NOT EXISTS (
    SELECT 1 
    FROM Purchasing.PurchaseOrderDetail pod
    WHERE pod.ProductID = p.ProductID
    AND pod.DueDate > GETDATE()  -- No pending orders
)
ORDER BY StockStatus, i.Quantity;