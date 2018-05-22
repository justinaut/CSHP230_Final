CREATE TABLE [dbo].[LoginRequests] (
    [LoginId]         INT           IDENTITY (1, 1) NOT NULL,
    [Name]            NVARCHAR (50) NOT NULL,
    [EmailAddress]    NVARCHAR (50) NOT NULL,
    [LoginName]       NVARCHAR (50) NOT NULL,
    [NewOrReactivate] NVARCHAR (50) NOT NULL,
    [ReasonForAccess] NVARCHAR (50) NOT NULL,
    [DateNeededBy]    DATETIME      NULL,
    CONSTRAINT [PK_LoginRequests] PRIMARY KEY CLUSTERED ([LoginId] ASC)
);

