CREATE --DROP
PROCEDURE dbo.pUpdStudents ( 
  @StudentId int
, @StudentName nvarchar(100)
, @StudentEmail nvarchar(100)
, @StudentLogin nvarchar(50)
, @StudentPassword nvarchar(50)
)
AS
/***************************************************
Dev: RRoot
Date: May, 23, 2018
Desc: This stored procedure change data in the Students table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
       Update [dbo].[Students]
        Set [StudentId] = @StudentId
          , [StudentName] = @StudentName
          , [StudentEmail] = @StudentEmail
          , [StudentLogin] = @StudentLogin
          , [StudentPassword] = @StudentPassword
        Where [StudentId] = @StudentId ;
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
    ON OBJECT::[dbo].[pUpdStudents] TO PUBLIC
    AS [dbo];

