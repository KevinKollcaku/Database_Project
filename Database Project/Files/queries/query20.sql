SELECT person.username, ranks.rankname FROM user,person,ranks
WHERE user.rankID=7
and ranks.rankid=user.rankid
and person.personID=user.personID;
