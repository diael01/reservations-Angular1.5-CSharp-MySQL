-- ==========================================================================================================
-- author		: dave.s (@sextondjc)
-- date			: 2016-06-09
-- description	: sample database to go along with Drapper.Samples. 
-- ==========================================================================================================

USE [DrapperSamples]
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DrapperSamples')
BEGIN

	ALTER DATABASE [DrapperSamples] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetCurrencies]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_GetCurrencies]

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Currencies]') AND type in (N'U'))
	DROP TABLE [dbo].[Currencies]
END
GO

USE [master]
GO
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'DrapperSamples')
DROP DATABASE [DrapperSamples]
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DrapperSamples')
BEGIN
CREATE DATABASE [DrapperSamples]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DrapperSamples', FILENAME = N'C:\Users\sexto\DrapperSamples.mdf' , SIZE = 78848KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DrapperSamples_log', FILENAME = N'C:\Users\sexto\DrapperSamples_log.ldf' , SIZE = 568896KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [DrapperSamples] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DrapperSamples].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DrapperSamples] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DrapperSamples] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DrapperSamples] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DrapperSamples] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DrapperSamples] SET ARITHABORT OFF 
GO
ALTER DATABASE [DrapperSamples] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DrapperSamples] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DrapperSamples] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DrapperSamples] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DrapperSamples] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DrapperSamples] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DrapperSamples] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DrapperSamples] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DrapperSamples] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DrapperSamples] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DrapperSamples] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DrapperSamples] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DrapperSamples] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DrapperSamples] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DrapperSamples] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DrapperSamples] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DrapperSamples] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DrapperSamples] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DrapperSamples] SET  MULTI_USER 
GO
ALTER DATABASE [DrapperSamples] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DrapperSamples] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DrapperSamples] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DrapperSamples] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DrapperSamples] SET DELAYED_DURABILITY = DISABLED 
GO

USE [DrapperSamples]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Currencies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Currencies](
	[NumericCode] [varchar](3) NULL,
	[AlphabeticCode] [varchar](3) NULL,
	[Name] [varchar](125) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'978', N'EUR', N'Euro')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'012', N'DZD', N'Algerian Dinar')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'840', N'USD', N'US Dollar')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'973', N'AOA', N'Kwanza')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'951', N'XCD', N'East Caribbean Dollar')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'032', N'ARS', N'Argentine Peso')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'051', N'AMD', N'Armenian Dram')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'533', N'AWG', N'Aruban Florin')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'710', N'ZAR', N'South African Rand')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'430', N'LRD', N'Liberian Dollar')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'756', N'CHF', N'Swiss franc')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'578', N'NOK', N'Norwegian Krone')
GO
INSERT [dbo].[Currencies] ([NumericCode], [AlphabeticCode], [Name]) VALUES (N'208', N'DKK', N'Danish Krone')
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetCurrencies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_GetCurrencies] AS' 
END
GO
ALTER procedure [dbo].[usp_GetCurrencies] (
	@page int = 1
	,@size int = 10
	)
as
begin

	set nocount on;

	-- return pagination data
	declare @meta table (
		[Page] int
		,[Size] int
		,[Total] int);
	
	-- table variable to hold our 
	-- paginated results
	declare @result table (
		[NumericCode] varchar(3)
		,[AlphabeticCode] varchar(3)
		,[Name] varchar(125));

	-- source our paginated data 
	-- from the underlying table.
	insert into @result (
		[NumericCode]
		,[AlphabeticCode]
		,[Name])	
	select [NumericCode]
		,[AlphabeticCode]
		,[Name]
	from [dbo].[Currencies]
	order by [AlphabeticCode] offset ((@page - 1) * @size) rows 
	fetch next @size rows only;

	-- get the total number of 
	-- rows in the table
	declare @total int;
	select @total = count(1)
	from [dbo].[Currencies];

	-- build up the pagination data
	insert into @meta (
		[Page]
		,[Size]
		,[Total])
	select @page
		,@size
		,@total;

	-- return pagination data.
	select [Page]
		,[Size]
		,[Total]
	from @meta;

	-- return paged data
	select [NumericCode]
		,[AlphabeticCode]
		,[Name]
	from @result;	
end

GO

USE [master]
GO
ALTER DATABASE [DrapperSamples] SET  READ_WRITE 
ALTER DATABASE [DrapperSamples] SET MULTI_USER
GO
