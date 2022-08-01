
SELECT submission.questionID, question.QuestionTitle, COUNT(*)
FROM submission, question
WHERE successOrNot = 1 and submission.questionID = question.questionID
GROUP BY submission.questionid;
