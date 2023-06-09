USE [master]
GO
/****** Object:  Database [CargoManagementDB]    Script Date: 20/03/2023 4:05:50 am ******/
CREATE DATABASE [CargoManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CargoManagementDB', FILENAME = N'C:\Users\ka\CargoManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CargoManagementDB_log', FILENAME = N'C:\Users\ka\CargoManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CargoManagementDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CargoManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CargoManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CargoManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CargoManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CargoManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CargoManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CargoManagementDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CargoManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CargoManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CargoManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CargoManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CargoManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CargoManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CargoManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CargoManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CargoManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CargoManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CargoManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CargoManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CargoManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CargoManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CargoManagementDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CargoManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CargoManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CargoManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [CargoManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CargoManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CargoManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CargoManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CargoManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CargoManagementDB] SET QUERY_STORE = OFF
GO
USE [CargoManagementDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20/03/2023 4:05:50 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarrierConfigurations]    Script Date: 20/03/2023 4:05:50 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierConfigurations](
	[CarrierId] [int] NOT NULL,
	[CarrierMaxDesi] [int] NOT NULL,
	[CarrierMinDesi] [int] NOT NULL,
	[CarrierCost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CarrierConfigurations] PRIMARY KEY CLUSTERED 
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carriers]    Script Date: 20/03/2023 4:05:50 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carriers](
	[CarrierId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierName] [nvarchar](50) NOT NULL,
	[CarrierIsActive] [bit] NOT NULL,
	[CarrierPlusDesiCost] [int] NOT NULL,
 CONSTRAINT [PK_Carriers] PRIMARY KEY CLUSTERED 
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20/03/2023 4:05:50 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierId] [int] NOT NULL,
	[OrderDesi] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[OrderCarrierCost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230318233128_FirstMigration', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230319001529_SecondMigration', N'7.0.4')
GO
INSERT [dbo].[CarrierConfigurations] ([CarrierId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost]) VALUES (3, 30, 25, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[CarrierConfigurations] ([CarrierId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost]) VALUES (4, 45, 35, CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[CarrierConfigurations] ([CarrierId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost]) VALUES (1002, 20, 5, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[CarrierConfigurations] ([CarrierId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost]) VALUES (1003, 15, 0, CAST(50.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Carriers] ON 

INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (3, N'Ahmet', 1, 5)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (4, N'Hediye', 1, 10)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (1002, N'Ayşenur', 1, 15)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (1003, N'Reyhan', 1, 25)
SET IDENTITY_INSERT [dbo].[Carriers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (2, 1002, 10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (4, 1002, 15, CAST(N'2023-03-20T03:38:35.5221971' AS DateTime2), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (6, 3, 33, CAST(N'2023-03-20T03:41:55.4029367' AS DateTime2), CAST(20.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
/****** Object:  Index [IX_Orders_CarrierId]    Script Date: 20/03/2023 4:05:50 am ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CarrierId] ON [dbo].[Orders]
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CarrierConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_CarrierConfigurations_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
GO
ALTER TABLE [dbo].[CarrierConfigurations] CHECK CONSTRAINT [FK_CarrierConfigurations_Carriers_CarrierId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Carriers_CarrierId]
GO
USE [master]
GO
ALTER DATABASE [CargoManagementDB] SET  READ_WRITE 
GO
