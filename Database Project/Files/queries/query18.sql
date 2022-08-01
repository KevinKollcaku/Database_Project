SELECT e.errorType,count(*) 
FROM submission s, errors_type e
WHERE s.successornot=0
AND s.errorID=e.errorID
AND s.questionID=8
GROUP BY e.errorID
ORDER BY COUNT(*) desc
limit 1;

