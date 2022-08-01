CREATE VIEW top_players2 AS SELECT p.username, r.regionName, COUNT(*)  AS cnt
FROM    person p,
        region r,
        submission s,
        user u
WHERE
        s.successorNot = 1
            AND p.regionID = r.regionID
            AND u.personID = p.personID
            AND u.personID = s.personID
    GROUP BY u.personid
    ORDER BY COUNT(*) DESC;

SELECT username, regionName, cnt from
(select username,
regionName,
cnt,
row_number() over 
(partition by  regionName ORDER BY top_players2.cnt desc) as player_rank
from top_players2 ) ranks
WHERE player_rank <= 1;
