CREATE --DROP
PROCEDURE dbo.pUpdLoginRequests( 
  @LoginId int
, @Name nvarchar
, @EmailAddress nvarchar(50)
, @LoginName nvarchar(50)
, @NewOrReactivate nvarchar(50)
, @ReasonForAccess nvarchar(50)
, @DateRequiredBy datetime
)
AS
/***************************************************
Dev: RRoot
Date: May, 23, 2018
Desc: This stored procedure Change data in the LoginRequests table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
       Update [dbo].[LoginRequests]
        Set [Name] = @Name
          , [EmailAddress] = @EmailAddress
          , [LoginName] = @LoginName
          , [NewOrReactivate] = @NewOrReactivate
          , [ReasonForAccess] = @ReasonForAccess
          , [DateRequiredBy] = @DateRequiredBy
        Where  [LoginId] = @LoginId;
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
    ON OBJECT::[dbo].[pUpdLoginRequests] TO PUBLIC
    AS [dbo];

