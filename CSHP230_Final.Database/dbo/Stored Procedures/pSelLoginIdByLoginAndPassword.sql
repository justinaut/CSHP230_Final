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
    --BEGIN TRANSACTION;
    ------------------- Transaction Statement:
    SELECT @StudentId = [StudentId]
      FROM [AdvWebDevProject].[dbo].[Students]
      WHERE [StudentLogin] = @StudentLogin
      AND [StudentPassword] = @StudentPassword;
    ------------------- Transaction Statement;
    --COMMIT TRANSACTION;
    RETURN +100
  END TRY   
  BEGIN CATCH
    --ROLLBACK TRANSACTION;
    DECLARE @Message nVarchar(1000);
    SELECT @Message = ERROR_MESSAGE();
    RAISERROR(@Message, 15, 1);     
    RETURN -100     
  END CATCH
END; -- Body of stored procedure;