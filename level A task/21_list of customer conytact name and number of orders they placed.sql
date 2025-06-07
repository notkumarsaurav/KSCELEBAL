select
    p.firstname + ' ' + p.lastname as contactname,
    pp.phonenumber,
    count(soh.salesorderid) as numberoforders
from sales.customer c
join person.person p on c.personid = p.businessentityid
left join person.personphone pp on p.businessentityid = pp.businessentityid
left join sales.salesorderheader soh on c.customerid = soh.customerid
group by
    p.firstname,
    p.lastname,
    pp.phonenumber
having count(soh.salesorderid) > 0
order by numberoforders desc;