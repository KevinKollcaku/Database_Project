SELECT ContestDescription, COUNT(*)
FROM contest, participatesIn
WHERE contest.contestID = 1 AND participatesin.contestID = contest.contestID;
