SELECT  question.QuestionTitle,level.title
FROM level,question
WHERE level.levelD=question.levelD
AND level.levelD=1;
