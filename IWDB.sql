USE [master]
GO
/****** Object:  Database [IWDB]    Script Date: 11/12/2019 8:20:25 AM ******/
CREATE DATABASE [IWDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IWDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\IWDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IWDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\IWDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IWDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IWDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IWDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IWDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IWDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IWDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IWDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IWDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IWDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IWDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IWDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IWDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IWDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IWDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IWDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IWDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IWDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IWDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IWDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IWDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IWDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IWDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IWDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IWDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IWDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IWDB] SET  MULTI_USER 
GO
ALTER DATABASE [IWDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IWDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IWDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IWDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IWDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IWDB] SET QUERY_STORE = OFF
GO
USE [IWDB]
GO
/****** Object:  Table [dbo].[Anime]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime](
	[AnimeID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[ProdHouseID] [int] NOT NULL,
	[ProductionYear] [date] NOT NULL,
	[RatingID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Anime] PRIMARY KEY CLUSTERED 
(
	[AnimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimeCharacter]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeCharacter](
	[AnimeID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
 CONSTRAINT [PK_AnimeCharacter] PRIMARY KEY CLUSTERED 
(
	[AnimeID] ASC,
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[CharacterID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterName] [nvarchar](500) NOT NULL,
	[ActorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTrace]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTrace](
	[LoggerID] [int] NOT NULL,
	[Exception] [nvarchar](1000) NOT NULL,
	[StackTrace] [nvarchar](1000) NOT NULL,
	[TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdHouses]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdHouses](
	[ProdHouseID] [int] IDENTITY(1,1) NOT NULL,
	[ProdHouseName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProdHouses] PRIMARY KEY CLUSTERED 
(
	[ProdHouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[RatingName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Hash] [nvarchar](300) NOT NULL,
	[Salt] [nvarchar](300) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Anime] ON 

INSERT [dbo].[Anime] ([AnimeID], [Title], [ProdHouseID], [ProductionYear], [RatingID], [Description]) VALUES (1, N'Cowboy Bebop', 2, CAST(N'1999-01-01' AS Date), 6, N'Misadventures of a group of bounty hunters')
INSERT [dbo].[Anime] ([AnimeID], [Title], [ProdHouseID], [ProductionYear], [RatingID], [Description]) VALUES (2, N'RWBY', 1, CAST(N'2013-01-01' AS Date), 3, N'4 girls attempt to save the world')
INSERT [dbo].[Anime] ([AnimeID], [Title], [ProdHouseID], [ProductionYear], [RatingID], [Description]) VALUES (3, N'Sword Art Online', 3, CAST(N'2015-01-01' AS Date), 6, N'After being caught in an online game. ')
SET IDENTITY_INSERT [dbo].[Anime] OFF
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (1, 1)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (1, 2)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (1, 3)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (1, 4)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (2, 5)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (2, 6)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (2, 7)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (2, 8)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (3, 9)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (3, 10)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (3, 11)
INSERT [dbo].[AnimeCharacter] ([AnimeID], [CharacterID]) VALUES (3, 12)
SET IDENTITY_INSERT [dbo].[Character] ON 

INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (1, N'Spike Spiegel', N'Steve Blum')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (2, N'Jet Black', N'Beau Billingslea')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (3, N'Faye Valentine', N'Wendee Lee')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (4, N'Edward Wong Hau Pepelu Tivruski IV', N'Melissa Fahn')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (5, N'Ruby Rose', N'Lindsay Jones')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (6, N'Weiss Schnee', N'Kara Eberle')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (7, N'Yang Xiao Long', N'Barbara Dunkelman')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (8, N'Blake Belladonna', N'Arryn Zech')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (9, N'Kirito', N'Bryce Papenbrook')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (10, N'Asuna', N'Cherami Leigh')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (11, N'Yui', N'Stephanie Sheh')
INSERT [dbo].[Character] ([CharacterID], [CharacterName], [ActorName]) VALUES (12, N'Sinon', N'Michelle Ruff')
SET IDENTITY_INSERT [dbo].[Character] OFF
SET IDENTITY_INSERT [dbo].[ProdHouses] ON 

INSERT [dbo].[ProdHouses] ([ProdHouseID], [ProdHouseName]) VALUES (1, N'RoosterTeeth')
INSERT [dbo].[ProdHouses] ([ProdHouseID], [ProdHouseName]) VALUES (2, N'Sunrise')
INSERT [dbo].[ProdHouses] ([ProdHouseID], [ProdHouseName]) VALUES (3, N'Funimation')
INSERT [dbo].[ProdHouses] ([ProdHouseID], [ProdHouseName]) VALUES (4, N'Viz Media')
SET IDENTITY_INSERT [dbo].[ProdHouses] OFF
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([RatingID], [RatingName]) VALUES (1, N'G')
INSERT [dbo].[Ratings] ([RatingID], [RatingName]) VALUES (2, N'PG')
INSERT [dbo].[Ratings] ([RatingID], [RatingName]) VALUES (3, N'Y')
INSERT [dbo].[Ratings] ([RatingID], [RatingName]) VALUES (5, N'TV14')
INSERT [dbo].[Ratings] ([RatingID], [RatingName]) VALUES (6, N'MA')
INSERT [dbo].[Ratings] ([RatingID], [RatingName]) VALUES (9, N'Y7')
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Registered User')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Production House')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Administrator')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Email], [Hash], [Salt], [RoleID]) VALUES (1, N'Dragonscale', N'Usertest@yahoo.com', N'User1234', N'User1234', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Email], [Hash], [Salt], [RoleID]) VALUES (4, N'Drakescaler', N'Drakescaler@yahoo.com', N'User1234', N'User1234', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Email], [Hash], [Salt], [RoleID]) VALUES (5, N'Dragonolgy', N'dragonolgy@yahoo.com', N'User1234', N'User1234', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Email], [Hash], [Salt], [RoleID]) VALUES (9, N'Awesomeblossom', N'NotABlossom@yahoo.com', N'User1234', N'User1234', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Email], [Hash], [Salt], [RoleID]) VALUES (10, N'test', N'test@test.com', N'User1234', N'User1234', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Email], [Hash], [Salt], [RoleID]) VALUES (12, N'testing', N'testingtesting@test.com', N'AJHsPVPpd8Kt7WvNauwRHu1nUcFqiWt23u5RaY+X2xo5u/YiJLfdDZ9FxFsTilYNhw==', N'wV6kruN+1sVrOA/3lp5TqRFfm40nYf8meQ==', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Email], [Hash], [Salt], [RoleID]) VALUES (13, N'Bryan', N'bryan@onshore.com', N'AGVPbuGrCULZXzCuBwtrTJVY48ziyNdYf/UhJ78EaSqoWxWHdGBJR3D9I0Kv5qWTzA==', N'+NdjDyZR4ZdGUFFeAPjO9lPiiMPMSKVlYA==', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [Email]    Script Date: 11/12/2019 8:20:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Username]    Script Date: 11/12/2019 8:20:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD  CONSTRAINT [FK_Anime_ProdHouses] FOREIGN KEY([ProdHouseID])
REFERENCES [dbo].[ProdHouses] ([ProdHouseID])
GO
ALTER TABLE [dbo].[Anime] CHECK CONSTRAINT [FK_Anime_ProdHouses]
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Ratings] FOREIGN KEY([RatingID])
REFERENCES [dbo].[Ratings] ([RatingID])
GO
ALTER TABLE [dbo].[Anime] CHECK CONSTRAINT [FK_Anime_Ratings]
GO
ALTER TABLE [dbo].[AnimeCharacter]  WITH CHECK ADD  CONSTRAINT [FK_AnimeCharacter_Anime] FOREIGN KEY([AnimeID])
REFERENCES [dbo].[Anime] ([AnimeID])
GO
ALTER TABLE [dbo].[AnimeCharacter] CHECK CONSTRAINT [FK_AnimeCharacter_Anime]
GO
ALTER TABLE [dbo].[AnimeCharacter]  WITH CHECK ADD  CONSTRAINT [FK_AnimeCharacter_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([CharacterID])
GO
ALTER TABLE [dbo].[AnimeCharacter] CHECK CONSTRAINT [FK_AnimeCharacter_Character]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[ActorUpdateJust]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ActorUpdateJust]
@CharacterID int,
@CharacterName nvarchar(500),
@ActorName nvarchar(50)
as
begin
	update Character
	set CharacterName = @CharacterName, ActorName = @ActorName
	where ActorName = @ActorName
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeCharacterCreate]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeCharacterCreate]
@AnimeID int ,
@CharacterID int 
as 
begin
	insert into AnimeCharacter (AnimeID, CharacterID) values (@AnimeID, @CharacterID)
	
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeCharacterDelete]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AnimeCharacterDelete]
@AnimeID int ,
@CharacterID int 
as 
begin
	Delete from AnimeCharacter 
	where AnimeID = @AnimeID and CharacterID = @CharacterID
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeCreate]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeCreate]
@Title nvarchar(200),
@ProdHouseID int,
@ProductionYear date,
@RatingID int,
@Description nvarchar(MAX),
@AnimeID int output
as 
begin
	insert into Anime (Title, ProdHouseID, ProductionYear, RatingID, Description) values (@Title, @ProdHouseID, @ProductionYear, @RatingID, @Description)
	select @AnimeID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeDelete]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AnimeDelete]
@AnimeID int
as
begin
	delete from Anime
	where AnimeID = @AnimeID
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeFindByID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeFindByID]
@AnimeID int
as
begin
	select AnimeID, Title, Anime.ProdHouseID, ProdHouseName, ProductionYear, Anime.RatingID, RatingName, Description from Anime
	inner join ProdHouses on Anime.ProdHouseID = ProdHouses.ProdHouseID
	inner join Ratings on Ratings.RatingID = Anime.RatingID
	where AnimeID = @AnimeID
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeFindByTitle]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeFindByTitle]
@Title nvarchar(200)
as
begin

	select AnimeID, Title, Anime.ProdHouseID, ProdHouseName, ProductionYear, Anime.RatingID, RatingName, Description from Anime
	inner join ProdHouses on Anime.ProdHouseID = ProdHouses.ProdHouseID
	inner join Ratings on Anime.RatingID = Ratings.RatingID

	where Title = @Title
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeGetAll]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeGetAll]
@skip int,
@take int
as
begin

	select AnimeID, Title, Anime.ProdHouseID, ProdHouseName, ProductionYear, Anime.RatingID, RatingName, Description from Anime
	inner join ProdHouses on Anime.ProdHouseID = ProdHouses.ProdHouseID
	inner join Ratings on Anime.RatingID = Ratings.RatingID
	order by AnimeID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeGetAllbyCharacter]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AnimeGetAllbyCharacter]
@skip int,
@take int,
@CharacterID int
as
begin

	select ANime.AnimeID, Title, Anime.ProdHouseID, ProdHouseName, ProductionYear, Anime.RatingID, RatingName, Description from Anime
	inner join ProdHouses on Anime.ProdHouseID = ProdHouses.ProdHouseID
	inner join Ratings on Anime.RatingID = Ratings.RatingID
	inner join AnimeCharacter on AnimeCharacter.AnimeID = Anime.AnimeID
	where AnimeCharacter.CharacterID = @CharacterID
	order by AnimeID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeGetAllByCharacterID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeGetAllByCharacterID]
@skip int,
@take int,
@CharacterID int
as
begin

	select Anime.AnimeID, Title, Anime.ProdHouseID, ProdHouseName, ProductionYear, Anime.RatingID, RatingName, Description from Anime
	inner join ProdHouses on Anime.ProdHouseID = ProdHouses.ProdHouseID
	inner join Ratings on Anime.RatingID = Ratings.RatingID
	inner join AnimeCharacter on AnimeCharacter.AnimeID = Anime.AnimeID
	where AnimeCharacter.CharacterID = @CharacterID
	order by AnimeID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeGetRelatedtoProdHouse]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeGetRelatedtoProdHouse]
@skip int,
@take int,
@ProdHouseID int
as
begin

	select AnimeID, Title, Anime.ProdHouseID, ProdHouseName, ProductionYear, Anime.RatingID, RatingName, Description from Anime
	inner join ProdHouses on Anime.ProdHouseID = ProdHouses.ProdHouseID
	inner join Ratings on Anime.RatingID = Ratings.RatingID
	order by ProdHouseID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeGetRelatedtoProductionYear]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeGetRelatedtoProductionYear]
@skip int,
@take int,
@ProductionYear int
as
begin

	select AnimeID, Title, Anime.ProdHouseID, ProdHouseName, ProductionYear, Anime.RatingID, RatingName, Description from Anime
	inner join ProdHouses on Anime.ProdHouseID = ProdHouses.ProdHouseID
	inner join Ratings on Anime.RatingID = Ratings.RatingID
	order by ProductionYear
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeGetRelatedtoRating]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AnimeGetRelatedtoRating]
@skip int,
@take int,
@RatingID int
as
begin

	select AnimeID, Title, Anime.ProdHouseID, ProdHouseName, ProductionYear, Anime.RatingID, RatingName, Description from Anime
	inner join ProdHouses on Anime.ProdHouseID = ProdHouses.ProdHouseID
	inner join Ratings on Anime.RatingID = Ratings.RatingID
	order by RatingID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeObtainCount]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AnimeObtainCount]
as
begin
	select count (*) from Anime
end
GO
/****** Object:  StoredProcedure [dbo].[AnimeUpdateJust]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AnimeUpdateJust]
@AnimeID int,
@Title nvarchar(200),
@ProdHouseID int,
@ProductionYear date,
@RatingID int,
@Description nvarchar(max),
@UserID int
as
begin
	update Anime
	set Title = @Title, ProdHouseID = @ProdhouseID, ProductionYear = @ProductionYear, RatingID = @RatingID, Description = @Description, UserID = @UserID
	where Title = @Title
end
GO
/****** Object:  StoredProcedure [dbo].[CharacterCreate]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CharacterCreate]
@CharacterName nvarchar(500),
@ActorName nvarchar(500),
@CharacterID int output
as 
begin
	insert into Character (CharacterName, ActorName) values (@CharacterName, @ActorName)
	select @CharacterID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[CharacterDelete]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CharacterDelete]
@CharacterID int
as
begin
	delete from Character
	where CharacterID = @CharacterID
end
GO
/****** Object:  StoredProcedure [dbo].[CharacterFindByActor]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CharacterFindByActor]
@ActorName int
as
begin
	select CharacterID, CharacterName, ActorName from Character
	where ActorName = @ActorName
end
GO
/****** Object:  StoredProcedure [dbo].[CharacterFindByCharacterName]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CharacterFindByCharacterName]
@CharacterName int
as
begin
	select CharacterID, CharacterName, ActorName from Character
	where CharacterName = @CharacterName
end
GO
/****** Object:  StoredProcedure [dbo].[CharacterFindByID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CharacterFindByID]
@CharacterID int
as
begin
	select CharacterID, CharacterName, ActorName from Character
	where CharacterID = @CharacterID
end
GO
/****** Object:  StoredProcedure [dbo].[CharacterGetAll]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CharacterGetAll]
@skip int,
@take int
as
begin
	select CharacterID, CharacterName, ActorName from Character
	order by CharacterID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[CharacterGetAllbyAnimeID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CharacterGetAllbyAnimeID]
@skip int,
@take int,
@AnimeID int
as
begin
	select Character.CharacterID, CharacterName, ActorName from Character
	inner join AnimeCharacter on AnimeCharacter.CharacterID = Character.CharacterID
	where AnimeCharacter.AnimeID = @AnimeID
	order by CharacterID
	offset @skip rows 
	fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[CharactersObtainCount]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CharactersObtainCount]
as
begin
	select count (*) from Character
end
GO
/****** Object:  StoredProcedure [dbo].[CharacterUpdateJust]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CharacterUpdateJust]
@CharacterID int,
@CharacterName nvarchar(500),
@ActorName nvarchar(50)
as
begin
	update Character
	set CharacterName = @CharacterName, ActorName = @ActorName
	where CharacterName = @CharacterName
end
GO
/****** Object:  StoredProcedure [dbo].[InsertLogItem]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertLogItem] 
        @message varchar(250), 
        @stacktrace varchar(max)
AS
BEGIN
        INSERT INTO [dbo].[LogTrace]
           (Message, Trace, Time)
     VALUES
           (@message
           ,@stacktrace
           ,GetDate())
END
GO
/****** Object:  StoredProcedure [dbo].[ProdHouseCreate]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ProdHouseCreate]
@ProdhouseName nvarchar (50),
@ProdHouseID int output
as 
begin
	insert into ProdHouses(ProdHouseName) values (@ProdHouseID)
	select @ProdHouseID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[ProdHouseDelete]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ProdHouseDelete]
@ProdHouseID int
as
begin
	delete from ProdHouses
	where ProdHouseID = @ProdHouseID
end
GO
/****** Object:  StoredProcedure [dbo].[ProdHouseFindByID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ProdHouseFindByID]
@ProdHouseID nvarchar(50)
as
begin

	select ProdHouseID, ProdHouseName from ProdHouses
	where ProdHouseID = @ProdHouseID
end
GO
/****** Object:  StoredProcedure [dbo].[ProdHouseFindByProdHouse]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ProdHouseFindByProdHouse]
@ProdHouseName nvarchar(50)
as
begin

	select ProdHouseID, ProdHouseName from ProdHouses
	where ProdHouseName = @ProdHouseName
end
GO
/****** Object:  StoredProcedure [dbo].[ProdHouseGetAll]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ProdHouseGetAll]
@skip int,
@take int
as
begin
	select ProdHouseID, ProdHouseName from ProdHouses
	order by ProdHouseID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[ProdHouseUpdateJust]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProdHouseUpdateJust]
@ProdHouseID int,
@ProdHouseName nvarchar(50)
as
begin
	update ProdHouses
	set ProdHouseName = @ProdHouseName
	where ProdHouseID = @ProdHouseID
end
GO
/****** Object:  StoredProcedure [dbo].[RatingCreate]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RatingCreate]
@RatingName nvarchar(50),
@RatingID int output
as 
begin
	insert into ratings (RatingName) values (@RatingName)
	select @RatingID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[RatingDelete]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RatingDelete]
@RatingID int
as
begin
	delete from Ratings
	where RatingID = @RatingID
end
GO
/****** Object:  StoredProcedure [dbo].[RatingFindByID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RatingFindByID]
@RatingID int
as
begin
	select RatingID, RatingName from Ratings
	where RatingID = @RatingID
end
GO
/****** Object:  StoredProcedure [dbo].[RatingsGetAll]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RatingsGetAll]
@skip int,
@take int
as
begin
	select RatingID, RatingName from Ratings
	order by RatingID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[RatingUpdateJust]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RatingUpdateJust]
@RatingID int,
@RatingName nvarchar(200)
as
begin
	update Ratings set RatingName = @RatingName
	where RatingID = @RatingID
end
GO
/****** Object:  StoredProcedure [dbo].[resetdata]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[resetdata]

as
begin
    delete from Anime;
	delete from Character;
	delete from ProdHouses;  	
	delete from Ratings; 
	delete from Roles;
	delete from Users;


	DBCC CHECKIDENT ('Anime', RESEED, 0)
	DBCC CHECKIDENT ('Character', RESEED, 0)
	DBCC CHECKIDENT ('ProdHouse', RESEED, 0)
	DBCC CHECKIDENT ('Users', RESEED, 0)
	DBCC CHECKIDENT	('Roles', RESEED, 0)
end
GO
/****** Object:  StoredProcedure [dbo].[RoleCreate]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RoleCreate]
@RoleName nvarchar(200),
@RoleID int output
as 
begin
	insert into roles (RoleName) values (@RoleName)
	select @RoleID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[RoleDelete]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RoleDelete]
@RoleID int
as
begin
	delete from Users
	delete from Roles	
	where RoleID = @RoleID
end
GO
/****** Object:  StoredProcedure [dbo].[RoleFindByID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RoleFindByID]
@RoleID int
as
begin
	select RoleID, RoleName from Roles
	where RoleID = @RoleID
end
GO
/****** Object:  StoredProcedure [dbo].[RolesGetAll]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RolesGetAll]
@skip int,
@take int
as
begin
	select RoleID, RoleName from Roles
	order by RoleID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[RoleUpdateJust]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RoleUpdateJust]
@RoleID int,
@RoleName nvarchar(200)
as
begin
	update Roles set RoleName = @RoleName
	where RoleID = @RoleID
end
GO
/****** Object:  StoredProcedure [dbo].[RoleUpdateSafe]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RoleUpdateSafe]
@RoleID int,
@OldRoleName nvarchar(200),
@NewRoleName nvarchar(200)
as
begin
	update Roles set RoleName = @NewRoleName
	where RoleID = @RoleID and RoleName = @OldRoleName
end
GO
/****** Object:  StoredProcedure [dbo].[UserCreate]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserCreate]
@Username nvarchar (50),
@Email nvarchar(150),
@Hash nvarchar(300),
@Salt nvarchar(300),
@RoleID int,
@UserID int output
as 
begin
	insert into users (Username, Email, Hash, Salt, RoleID) values (@UserName, @Email, @Hash, @Salt, @RoleID)
	select @UserID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[UserDelete]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UserDelete]
@UserID int
as
begin
	delete from Users
	where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[UserFindByEmail]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[UserFindByEmail]
@Email nvarchar(150)
as
begin

	select UserID, Username, Email, Hash, Salt, Users.RoleID, RoleName from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	where Email = @Email
end
GO
/****** Object:  StoredProcedure [dbo].[UserFindByID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UserFindByID]
@UserID int
as
begin
	select UserID, Username, Email, Hash, Salt, Users.RoleID,RoleName from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[UserFindByUsername]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[UserFindByUsername]
@Username nvarchar(50)
as
begin

	select UserID, Username, Email, Hash, Salt, Users.RoleID, RoleName from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	where Username = @Username
end
GO
/****** Object:  StoredProcedure [dbo].[UsersGetAll]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UsersGetAll]
@skip int,
@take int
as
begin
	select UserID, Username, Email, Hash, Salt, Users.RoleID, RoleName from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	order by UserID
	offset @skip rows 
	fetch next @take rows only 
end
GO
/****** Object:  StoredProcedure [dbo].[UsersGetRelatedtoRoleID]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UsersGetRelatedtoRoleID]
@skip int,
@take int,
@RoleID int
as
begin
	select userID, Username, Email, Hash, Salt, Users.RoleID, RoleName from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	where Users.RoleID = @RoleID
	order by RoleID
	offset @skip rows 
	fetch next @take rows only 
	
end
GO
/****** Object:  StoredProcedure [dbo].[UsersObtainCount]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UsersObtainCount]
as
begin
	select count (*) from Users
end
GO
/****** Object:  StoredProcedure [dbo].[UserUpdateJust]    Script Date: 11/12/2019 8:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserUpdateJust]
@UserID int,
@Username nvarchar(50),
@Email nvarchar(150),
@Hash nvarchar(300),
@Salt nvarchar(300),
@RoleID int
as
begin
	update Users
	set Username = @Username, Email = @Email, Hash = @Hash, Salt = @Salt, RoleID = @RoleID
	where UserID = @UserID
end
GO
USE [master]
GO
ALTER DATABASE [IWDB] SET  READ_WRITE 
GO
