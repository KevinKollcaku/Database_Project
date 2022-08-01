
SELECT languageName, question.questionTitle, question.QuestionDescription
FROM programming_language, isof, question
WHERE programming_language.languageID = isof.languageID AND question.questionid = isof.questionid
        AND programming_language.languageID = 3;
