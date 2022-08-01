SELECT person.username,count(*) FROM user,person,comment
WHERE user.personID=person.personID
AND comment.personID=user.personID
GROUP BY person.personID
ORDER BY count(*) desc
limit 1;

