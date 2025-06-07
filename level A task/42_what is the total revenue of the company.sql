SELECT 
    SUM(TotalDue) AS TotalRevenue,
    FORMAT(SUM(TotalDue), 'C') AS FormattedRevenue,
    YEAR(OrderDate) AS RevenueYear
FROM Sales.SalesOrderHeader
WHERE Status = 5 -- Shipped orders only
GROUP BY YEAR(OrderDate)
ORDER BY RevenueYear;