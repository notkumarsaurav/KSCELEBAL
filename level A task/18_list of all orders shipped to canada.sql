select
    soh.salesorderid,
    soh.orderdate,
    soh.shipdate,
    soh.totaldue,
    soh.salesordernumber,
    p.firstname + ' ' + p.lastname as customername,
    a.addressline1 as shipaddress,
    a.city as shipcity,
    sp.name as shipprovince,
    a.postalcode
from sales.salesorderheader soh
join sales.customer c on soh.customerid = c.customerid
join person.person p on c.personid = p.businessentityid
join person.address a on soh.shiptoaddressid = a.addressid
join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
where cr.name = 'canada'
order by soh.orderdate desc;