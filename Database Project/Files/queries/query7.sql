SELECT user.*, person.fname, ranks.rankName
FROM user, person, ranks
WHERE person.personid = user.personid AND user.rankid = 1 AND ranks.rankID = user.rankID;
