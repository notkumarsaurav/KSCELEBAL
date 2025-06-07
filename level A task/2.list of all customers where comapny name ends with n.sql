select
    c.customerid,
    s.name as companyname,
    a.addressline1,
    a.city,
    sp.name as stateprovince,
    a.postalcode,
    cr.name as countryregion
from sales.customer c
join sales.store s on c.storeid = s.businessentityid
join person.businessentityaddress bea on s.businessentityid = bea.businessentityid
join person.address a on bea.addressid = a.addressid
join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
where s.name like '%n'
order by s.name;