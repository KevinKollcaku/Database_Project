SELECT person.fname, person.personid, COUNT(*)
FROM (submission, user, person)
WHERE(submission.personID = user.personID)
        AND (user.personid = person.personid)
        AND submission.successOrNot = 1
        AND submission.questionid
GROUP BY person.personid
ORDER BY COUNT(*) DESC;

