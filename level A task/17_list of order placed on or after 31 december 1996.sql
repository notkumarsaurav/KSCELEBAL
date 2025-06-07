select
    soh.salesorderid,
    soh.orderdate,
    soh.duedate,
    soh.shipdate,
    soh.status,
    c.customerid,
    p.firstname + ' ' + p.lastname as customername,
    soh.totaldue,
    soh.salesordernumber
from sales.salesorderheader soh
join sales.customer c on soh.customerid = c.customerid
join person.person p on c.personid = p.businessentityid
where soh.orderdate >= '1996-12-31'
order by soh.orderdate asc;