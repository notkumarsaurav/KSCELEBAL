select
    p.firstname + ' ' + p.lastname as contactname,
    count(soh.salesorderid) as numberoforders
from sales.customer c
join person.person p on c.personid = p.businessentityid
join sales.salesorderheader soh on c.customerid = soh.customerid
group by
    p.firstname,
    p.lastname
having count(soh.salesorderid) > 3
order by numberoforders desc;