CREATE --DROP
PROCEDURE dbo.pUpdClasses ( 
  @ClassId int
, @ClassName nvarchar(100)
, @ClassDate datetime
, @ClassDescription nvarchar(2000)
)
AS
/***************************************************
Dev: RRoot
Date: May, 23, 2018
Desc: This stored procedure change data in the Classes table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
       Update [Classes]
         Set [ClassId] = @ClassId
           , [ClassName] = @ClassName
           , [ClassDate] = @ClassDate
           , [ClassDescription] = @ClassDescription
         Where ClassId = @ClassId;
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
    ON OBJECT::[dbo].[pUpdClasses] TO PUBLIC
    AS [dbo];

