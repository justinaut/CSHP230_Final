﻿CREATE -- DROP
PROCEDURE dbo.pUpdClassStudents ( 
  @OriginalClassId int
, @OriginalStudentId int
, @NewClassId int
, @NewStudentId int
)
AS
/***************************************************
Dev: RRoot
Date: Nov, 10, 2011
Desc: This stored procedure changes data in the 
ClassStudents table 
ChangeLog: (Who, When, What)
***************************************************/
BEGIN -- Body of stored procedure:
  BEGIN TRY
    BEGIN TRANSACTION;
    ------------------- Transaction Statement:
    UPDATE [AdvWebDevProject].[dbo].[ClassStudents]
     SET [ClassId] = @NewClassId
          , [StudentId] = @NewStudentId
     Where  [ClassId] = @OriginalClassId
     AND [StudentId] = @OriginalStudentId;
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
    ON OBJECT::[dbo].[pUpdClassStudents] TO PUBLIC
    AS [dbo];

