
SELECT r.regionName, COUNT(*)
FROM region r,
    user u,
    person p,
    submission s
WHERE s.successOrNot = 1
        AND p.regionID = r.regionID
        AND u.personID = p.personID
        AND u.personID = s.personID
GROUP BY r.regionID
ORDER BY COUNT(*) DESC;