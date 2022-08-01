
SELECT comment.comment_text, comment.up_vote FROM comment
WHERE questionID=1
ORDER BY comment.Up_Vote desc
limit 1;
