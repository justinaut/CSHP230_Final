Create View vClasses -- Required for Project
AS
Select [ClassId], [ClassName], [ClassDate], [ClassDescription] From [Classes]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vClasses] TO PUBLIC
    AS [dbo];

