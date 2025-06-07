select
    soh.salesorderid,
    soh.orderdate,
    soh.totaldue as ordertotal,
    soh.salesordernumber,
    p.firstname + ' ' + p.lastname as customername,
    a.city as shipcity,
    sp.name as shipstateprovince,
    cr.name as shipcountry
from sales.salesorderheader soh
join sales.customer c on soh.customerid = c.customerid
join person.person p on c.personid = p.businessentityid
join person.address a on soh.shiptoaddressid = a.addressid
join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
where soh.totaldue > 200
order by soh.totaldue desc;