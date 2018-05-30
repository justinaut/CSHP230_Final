CREATE --DROP
PROCEDURE [dbo].[pInsLoginRequests]( 
  @LoginID int OUTPUT -- Used to capture the Automated ID number
, @Name nvarchar (50)
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
Desc: This stored procedure adds data to the LoginRequests table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
       INSERT INTO [dbo].[LoginRequests]
               ([Name], [EmailAddress], [LoginName], [NewOrReactivate], [ReasonForAccess], [DateRequiredBy])
         VALUES(@Name, @EmailAddress, @LoginName, @NewOrReactivate, @ReasonForAccess, @DateRequiredBy);
       Set @LoginID = @@IDENTITY; -- This will give back the new ID as output
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


-- Create Updates Sprocs:
-- dbo.pUpdClasses
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[pInsLoginRequests] TO PUBLIC
    AS [dbo];

