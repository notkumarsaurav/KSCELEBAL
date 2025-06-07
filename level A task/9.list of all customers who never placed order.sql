select
    c.customerid,
    p.firstname + ' ' + p.lastname as customername,
    a.addressline1,
    a.city,
    sp.name as stateprovince,
    a.postalcode,
    cr.name as countryregion
from sales.customer c
inner join person.person p on c.personid = p.businessentityid  -- only customers with person records
left join person.businessentityaddress bea on p.businessentityid = bea.businessentityid
left join person.address a on bea.addressid = a.addressid
left join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
left join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
where not exists (
    select 1 
    from sales.salesorderheader soh 
    where soh.customerid = c.customerid
)
and c.storeid is null  -- explicitly exclude store customers
order by p.lastname, p.firstname;