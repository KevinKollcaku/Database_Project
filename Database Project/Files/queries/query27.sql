CREATE OR REPLACE VIEW success_points_per_country
AS
SELECT  r.regionname, count(*) as successful_submissions
FROM region as r, submission as s,person as p, user as u

WHERE  r.regionID=p.regionID
AND  s.personID=u.personID 
AND  p.personID=u.personID
AND  s.successOrNot=1
GROUP BY  r.regionID
ORDER BY  count(*) desc;

CREATE OR REPLACE view total_submission_by_country
AS
SELECT  r.regionName,count(*) AS total_submissions
FROM person as p
 JOIN region as r
 ON r.regionID=p.regionID
 JOIN user as u
 ON p.personId=u.personID
 JOIN submission as s
 On s.personID=u.personID

 GROUP BY  r.regionID
 ORDER BY count(*) desc;
SELECT  s.regionname,
s.successful_submissions,
t.total_submissions,
s.successful_submissions/t.total_submissions AS average

FROM total_submission_by_country as t, success_points_per_country AS s
WHERE s.regionname=t.regionname
order by average desc; 
