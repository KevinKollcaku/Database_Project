SELECT u.personid, p.username, TIMESTAMPDIFF(MONTH, u.date_created , CURDATE()) membershipTime
FROM user u, person p
WHERE u.personID = p.personID;

