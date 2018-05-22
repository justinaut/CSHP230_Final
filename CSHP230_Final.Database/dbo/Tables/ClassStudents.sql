CREATE TABLE [dbo].[ClassStudents] (
    [ClassId]   INT NOT NULL,
    [StudentId] INT NOT NULL,
    CONSTRAINT [PK_ClassStudents] PRIMARY KEY CLUSTERED ([ClassId] ASC, [StudentId] ASC),
    CONSTRAINT [FK_ClassStudents_Classes] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Classes] ([ClassId]),
    CONSTRAINT [FK_ClassStudents_Students] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([StudentId])
);

