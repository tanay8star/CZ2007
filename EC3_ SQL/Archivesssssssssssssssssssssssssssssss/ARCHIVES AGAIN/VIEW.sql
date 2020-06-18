-- Find all Stakeholders who belong to the public domain.
SELECT Person_R1.name
FROM Stakeholder INNER JOIN Person_R1 ON Stakeholder.personID = Person_R1.personID
WHERE domain = 'Public';

-- Find all Stakeholders who have provided at least five comments or suggestions.
SELECT S.name
FROM Person_R1 AS S
WHERE   (SELECT COUNT(topic, dateCS, stakeholderPersonID)
        FROM CommentSuggestion
        WHERE S.personID = CommentSuggestion.stakeholderPersonID
        GROUP BY personID) >= 5;

-- Find Graduates who are supervised by more than one professor and assigned to more than one research laboratory.
-- Find all Professors who teach more than one courses in the semester.
-- List all the Equipment belonging to a particular Laboratory.
-- Find all Undergraduates who have not attended at least one laboratory experiments.
-- List all Graduates who are doing research and taking courses in the semester