SELECT  person.username,  count(*) from participatesin,person
WHERE person.personID=participatesin.personID
GROUP BY participatesin.personID
ORDER BY count(*) desc
limit 1;
