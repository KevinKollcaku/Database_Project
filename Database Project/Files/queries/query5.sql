SELECT questionID, COUNT(*)
FROM submission
WHERE personID=14 
GROUP BY questionid;
