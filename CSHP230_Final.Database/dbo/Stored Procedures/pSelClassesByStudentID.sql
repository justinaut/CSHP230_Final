CREATE --DROP 
PROCEDURE [dbo].[pSelClassesByStudentId] -- Required for the project
(@StudentId int) 
/**************************************************
Dev: RRoot
OriginalDate: Sept 4 2009 
ChangeLog: (Who, When, What)
**************************************************/
AS
BEGIN -- Body of stored procedure:
  BEGIN TRY
    ------------------- Reporting Statement:
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
      Where [Students].[StudentId] = @StudentId;
     If(@@ROWCOUNT = 0) RaisError('No Login Found', 15, 1);
    ------------------- Reporting Statement;
    RETURN +100
  END TRY   
  BEGIN CATCH
    --ROLLBACK TRANSACTION;
    Declare @Message nVarchar(1000);
    Select @Message = ERROR_MESSAGE();
    RAISERROR(@Message, 15, 1);     
    RETURN -100     
  END CATCH
END; -- Body of stored procedure;
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[pSelClassesByStudentId] TO PUBLIC
    AS [dbo];

