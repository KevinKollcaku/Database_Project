
SELECT comment.questionId, question.QuestionTitle,  COUNT(*) countOfComments
FROM comment, question
WHERE question.questionid = comment.questionid
GROUP BY comment.questionid
ORDER BY COUNT(*) DESC;
