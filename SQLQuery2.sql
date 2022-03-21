USE [master]
GO
/****** Object:  Database [RepairDB]    Script Date: 19.03.2022 18:54:20 ******/
CREATE DATABASE [RepairDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RepairDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RepairDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RepairDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RepairDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RepairDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepairDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepairDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RepairDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RepairDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RepairDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RepairDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RepairDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RepairDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RepairDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RepairDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RepairDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RepairDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RepairDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RepairDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RepairDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RepairDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RepairDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RepairDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RepairDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RepairDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RepairDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RepairDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RepairDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RepairDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RepairDB] SET  MULTI_USER 
GO
ALTER DATABASE [RepairDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RepairDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RepairDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RepairDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RepairDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RepairDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RepairDB', N'ON'
GO
ALTER DATABASE [RepairDB] SET QUERY_STORE = OFF
GO
USE [RepairDB]
GO
/****** Object:  Table [dbo].[dop_chast]    Script Date: 19.03.2022 18:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dop_chast](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NOT NULL,
	[price] [int] NOT NULL,
	[date_input] [date] NOT NULL,
	[id_into_repair] [int] NULL,
 CONSTRAINT [PK_dop_chast] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fillial]    Script Date: 19.03.2022 18:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fillial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Fillial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Histori_remove]    Script Date: 19.03.2022 18:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Histori_remove](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[From] [int] NOT NULL,
	[To] [int] NOT NULL,
	[Time_Date] [date] NOT NULL,
	[id_machine] [int] NULL,
 CONSTRAINT [PK_Histori_remove] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[into_repair]    Script Date: 19.03.2022 18:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[into_repair](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_into] [date] NOT NULL,
	[id_kind_repair] [int] NULL,
	[id_worker_input] [int] NULL,
	[id_worker_output] [int] NULL,
 CONSTRAINT [PK_into_repair] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kind_repair]    Script Date: 19.03.2022 18:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kind_repair](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_kind_repair] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 19.03.2022 18:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machine](
	[invent_number] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[model] [nvarchar](50) NOT NULL,
	[god_vipuska] [date] NOT NULL,
 CONSTRAINT [PK_Machine] PRIMARY KEY CLUSTERED 
(
	[invent_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.03.2022 18:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lovgin] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[date_reg] [date] NOT NULL,
	[date_last_autor] [date] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 19.03.2022 18:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](50) NOT NULL,
	[Sname] [nvarchar](50) NOT NULL,
	[Lname] [nvarchar](50) NULL,
	[Dolgnost] [nvarchar](50) NOT NULL,
	[Date_begin] [date] NOT NULL,
	[Date_end] [date] NOT NULL,
	[id_fillial] [int] NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dop_chast]  WITH CHECK ADD  CONSTRAINT [FK_dop_chast_into_repair] FOREIGN KEY([id_into_repair])
REFERENCES [dbo].[into_repair] ([id])
GO
ALTER TABLE [dbo].[dop_chast] CHECK CONSTRAINT [FK_dop_chast_into_repair]
GO
ALTER TABLE [dbo].[Histori_remove]  WITH CHECK ADD  CONSTRAINT [FK_Histori_remove_Fillial] FOREIGN KEY([From])
REFERENCES [dbo].[Fillial] ([id])
GO
ALTER TABLE [dbo].[Histori_remove] CHECK CONSTRAINT [FK_Histori_remove_Fillial]
GO
ALTER TABLE [dbo].[Histori_remove]  WITH CHECK ADD  CONSTRAINT [FK_Histori_remove_Fillial1] FOREIGN KEY([To])
REFERENCES [dbo].[Fillial] ([id])
GO
ALTER TABLE [dbo].[Histori_remove] CHECK CONSTRAINT [FK_Histori_remove_Fillial1]
GO
ALTER TABLE [dbo].[Histori_remove]  WITH CHECK ADD  CONSTRAINT [FK_Histori_remove_Machine] FOREIGN KEY([id_machine])
REFERENCES [dbo].[Machine] ([invent_number])
GO
ALTER TABLE [dbo].[Histori_remove] CHECK CONSTRAINT [FK_Histori_remove_Machine]
GO
ALTER TABLE [dbo].[into_repair]  WITH CHECK ADD  CONSTRAINT [FK_into_repair_kind_repair] FOREIGN KEY([id_kind_repair])
REFERENCES [dbo].[kind_repair] ([id])
GO
ALTER TABLE [dbo].[into_repair] CHECK CONSTRAINT [FK_into_repair_kind_repair]
GO
ALTER TABLE [dbo].[into_repair]  WITH CHECK ADD  CONSTRAINT [FK_into_repair_Worker] FOREIGN KEY([id_worker_input])
REFERENCES [dbo].[Worker] ([id])
GO
ALTER TABLE [dbo].[into_repair] CHECK CONSTRAINT [FK_into_repair_Worker]
GO
ALTER TABLE [dbo].[into_repair]  WITH CHECK ADD  CONSTRAINT [FK_into_repair_Worker1] FOREIGN KEY([id_worker_output])
REFERENCES [dbo].[Worker] ([id])
GO
ALTER TABLE [dbo].[into_repair] CHECK CONSTRAINT [FK_into_repair_Worker1]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Fillial] FOREIGN KEY([id_fillial])
REFERENCES [dbo].[Fillial] ([id])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Fillial]
GO
USE [master]
GO
ALTER DATABASE [RepairDB] SET  READ_WRITE 
GO
