
SELECT COUNT(*),volumeTitle 
FROM belongsto,question,volume
WHERE belongsto.questionID=question.questionID
AND volume.volumeID=belongsto.volumeID
GROUP BY belongsto.volumeID;

