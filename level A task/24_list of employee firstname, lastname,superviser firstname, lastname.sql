select 
    p.firstname as employee_firstname,
    p.lastname as employee_lastname,
    p2.firstname as supervisor_firstname,
    p2.lastname as supervisor_lastname
from 
    humanresources.employee e
inner join 
    person.person p on e.businessentityid = p.businessentityid
left join 
    humanresources.employee e2 on e.managerid = e2.businessentityid
left join 
    person.person p2 on e2.businessentityid = p2.businessentityid
order by 
    p.lastname, p.firstname;
