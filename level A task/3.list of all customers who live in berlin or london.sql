select
    c.customerid,
    p.firstname + ' ' + p.lastname as customername,
    a.addressline1,
    a.city,
    a.postalcode,
    sp.name as stateprovince,
    cr.name as countryregion
from sales.customer c
join person.person p on c.personid = p.businessentityid
join person.businessentityaddress bea on p.businessentityid = bea.businessentityid
join person.address a on bea.addressid = a.addressid
join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
where a.city in ('Berlin', 'London')
order by a.city, p.lastname, p.firstname;