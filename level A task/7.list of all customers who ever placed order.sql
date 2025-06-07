select distinct
    c.customerid,
    case
        when c.personid is not null then p.firstname + ' ' + p.lastname
        else s.name
    end as customername,
    case
        when c.personid is not null then 'individual'
        else 'store'
    end as customertype,
    a.addressline1,
    a.city,
    sp.name as stateprovince,
    a.postalcode,
    cr.name as countryregion
from sales.customer c
left join person.person p on c.personid = p.businessentityid
left join sales.store s on c.storeid = s.businessentityid
left join person.businessentityaddress bea on 
    (p.businessentityid = bea.businessentityid or s.businessentityid = bea.businessentityid)
left join person.address a on bea.addressid = a.addressid
left join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
left join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
where exists (
    select 1 
    from sales.salesorderheader soh 
    where soh.customerid = c.customerid
)
order by customertype, customername;