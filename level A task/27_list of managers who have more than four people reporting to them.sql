SELECT 
    m.BusinessEntityID AS ManagerID,
    p.FirstName + ' ' + p.LastName AS ManagerName,
    COUNT(e.BusinessEntityID) AS DirectReports,
    m.JobTitle AS ManagerTitle
FROM HumanResources.Employee m
JOIN Person.Person p ON m.BusinessEntityID = p.BusinessEntityID
JOIN HumanResources.Employee e ON e.OrganizationNode.GetAncestor(1) = m.OrganizationNode
WHERE m.JobTitle LIKE '%Manager%'
GROUP BY 
    m.BusinessEntityID,
    p.FirstName,
    p.LastName,
    m.JobTitle
HAVING COUNT(e.BusinessEntityID) > 4
ORDER BY DirectReports DESC;