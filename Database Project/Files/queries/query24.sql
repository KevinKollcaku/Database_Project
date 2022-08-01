SELECT person.username ,count(*) 
FROM question, staff,person
WHERE  person.personid=staff.personid
AND staff.personId=question.personID
GROUP BY  staff.personID having count(*) >5
ORDER BY  count(*) desc;
