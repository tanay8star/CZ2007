SELECT *
FROM Student, Person_R1
WHERE Student.personID = Person_R1.personID
AND Person_R1.school = 'Nanyang Business School';