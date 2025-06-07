select
    e.businessentityid as employeeid,
    p.firstname + ' ' + p.lastname as employeename,
    sum(soh.totaldue) as totalsales
from sales.salesorderheader soh
join humanresources.employee e on soh.salespersonid = e.businessentityid
join person.person p on e.businessentityid = p.businessentityid
group by
    e.businessentityid,
    p.firstname,
    p.lastname
order by totalsales desc;