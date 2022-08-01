SELECT * FROM belongsto,question
WHERE belongsto.questionID=question.questionID
AND belongsto.volumeID=1;
