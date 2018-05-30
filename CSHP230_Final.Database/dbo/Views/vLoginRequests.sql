
-- dbo.vLoginRequests
Create View vLoginRequests
AS
Select [LoginId], [Name], [EmailAddress], [LoginName], [NewOrReactivate], [ReasonForAccess], [DateRequiredBy] From [LoginRequests]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vLoginRequests] TO PUBLIC
    AS [dbo];

