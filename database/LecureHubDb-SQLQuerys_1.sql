-- Create a new database called 'LectureHubDb'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'LectureHubDb'
)
CREATE DATABASE LectureHubDb
GO


---------- CREATE ----------
USE LectureHubDb



--------------BOOKS
-- CREATE [Books] table in schema [dbo]
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Books]', 'U') IS NOT NULL
DROP TABLE [dbo].[Books]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Books]
(
    [bookId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- Primary Key column
    [title] NVARCHAR(80) NOT NULL,
    [description] TEXT NOT NULL,
    [author] NVARCHAR(80) NOT NULL,
    [genre] VARCHAR(50),
    [poster] VARCHAR(255),
    [year] SMALLDATETIME,
);
GO


--------------USERS
-- CREATE [Users] table in schema [dbo]
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Users]', 'U') IS NOT NULL
DROP TABLE [dbo].[Users]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Users]
(
    [userId] INT NOT NULL IDENTITY(1,1), --identity (inicia en 1, y aumente de 1en1)
    [username] VARCHAR(50) NOT NULL UNIQUE,
    [email] VARCHAR(50) NOT NULL,
    [password] VARCHAR(255) NOT NULL,

    --Constraints
    CONSTRAINT PK_Users PRIMARY KEY 
    (
        userId ASC
    ),
);
GO


-- CREATE [UserFavorites] table in schema [dbo]
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserFavorites]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserFavorites]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UserFavorites]
(
    [userFavoriteId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [userId] INT NOT NULL,
    [bookId] INT NOT NULL,

    --Restriccion de FK
    CONSTRAINT FK_User_UserFavorites FOREIGN KEY (userId) 
        REFERENCES Users(userId),
        
    CONSTRAINT FK_Book_UserFavorites FOREIGN KEY (bookId) 
        REFERENCES Books(bookId)
);
GO

-- CREATE [BooksRead] table in schema [dbo]
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[BooksRead]', 'U') IS NOT NULL
DROP TABLE [dbo].[BooksRead]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[BooksRead]
(
    [booksReadId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [userId] INT NOT NULL,
    [bookId] INT NOT NULL,

    --Restriccion de FK
    CONSTRAINT FK_User_BooksRead FOREIGN KEY (userId) 
        REFERENCES Users(userId),

    CONSTRAINT FK_Book_BooksRead FOREIGN KEY (bookId) 
        REFERENCES Books(bookId)
);
GO


-- CREATE [ReadLater] table in schema [dbo]
IF OBJECT_ID('[dbo].[ReadLater]', 'U') IS NOT NULL
DROP TABLE [dbo].[ReadLater];
GO

CREATE TABLE [dbo].[ReadLater]
(
    [readLaterId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- Primary Key column
    [userId] INT NOT NULL,
    [bookId] INT NOT NULL,

    CONSTRAINT FK_User_ReadLater FOREIGN KEY (userId) 
        REFERENCES Users(userId),
        
    CONSTRAINT FK_Book_ReadLater FOREIGN KEY (bookId) 
        REFERENCES Books(bookId)
);
GO

