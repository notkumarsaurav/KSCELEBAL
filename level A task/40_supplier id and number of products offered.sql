SELECT 
    v.BusinessEntityID AS SupplierID,
    v.Name AS SupplierName,
    COUNT(pv.ProductID) AS NumberOfProductsOffered
FROM Purchasing.Vendor v
JOIN Purchasing.ProductVendor pv ON v.BusinessEntityID = pv.BusinessEntityID
GROUP BY v.BusinessEntityID, v.Name
ORDER BY NumberOfProductsOffered DESC;