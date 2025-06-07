select
    cr.name as country,
    count(soh.salesorderid) as numberoforders,
    sum(soh.totaldue) as totalsalesamount
from sales.salesorderheader soh
join person.address a on soh.shiptoaddressid = a.addressid
join person.stateprovince sp on a.stateprovinceid = sp.stateprovinceid
join person.countryregion cr on sp.countryregioncode = cr.countryregioncode
group by cr.name
order by totalsalesamount desc;