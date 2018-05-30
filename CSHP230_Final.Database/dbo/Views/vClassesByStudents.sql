
-- dbo.vClassesByStudents -- Required for Project
Create View vClassesByStudents
AS
Select 
 C.[ClassId]
,C.[ClassName]
,C.[ClassDate]
,C.[ClassDescription]
,S.[StudentId]
,S.[StudentName]
,S.[StudentEmail]
From [Classes] as C
Join [ClassStudents] as CS
 On C.ClassId = CS.ClassId
Join [Students] as S
 On CS.StudentId = S.StudentId
GO
GRANT SELECT
    ON OBJECT::[dbo].[vClassesByStudents] TO PUBLIC
    AS [dbo];

