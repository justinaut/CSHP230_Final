CREATE TABLE [dbo].[Students] (
    [StudentId]       INT            NOT NULL,
    [StudentName]     NVARCHAR (100) NOT NULL,
    [StudentEmail]    NVARCHAR (100) NOT NULL,
    [StudentLogin]    NVARCHAR (50)  NULL,
    [StudentPassword] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([StudentId] ASC)
);

