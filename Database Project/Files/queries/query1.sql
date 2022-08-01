SELECT submission.questionID ,question.questionTitle, COUNT(*) Attempts
FROM submission, question
WHERE submission.questionID = question.questionID
GROUP BY questionid;
