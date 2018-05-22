CREATE PROC pInsLoginRequest
(
	@Name [nvarchar](50) ,
	@EmailAddress [nvarchar](50) ,
	@LoginName [nvarchar](50),
	@NewOrReactivate [nvarchar](50),
	@ReasonForAccess [nvarchar](50) ,
	@DateNeededBy datetime
)
/**************************************************
Dev: RRoot
OriginalDate: Sept 4 2009 
ChangeLog: (Who, When, What)
	RRoot,Oct 10 2010,Added Try-Catch code.
**************************************************/
AS
Begin
DECLARE @RC int;
	Begin Try
		Begin Tran
			INSERT INTO [dbo].[LoginRequests]
                ([Name]
				,[EmailAddress]
				,[LoginName]
				,[NewOrReactivate]
				,[ReasonForAccess]
				,[DateNeededBy])
			VALUES
				(
					@Name ,
					@EmailAddress,
					@LoginName,
					@NewOrReactivate,
					@ReasonForAccess,
					@DateNeededBy
				)
		Commit Tran		
		Set @RC = 100
	End Try
	Begin Catch
		Rollback Tran
		Set @RC = -100	
	End Catch
	RETURN @RC
End