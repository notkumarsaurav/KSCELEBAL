select 
    c.customerid,
    p.title,
    p.firstname,
    p.lastname,
    p.suffix,
    pp.phonenumber,
    ea.emailaddress,
    a.addressline1,
    a.addressline2,
    a.city,
    sp.name as stateprovince,
    a.postalcode,
    cr.name as countryregion
from sales.customer c
join person.person p on c.personid = p.businessentityid
left join person.emailaddress ea on p.businessentityid = ea.businessentityid
left join person.personphone pp on p.businessentityid = pp.businessentityid
left join person.businessentityaddress bea on p.businessentityid = bea.businessentityid
left join person.address a on bea.addressid = a.addressid
left join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
left join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
where c.personid is not null
order by p.lastname, p.firstname;