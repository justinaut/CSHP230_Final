CREATE --DROP
PROCEDURE dbo.pDelStudents ( 
  @StudentId int
)
AS
/***************************************************
Dev: RRoot
Date: May, 23, 2018
Desc: This stored procedure Delete data in the Students table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
       Delete From [dbo].[Students] Where [StudentId] = @StudentId;
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
    ON OBJECT::[dbo].[pDelStudents] TO PUBLIC
    AS [dbo];

