SELECT person.fname,
    TIMESTAMPDIFF(YEAR,
        person.birthday,
        CURDATE()) above_avg_age
FROM
    person
WHERE
    TIMESTAMPDIFF(YEAR,
        person.birthday,
        CURDATE()) > (SELECT 
            AVG(TIMESTAMPDIFF(YEAR,
                    person.birthday,

                    CURDATE())) AS test
        FROM
            person);
