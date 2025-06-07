select
    e.businessentityid as employeeid,
    p.firstname,
    p.lastname,
    e.jobtitle
from humanresources.employee e
join person.person p on e.businessentityid = p.businessentityid
where p.firstname like '%a%'
order by p.lastname, p.firstname;