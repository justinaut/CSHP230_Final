CREATE --DROP
PROCEDURE dbo.pSelClassesByStudents 
AS
Select 
      [Students].[StudentId]
    , [Students].[StudentName]
    , [Students].[StudentEmail]
    , [Classes].[ClassId]
    , [Classes].[ClassName]
    , [Classes].[ClassDate]
    , [Classes].[ClassDescription]
  From  Classes 
  INNER JOIN ClassStudents 
    ON Classes.ClassId = ClassStudents.ClassId 
  INNER JOIN Students 
    ON ClassStudents.StudentId = Students.StudentId
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[pSelClassesByStudents] TO PUBLIC
    AS [dbo];

