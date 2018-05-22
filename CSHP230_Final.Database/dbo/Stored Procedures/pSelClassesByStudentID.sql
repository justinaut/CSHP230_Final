CREATE --DROP
PROCEDURE [dbo].[pSelClassesByStudentID]
(@StudentId int) 
AS
SELECT 
      [Students].[StudentId]
    , [Students].[StudentName]
    , [Students].[StudentEmail]
    , [Classes].[ClassId]
    , [Classes].[ClassName]
    , [Classes].[ClassDate]
    , [Classes].[ClassDescription]
  FROM  Classes 
  INNER JOIN ClassStudents 
    ON Classes.ClassId = ClassStudents.ClassId 
  INNER JOIN Students 
    ON ClassStudents.StudentId = Students.StudentId
WHERE [Students].[StudentId] = @StudentId;