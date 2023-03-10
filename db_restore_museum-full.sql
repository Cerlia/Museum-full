USE [master]
GO
/****** Object:  Database [museum-full]    Script Date: 18/02/2023 14:05:58 ******/
CREATE DATABASE [museum-full]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'musee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\musee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'musee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\musee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [museum-full] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [museum-full].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [museum-full] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [museum-full] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [museum-full] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [museum-full] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [museum-full] SET ARITHABORT OFF 
GO
ALTER DATABASE [museum-full] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [museum-full] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [museum-full] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [museum-full] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [museum-full] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [museum-full] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [museum-full] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [museum-full] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [museum-full] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [museum-full] SET  DISABLE_BROKER 
GO
ALTER DATABASE [museum-full] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [museum-full] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [museum-full] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [museum-full] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [museum-full] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [museum-full] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [museum-full] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [museum-full] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [museum-full] SET  MULTI_USER 
GO
ALTER DATABASE [museum-full] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [museum-full] SET DB_CHAINING OFF 
GO
ALTER DATABASE [museum-full] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [museum-full] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [museum-full] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [museum-full] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [museum-full] SET QUERY_STORE = OFF
GO
USE [museum-full]
GO
/****** Object:  User [museum]    Script Date: 18/02/2023 14:05:59 ******/
CREATE USER [museum] FOR LOGIN [museum] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [museum]
GO
/****** Object:  Table [dbo].[art]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[art](
	[id_art] [int] NOT NULL,
	[ref_art_type] [int] NOT NULL,
	[ref_author] [int] NOT NULL,
	[ref_art_status] [int] NOT NULL,
	[art_code] [nvarchar](50) NOT NULL,
	[art_title] [nvarchar](50) NOT NULL,
	[creation_date] [nvarchar](50) NOT NULL,
	[materials] [nvarchar](50) NOT NULL,
	[dim_x] [int] NOT NULL,
	[dim_y] [int] NOT NULL,
	[dim_z] [int] NOT NULL,
	[image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_art] PRIMARY KEY CLUSTERED 
(
	[id_art] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[art_status]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[art_status](
	[id_art_status] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_art_status] PRIMARY KEY CLUSTERED 
(
	[id_art_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[art_type]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[art_type](
	[id_art_type] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_art_type] PRIMARY KEY CLUSTERED 
(
	[id_art_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[author]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author](
	[id_author] [int] NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[additional_name] [nvarchar](50) NULL,
	[dates] [nvarchar](50) NULL,
 CONSTRAINT [PK_author] PRIMARY KEY CLUSTERED 
(
	[id_author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[display]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[display](
	[id_display] [int] NOT NULL,
	[ref_zone] [int] NULL,
	[ref_display_type] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[dim_x] [int] NOT NULL,
	[dim_y] [int] NOT NULL,
	[dim_z] [int] NOT NULL,
 CONSTRAINT [PK_display] PRIMARY KEY CLUSTERED 
(
	[id_display] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[display_art_type]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[display_art_type](
	[id_display_art_type] [int] NOT NULL,
	[ref_display_type] [int] NOT NULL,
	[ref_art_type] [int] NOT NULL,
 CONSTRAINT [PK_display_art_type_1] PRIMARY KEY CLUSTERED 
(
	[id_display_art_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[display_type]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[display_type](
	[id_display_type] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_display_type] PRIMARY KEY CLUSTERED 
(
	[id_display_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[door]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[door](
	[id_door] [int] IDENTITY(1,1) NOT NULL,
	[ref_room] [int] NOT NULL,
	[dim_x] [int] NOT NULL,
	[dim_z] [int] NOT NULL,
	[pos_x] [int] NOT NULL,
	[pos_y] [int] NOT NULL,
 CONSTRAINT [PK_door] PRIMARY KEY CLUSTERED 
(
	[id_door] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[museum_user]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[museum_user](
	[id_user] [int] NOT NULL,
	[ref_role] [int] NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id_role] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[id_room] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[floor] [int] NOT NULL,
	[dim_x] [int] NOT NULL,
	[dim_y] [int] NOT NULL,
	[dim_z] [int] NOT NULL,
	[pos_x] [int] NOT NULL,
	[pos_y] [int] NOT NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[id_room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zone]    Script Date: 18/02/2023 14:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zone](
	[id_zone] [int] NOT NULL,
	[ref_room] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[dim_x] [int] NOT NULL,
	[dim_y] [int] NOT NULL,
 CONSTRAINT [PK_zone] PRIMARY KEY CLUSTERED 
(
	[id_zone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[art]  WITH CHECK ADD  CONSTRAINT [FK_art_art_status] FOREIGN KEY([ref_art_status])
REFERENCES [dbo].[art_status] ([id_art_status])
GO
ALTER TABLE [dbo].[art] CHECK CONSTRAINT [FK_art_art_status]
GO
ALTER TABLE [dbo].[art]  WITH CHECK ADD  CONSTRAINT [FK_art_art_type] FOREIGN KEY([ref_art_type])
REFERENCES [dbo].[art_type] ([id_art_type])
GO
ALTER TABLE [dbo].[art] CHECK CONSTRAINT [FK_art_art_type]
GO
ALTER TABLE [dbo].[art]  WITH CHECK ADD  CONSTRAINT [FK_art_author] FOREIGN KEY([ref_author])
REFERENCES [dbo].[author] ([id_author])
GO
ALTER TABLE [dbo].[art] CHECK CONSTRAINT [FK_art_author]
GO
ALTER TABLE [dbo].[display]  WITH CHECK ADD  CONSTRAINT [FK_display_display_type] FOREIGN KEY([ref_display_type])
REFERENCES [dbo].[display_type] ([id_display_type])
GO
ALTER TABLE [dbo].[display] CHECK CONSTRAINT [FK_display_display_type]
GO
ALTER TABLE [dbo].[display]  WITH CHECK ADD  CONSTRAINT [FK_display_zone] FOREIGN KEY([ref_zone])
REFERENCES [dbo].[zone] ([id_zone])
GO
ALTER TABLE [dbo].[display] CHECK CONSTRAINT [FK_display_zone]
GO
ALTER TABLE [dbo].[display_art_type]  WITH CHECK ADD  CONSTRAINT [FK_display_art_type_art_type] FOREIGN KEY([ref_art_type])
REFERENCES [dbo].[art_type] ([id_art_type])
GO
ALTER TABLE [dbo].[display_art_type] CHECK CONSTRAINT [FK_display_art_type_art_type]
GO
ALTER TABLE [dbo].[display_art_type]  WITH CHECK ADD  CONSTRAINT [FK_display_art_type_display_type] FOREIGN KEY([ref_display_type])
REFERENCES [dbo].[display_type] ([id_display_type])
GO
ALTER TABLE [dbo].[display_art_type] CHECK CONSTRAINT [FK_display_art_type_display_type]
GO
ALTER TABLE [dbo].[door]  WITH CHECK ADD  CONSTRAINT [FK_door_room] FOREIGN KEY([ref_room])
REFERENCES [dbo].[room] ([id_room])
GO
ALTER TABLE [dbo].[door] CHECK CONSTRAINT [FK_door_room]
GO
ALTER TABLE [dbo].[museum_user]  WITH CHECK ADD  CONSTRAINT [FK_user_role] FOREIGN KEY([ref_role])
REFERENCES [dbo].[role] ([id_role])
GO
ALTER TABLE [dbo].[museum_user] CHECK CONSTRAINT [FK_user_role]
GO
ALTER TABLE [dbo].[zone]  WITH CHECK ADD  CONSTRAINT [FK_zone_room] FOREIGN KEY([ref_room])
REFERENCES [dbo].[room] ([id_room])
GO
ALTER TABLE [dbo].[zone] CHECK CONSTRAINT [FK_zone_room]
GO
USE [master]
GO
ALTER DATABASE [museum-full] SET  READ_WRITE 
GO
