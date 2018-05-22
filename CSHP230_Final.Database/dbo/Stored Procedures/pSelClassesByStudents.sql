CREATE --DROP
PROCEDURE dbo.pSelClassesByStudents 
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