select
    p.productid,
    p.name as productname,
    p.productnumber,
    p.color,
    p.listprice,
    p.size,
    p.weight,
    pc.name as productcategory,
    ps.name as productsubcategory
from production.product p
left join production.productsubcategory ps 
    on p.productsubcategoryid = ps.productsubcategoryid
left join production.productcategory pc 
    on ps.productcategoryid = pc.productcategoryid
where p.name like 'a%'  
order by p.name;