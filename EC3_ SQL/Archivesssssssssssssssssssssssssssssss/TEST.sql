WITH Temp(personID)
AS  (SELECT U.personID
    FROM Undergraduate U
    EXCEPT
    SELECT E.undergraduatePersonID
    FROM Experiment E)

SELECT P.personID, P.name, P.school
FROM Temp T, Person_R1 P
WHERE T.personID = P.personID;

WITH Temp(personID)
AS  (SELECT U.personID
    FROM Undergraduate U
    EXCEPT
    SELECT DISTINCT E.undergraduatePersonID
    FROM Experiment E)

SELECT P.personID, P.name
FROM Temp T, Person_R1 P
WHERE T.personID = P.personID;