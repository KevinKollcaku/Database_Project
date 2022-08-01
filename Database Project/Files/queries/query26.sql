SELECT fname, person.lastName, TIMESTAMPDIFF(YEAR, person.birthday , CURDATE()) age
FROM PERSON;
