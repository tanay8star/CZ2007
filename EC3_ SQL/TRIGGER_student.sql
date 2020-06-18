CREATE TRIGGER studentMaxCourse
ON takes
FOR INSERT 
AS DECLARE @NewPersonID CHAR(9)
SELECT @NewPersonID = ins.personID FROM inserted ins;
IF (@NewPersonID IN (
    SELECT personID
    FROM takes
    GROUP BY personID
    HAVING COUNT(*) >= 6
))
BEGIN
RAISERROR('Maximum number of Courses reached!', 16, 1)
ROLLBACK TRANSACTION
END