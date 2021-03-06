USE [master]
GO
/****** Object:  Database [XphoneDB]    Script Date: 31-Oct-17 9:57:05 AM ******/
CREATE DATABASE [XphoneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XphoneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XphoneDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XphoneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XphoneDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XphoneDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XphoneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XphoneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XphoneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XphoneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XphoneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XphoneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [XphoneDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XphoneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XphoneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XphoneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XphoneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XphoneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XphoneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XphoneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XphoneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XphoneDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XphoneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XphoneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XphoneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XphoneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XphoneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XphoneDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XphoneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XphoneDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XphoneDB] SET  MULTI_USER 
GO
ALTER DATABASE [XphoneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XphoneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XphoneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XphoneDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [XphoneDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [XphoneDB]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 31-Oct-17 9:57:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Vendor] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersTB]    Script Date: 31-Oct-17 9:57:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTB](
	[UserName] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UsersTB] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Vendor]) VALUES (1, N'test', 100, N'test1')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Vendor]) VALUES (2, N'lala', 20, N'lala')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Vendor]) VALUES (3, N'lala', 50, N'yadin')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Vendor]) VALUES (4, N'asd', 22, N'a')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Vendor]) VALUES (5, N'try', 888.33001708984375, N'rr')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Vendor]) VALUES (6, N'sdd', 22, N'dd')
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[UsersTB] ([UserName], [UserPassword]) VALUES (N'yadin', N'123')
/****** Object:  StoredProcedure [dbo].[getProducts]    Script Date: 31-Oct-17 9:57:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[getProducts]
as
BEGIN

SELECT * 
FROM Products
ORDER BY ProductName asc

END


GO
/****** Object:  StoredProcedure [dbo].[getUsers]    Script Date: 31-Oct-17 9:57:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[getUsers]
@UserNameTemp nvarchar(50),
@PassTemp nvarchar(50)

as
BEGIN

SELECT UserName
FROM UsersTB
where UserName = @UserNameTemp AND UserPassword = @PassTemp
ORDER BY UserName asc

END
GO
/****** Object:  StoredProcedure [dbo].[insertProduct]    Script Date: 31-Oct-17 9:57:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[insertProduct]
@ProductName nvarchar(50),
@Price float,
@Vendor nvarchar(50)

as
BEGIN

INSERT INTO [dbo].[Products]
           ([ProductName]
           ,[Price]
           ,[Vendor])
     VALUES
           (@ProductName,
           @Price, 
           @Vendor)
 END

GO
/****** Object:  StoredProcedure [dbo].[Test]    Script Date: 31-Oct-17 9:57:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Test] 
as
select * From UsersTB

GO
USE [master]
GO
ALTER DATABASE [XphoneDB] SET  READ_WRITE 
GO
