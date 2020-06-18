-- Find all Stakeholders who belong to the public domain.
/*
SELECT P.name
FROM Stakeholder S, Person_R1 P
WHERE S.personID = P.personID
AND S.domain = 'Public';

-- Find all Stakeholders who have provided at least five comments or suggestions.

SELECT P.name, P.personID, COUNT(*)
FROM Stakeholder S, CommentSuggestion C, Person_R1 P
WHERE S.personID = C.stakeholderPersonID
AND S.personID = P.personID
GROUP BY P.name, P.personID
HAVING COUNT(*) >= 5;

-- Find Graduates who are supervised by more than one professor and assigned to more than one research laboratory.


SELECT P.name
FROM supervisedBy S, Person_R1 P
WHERE S.GraduatePersonID = P.personID
GROUP BY P.name
HAVING COUNT(*) > 1

INTERSECT

SELECT P.name
FROM assignGraduateResearchLab A, Person_R1 P
WHERE A.personID = P.personID
GROUP BY P.name
HAVING COUNT(*) > 1;


-- Find all Professors who teach more than one courses in the semester.

WITH Temp(courseCode, professorPersonID)
AS  (SELECT DISTINCT courseCode, professorPersonID
    FROM teach
    AS temp)
SELECT P.name 
FROM temp T, Person_R1 P
WHERE T.professorPersonID = P.personID
GROUP BY P.name
HAVING COUNT(*) > 1;

-- List all the Equipment belonging to a particular Laboratory.
SELECT labName, ID, nameE
FROM Equipment
ORDER BY labName;

-- Find all Undergraduates who have not attended at least one laboratory experiments.
WITH Temp(personID)
AS  (SELECT U.personID
    FROM Undergraduate U
    EXCEPT
    SELECT DISTINCT E.undergraduatePersonID
    FROM Experiment E)
SELECT P.name
FROM Person_R1 P, Temp T
WHERE P.personID = T.personID;
*/

-- List all Graduates who are doing research and taking courses in the semester
/*
SELECT *
FROM takes

SELECT P.name
FROM Person_R1 P
WHERE P.personID IN (
    SELECT G.personID
    FROM Graduate G, takes t
    WHERE G.personID = t.personID)

*/