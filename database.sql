USE [master]
GO
/****** Object:  Database [DressItDB]    Script Date: 7/21/2016 9:54:10 AM ******/
CREATE DATABASE [DressItDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DressItDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DressItDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DressItDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DressItDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DressItDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DressItDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DressItDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DressItDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DressItDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DressItDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DressItDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DressItDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DressItDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DressItDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DressItDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DressItDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DressItDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DressItDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DressItDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DressItDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DressItDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DressItDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DressItDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DressItDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DressItDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DressItDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DressItDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DressItDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DressItDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DressItDB] SET  MULTI_USER 
GO
ALTER DATABASE [DressItDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DressItDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DressItDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DressItDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DressItDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DressItDB]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 7/21/2016 9:54:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[OutfitID] [int] NOT NULL,
	[WardrobeItemID] [int] NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC,
	[WardrobeItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfits]    Script Date: 7/21/2016 9:54:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfits](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[TopID] [int] NOT NULL,
	[BottomID] [int] NOT NULL,
	[ShoeID] [int] NOT NULL,
 CONSTRAINT [PK_Outfits] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 7/21/2016 9:54:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WardrobeItems]    Script Date: 7/21/2016 9:54:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WardrobeItems](
	[WardrobeItemID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](max) NULL,
 CONSTRAINT [PK_WardrobeItems] PRIMARY KEY CLUSTERED 
(
	[WardrobeItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (1, N'Top')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (2, N'Bottom')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (3, N'Shoes')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[Types] OFF
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Outfits] FOREIGN KEY([OutfitID])
REFERENCES [dbo].[Outfits] ([OutfitID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Outfits]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_WardrobeItems] FOREIGN KEY([WardrobeItemID])
REFERENCES [dbo].[WardrobeItems] ([WardrobeItemID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_WardrobeItems]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems] FOREIGN KEY([TopID])
REFERENCES [dbo].[WardrobeItems] ([WardrobeItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems1] FOREIGN KEY([BottomID])
REFERENCES [dbo].[WardrobeItems] ([WardrobeItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems1]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems2] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[WardrobeItems] ([WardrobeItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems2]
GO
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_Types]
GO
USE [master]
GO
ALTER DATABASE [DressItDB] SET  READ_WRITE 
GO
