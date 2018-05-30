CREATE -- DROP
PROCEDURE dbo.pDelClassStudents ( 
  @ClassId int
, @StudentId int
)
AS
/***************************************************
Dev: RRoot
Date: Nov, 10, 2011
Desc: This stored procedure removes data in the 
ClassStudents table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
    DELETE From [AdvWebDevProject].[dbo].[ClassStudents]
     Where  [ClassId] = @ClassId
     AND [StudentId] = @StudentId;
    ------------------- Transaction Statement;
    COMMIT TRANSACTION;
    RETURN +100
  END TRY   
  BEGIN CATCH
    ROLLBACK TRANSACTION;
    Declare @Message nVarchar(1000);
    Select @Message = ERROR_MESSAGE();
    RAISERROR(@Message, 15, 1);     
    RETURN -100     
  END CATCH
END; -- Body of stored procedure;
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[pDelClassStudents] TO PUBLIC
    AS [dbo];

