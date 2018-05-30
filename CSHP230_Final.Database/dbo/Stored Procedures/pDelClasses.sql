CREATE --DROP
PROCEDURE dbo.pDelClasses ( 
  @ClassId int
)
AS
/***************************************************
Dev: RRoot
Date: May, 23, 2018
Desc: This stored procedure Delete data in the Classes table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
       Delete From [Classes] Where ClassId = @ClassId;
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
    ON OBJECT::[dbo].[pDelClasses] TO PUBLIC
    AS [dbo];

