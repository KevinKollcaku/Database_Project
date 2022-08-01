CREATE OR REPLACE VIEW total_submission_to_questions AS
SELECT q.QuestionTitle, COUNT(*) AS total_submissions
FROM question AS q JOIN submission AS s ON q.questionID = s.questionID
GROUP BY q.questionID;
CREATE OR REPLACE VIEW successful_submission_to_questions AS
SELECT q.QuestionTitle, COUNT(*) AS successful_submissions
FROM question AS q  JOIN  submission AS s ON q.questionID = s.questionID
WHERE
        s.successOrNot = 1
    GROUP BY q.questionID;

SELECT 
    s.QuestionTitle,
    s.successful_submissions,
    t.total_submissions,
    s.successful_submissions / t.total_submissions AS acceptance_rate
FROM
    successful_submission_to_questions AS s,
    total_submission_to_questions AS t
WHERE
    s.QuestionTitle = t.QuestionTitle
ORDER BY acceptance_rate
LIMIT 10;
