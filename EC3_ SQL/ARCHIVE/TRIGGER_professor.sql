CREATE TRIGGER professorMaxCourse
ON teach
FOR INSERT 
AS DECLARE @NewPersonID CHAR(9)
SELECT @NewPersonID = ins.professorPersonID FROM inserted ins;
IF (@NewPersonID IN (
    SELECT professorPersonID
    FROM teach
    GROUP BY professorPersonID
    HAVING COUNT(*) >= 3
))
BEGIN
RAISERROR('Maximum number of Courses reached!', 16, 1)
ROLLBACK TRANSACTION
END