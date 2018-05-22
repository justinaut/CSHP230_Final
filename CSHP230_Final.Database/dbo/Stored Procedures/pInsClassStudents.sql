CREATE --DROP
PROCEDURE dbo.pInsClassStudents ( 
  @ClassId int
, @StudentId int
)
AS
/***************************************************
Dev: RRoot
Date: Nov, 10, 2011
Desc: This stored procedure adds data to the 
ClassStudents table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
       INSERT INTO [AdvWebDevProject].[dbo].[ClassStudents]
               ([ClassId]
               ,[StudentId]
               )
         VALUES
              (@ClassId
              ,@StudentId
              );
    ------------------- Transaction Statement;
    COMMIT TRANSACTION;
    RETURN +100
  END TRY   
  BEGIN CATCH
    ROLLBACK TRANSACTION;
    DECLARE @Message nVarchar(1000);
    SELECT @Message = ERROR_MESSAGE();
    RAISERROR(@Message, 15, 1);     
    RETURN -100     
  END CATCH
END; -- Body of stored procedure;