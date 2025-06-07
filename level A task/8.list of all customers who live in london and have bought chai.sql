select distinct
    c.customerid,
    case
        when c.personid is not null then p.firstname + ' ' + p.lastname
        else s.name
    end as customername,
    a.addressline1,
    a.city,
    a.postalcode,
    count(soh.salesorderid) as numberoforders,
    sum(sod.orderqty) as totalchaipurchased
from sales.customer c
left join person.person p on c.personid = p.businessentityid
left join sales.store s on c.storeid = s.businessentityid
join person.businessentityaddress bea on 
    (p.businessentityid = bea.businessentityid or s.businessentityid = bea.businessentityid)
join person.address a on bea.addressid = a.addressid
join sales.salesorderheader soh on c.customerid = soh.customerid
join sales.salesorderdetail sod on soh.salesorderid = sod.salesorderid
where a.city = 'london'
and sod.productid = 1  -- chai product
group by
    c.customerid,
    case
        when c.personid is not null then p.firstname + ' ' + p.lastname
        else s.name
    end,
    a.addressline1,
    a.city,
    a.postalcode
order by totalchaipurchased desc;