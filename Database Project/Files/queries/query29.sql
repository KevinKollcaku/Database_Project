SELECT 
    AVG(TIMESTAMPDIFF(YEAR,
        person.birthday,
        CURDATE())) AS test
FROM
    person

