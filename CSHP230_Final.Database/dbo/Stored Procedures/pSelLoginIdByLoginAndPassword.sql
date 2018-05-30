CREATE -- DROP
PROCEDURE dbo.pSelLoginIdByLoginAndPassword( 
  @StudentLogin nVarchar(50)
, @StudentPassword nVarchar(50)  
, @StudentId int Out
)
AS
/***************************************************
Dev: RRoot
Date: Nov, 10, 2011
Desc: This stored procedure outputs a student Id 
  based on a given login and password
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    ------------------- Reporting Statement:
    Select @StudentId = [StudentId]
      From [AdvWebDevProject].[dbo].[Students]
      Where [StudentLogin] = @StudentLogin
      AND [StudentPassword] = @StudentPassword;
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
    ON OBJECT::[dbo].[pSelLoginIdByLoginAndPassword] TO PUBLIC
    AS [dbo];

