CREATE TABLE [dbo].[Classes] (
    [ClassId]          INT             NOT NULL,
    [ClassName]        NVARCHAR (100)  NOT NULL,
    [ClassDate]        DATETIME        NOT NULL,
    [ClassDescription] NVARCHAR (2000) NOT NULL,
    CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED ([ClassId] ASC)
);

