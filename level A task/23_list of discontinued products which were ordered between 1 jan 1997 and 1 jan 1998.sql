select distinct
    p.productid,
    p.name as productname,
    p.productnumber,
    p.discontinueddate
from production.product p
join sales.salesorderdetail sod on p.productid = sod.productid
join sales.salesorderheader soh on sod.salesorderid = soh.salesorderid
where p.discontinueddate is not null
and soh.orderdate between '1997-01-01' and '1998-01-01'
order by p.name;