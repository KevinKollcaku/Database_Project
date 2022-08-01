SELECT submission.questionID, question.QuestionTitle, COUNT(*) unsuccesful
FROM submission, question
WHERE successOrNot = 0 and submission.questionID = question.questionID
GROUP BY submission.questionid;
