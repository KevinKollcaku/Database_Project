select e.errorType,count(*) from submission s, errors_type e
where s.successornot=0
and s.errorID=e.errorID
group by e.errorID
order by count(*) desc
limit 1;
