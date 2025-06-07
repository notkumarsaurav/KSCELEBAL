select
    c.customerid,
    p.firstname + ' ' + p.lastname as customername,
    a.addressline1,
    a.city,
    sp.name as stateprovince,
    a.postalcode,
    cr.name as country
from sales.customer c
join person.person p on c.personid = p.businessentityid
join person.businessentityaddress bea on p.businessentityid = bea.businessentityid
join person.address a on bea.addressid = a.addressid
join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
where cr.name in ('United Kingdom', 'United States')
order by 
    cr.name,
    case when cr.name = 'United Kingdom' then a.city else sp.name end,
    p.lastname,
    p.firstname;