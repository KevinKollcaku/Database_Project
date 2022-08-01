SELECT  level.title,count(*)
FROM level,question
WHERE level.levelD=question.levelD
GROUP BY level.LevelD;
