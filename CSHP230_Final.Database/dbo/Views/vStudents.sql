
-- dbo.vStudents
Create View vStudents
AS
Select [StudentId], [StudentName], [StudentEmail], [StudentLogin], [StudentPassword] From [Students]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vStudents] TO PUBLIC
    AS [dbo];

