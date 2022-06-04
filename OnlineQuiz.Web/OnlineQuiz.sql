USE [master]
GO
/****** Object:  Database [OnlineQuiz]    Script Date: 08-05-2021 12:07:55 ******/
CREATE DATABASE [OnlineQuiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineQuiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\OnlineQuiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineQuiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\OnlineQuiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineQuiz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineQuiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineQuiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineQuiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineQuiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineQuiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineQuiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineQuiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineQuiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineQuiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineQuiz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineQuiz] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineQuiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineQuiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineQuiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineQuiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineQuiz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineQuiz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OnlineQuiz] SET QUERY_STORE = OFF
GO
USE [OnlineQuiz]
GO
/****** Object:  Table [dbo].[AttemptQuiz]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttemptQuiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TestSeriesId] [int] NULL,
	[AttemtDate] [datetime] NULL,
	[isCompleted] [bit] NULL,
	[Scored] [int] NULL,
	[Userid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[config]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[allowBack] [bit] NULL,
	[allowReview] [bit] NULL,
	[autoMove] [bit] NULL,
	[duration] [bit] NULL,
	[pageSize] [bit] NULL,
	[requiredAll] [bit] NULL,
	[richText] [bit] NULL,
	[shuffleQuestions] [bit] NULL,
	[shuffleOptions] [bit] NULL,
	[showClock] [bit] NULL,
	[showPager] [bit] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterQuestionPdf]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterQuestionPdf](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[qustinonLink] [nvarchar](500) NOT NULL,
	[AnswerLink] [nvarchar](500) NULL,
	[PaperType] [int] NOT NULL,
	[Yeasr] [nvarchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PName] [nvarchar](300) NULL,
	[SMonth] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[isAnswer] [bit] NULL,
	[QuestionId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaperType]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaperType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectText] [nvarchar](500) NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PdfSeries]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PdfSeries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YearQ] [int] NOT NULL,
	[TestSeriesName] [nvarchar](500) NOT NULL,
	[DownLoadLink] [nvarchar](550) NOT NULL,
	[AnswerLink] [nvarchar](500) NULL,
	[Qtype] [int] NOT NULL,
	[isActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QId] [int] IDENTITY(1,1) NOT NULL,
	[QuestinName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[testSerieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbL_User]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbL_User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Salt] [nvarchar](max) NOT NULL,
	[EmailSalt] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Phone] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestSeries]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestSeries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SeriesName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Org] [int] NULL,
	[Subject] [nvarchar](max) NULL,
	[Time] [int] NULL,
	[UserdId] [int] NULL,
	[totalQ] [int] NULL,
	[QuestionType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttemptQuiz] ON 
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1, 1, CAST(N'2021-04-03T19:34:08.643' AS DateTime), 1, 10, 1)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (2, 1006, CAST(N'2021-04-10T14:43:17.007' AS DateTime), 1, 10, 1)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (3, 1006, CAST(N'2021-04-10T14:43:27.127' AS DateTime), 1, 10, 1)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1002, 1006, CAST(N'2021-04-10T16:38:44.777' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1003, 1006, CAST(N'2021-04-10T19:03:18.283' AS DateTime), 1, 10, 3)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1004, 2, CAST(N'2021-04-17T21:26:15.057' AS DateTime), 1, 10, 1)
GO
SET IDENTITY_INSERT [dbo].[AttemptQuiz] OFF
GO
SET IDENTITY_INSERT [dbo].[MasterQuestionPdf] ON 
GO
INSERT [dbo].[MasterQuestionPdf] ([Id], [qustinonLink], [AnswerLink], [PaperType], [Yeasr], [IsActive], [CreatedDate], [PName], [SMonth]) VALUES (1, N'https://www.sarvgyan.com/articles/ugc-net-exam-pattern', N'https://www.sarvgyan.com/articles/ugc-net-exam-pattern', 5, N'2020', 1, CAST(N'2021-04-18T14:21:30.577' AS DateTime), N'SSC', NULL)
GO
INSERT [dbo].[MasterQuestionPdf] ([Id], [qustinonLink], [AnswerLink], [PaperType], [Yeasr], [IsActive], [CreatedDate], [PName], [SMonth]) VALUES (2, N'https://www.homeworkmarket.com/files/theysayisaywithreadings3e-pdf-4618093', N'https://www.homeworkmarket.com/files/theysayisaywithreadings3e-pdf-4618093', 2, N'2020', 1, CAST(N'2021-04-24T12:43:59.643' AS DateTime), N'Hindi', NULL)
GO
INSERT [dbo].[MasterQuestionPdf] ([Id], [qustinonLink], [AnswerLink], [PaperType], [Yeasr], [IsActive], [CreatedDate], [PName], [SMonth]) VALUES (3, N'https://www.homeworkmarket.com/files/theysayisaywithreadings3e-pdf-4618093', N'https://www.homeworkmarket.com/files/theysayisaywithreadings3e-pdf-4618093', 3, N'2020', 1, CAST(N'2021-04-24T12:44:34.623' AS DateTime), N'Hindi English', NULL)
GO
SET IDENTITY_INSERT [dbo].[MasterQuestionPdf] OFF
GO
SET IDENTITY_INSERT [dbo].[Option] ON 
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (1, N'A1', 1, 1, 1, CAST(N'2021-04-03T19:35:50.830' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2, N'A2', 0, 1, 1, CAST(N'2021-04-03T19:35:50.840' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3, N'A3', 0, 1, 1, CAST(N'2021-04-03T19:35:50.843' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4, N'A4', 0, 1, 1, CAST(N'2021-04-03T19:35:50.843' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (1002, N'A1', 1, 4, 1, CAST(N'2021-04-04T10:01:27.847' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (1003, N'A2', 0, 4, 1, CAST(N'2021-04-04T10:01:27.847' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (1004, N'A3', 0, 4, 1, CAST(N'2021-04-04T10:01:27.847' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (1005, N'A4', 0, 4, 1, CAST(N'2021-04-04T10:01:27.847' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2005, N'I m currently battling with Angular form array.', 0, 1, 1, CAST(N'2021-04-04T15:03:47.107' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2006, N'NITIN SAXENA', 0, 1, 1, CAST(N'2021-04-04T15:03:47.107' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2007, N'Kayastha Shadi', 1, 1, 1, CAST(N'2021-04-04T15:03:47.107' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2008, N'NEHA', 0, 1, 1, CAST(N'2021-04-04T15:03:47.107' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2009, N'I''m currently battling with Angular form array.', 0, 1004, 1, CAST(N'2021-04-04T15:05:11.733' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2010, N'NITIN SAXENA2', 1, 1004, 1, CAST(N'2021-04-04T15:05:11.733' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2011, N'Kayastha Shadi2', 0, 1004, 1, CAST(N'2021-04-04T15:05:11.733' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2012, N'NEHA2', 0, 1004, 1, CAST(N'2021-04-04T15:05:11.733' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2013, N'NITIN SAXENA', 0, 1005, 1, CAST(N'2021-04-04T15:09:56.277' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2014, N'Kayastha Shadi', 0, 1005, 1, CAST(N'2021-04-04T15:09:56.277' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2015, N'I''m currently battling with Angular form array.', 1, 1005, 1, CAST(N'2021-04-04T15:09:56.277' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2016, N'ert', 0, 1005, 1, CAST(N'2021-04-04T15:09:56.277' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2017, N'NITIN SAXENA', 0, 1006, 1, CAST(N'2021-04-04T15:10:19.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2018, N'Kayastha Shadi', 0, 1006, 1, CAST(N'2021-04-04T15:10:19.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2019, N'I''m currently battling with Angular form array.', 1, 1006, 1, CAST(N'2021-04-04T15:10:19.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2020, N'ert', 0, 1006, 1, CAST(N'2021-04-04T15:10:19.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2021, N'NITIN SAXENA', 0, 1007, 1, CAST(N'2021-04-04T15:12:15.597' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2022, N'Kayastha Shadi', 0, 1007, 1, CAST(N'2021-04-04T15:12:15.597' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2023, N'I''m currently battling with Angular form array.', 1, 1007, 1, CAST(N'2021-04-04T15:12:15.597' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2024, N'ert', 0, 1007, 1, CAST(N'2021-04-04T15:12:15.597' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2025, N'NITIN SAXENA', 0, 1008, 1, CAST(N'2021-04-04T15:15:23.667' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2026, N'Kayastha Shadi', 0, 1008, 1, CAST(N'2021-04-04T15:15:23.667' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2027, N'I''m currently battling with Angular form array.', 1, 1008, 1, CAST(N'2021-04-04T15:15:23.667' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2028, N'ert', 0, 1008, 1, CAST(N'2021-04-04T15:15:23.667' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2029, N'ww', 0, 1009, 1, CAST(N'2021-04-04T15:19:19.083' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2030, N'w', 1, 1009, 1, CAST(N'2021-04-04T15:19:19.083' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2031, N'wwww', 0, 1009, 1, CAST(N'2021-04-04T15:19:19.083' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2032, N'wwwwww', 0, 1009, 1, CAST(N'2021-04-04T15:19:19.083' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2033, N'NITIN SAXENA', 0, 1010, 1, CAST(N'2021-04-04T21:40:01.350' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2034, N'Kayastha Shadi', 1, 1010, 1, CAST(N'2021-04-04T21:40:01.350' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2035, N'ert', 0, 1010, 1, CAST(N'2021-04-04T21:40:01.350' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2036, N'NEHA', 0, 1010, 1, CAST(N'2021-04-04T21:40:01.350' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2037, N'A', 0, 1011, 1, CAST(N'2021-04-05T21:18:39.643' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2038, N'A', 1, 1011, 1, CAST(N'2021-04-05T21:18:39.643' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2039, N'A', 0, 1011, 1, CAST(N'2021-04-05T21:18:39.643' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2040, N'NEHA', 0, 1011, 1, CAST(N'2021-04-05T21:18:39.643' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2041, N'NITIN SAXENA', 1, 1012, 1, CAST(N'2021-04-05T21:19:07.037' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2042, N'suman saxena', NULL, 1012, 1, CAST(N'2021-04-05T21:19:07.037' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2043, N'NEHA', NULL, 1012, 1, CAST(N'2021-04-05T21:19:07.037' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2044, N'ert', NULL, 1012, 1, CAST(N'2021-04-05T21:19:07.037' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2045, N'test1', 0, 1013, 1, CAST(N'2021-04-07T08:41:44.553' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2046, N'Kayastha Shadi', 0, 1013, 1, CAST(N'2021-04-07T08:41:44.553' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2047, N'I''m currently battling with Angular form array.', 1, 1013, 1, CAST(N'2021-04-07T08:41:44.553' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2048, N'ert', 0, 1013, 1, CAST(N'2021-04-07T08:41:44.553' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2049, N'NITIN SAXENA', NULL, 1014, 1, CAST(N'2021-04-07T08:42:07.347' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2050, N'Kayastha Shadi', NULL, 1014, 1, CAST(N'2021-04-07T08:42:07.347' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2051, N'e', NULL, 1014, 1, CAST(N'2021-04-07T08:42:07.347' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2052, N'dfrt', 1, 1014, 1, CAST(N'2021-04-07T08:42:07.347' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2053, N'NITIN SAXENA', 0, 1015, 1, CAST(N'2021-04-10T11:46:12.440' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2054, N'NEHA', 0, 1015, 1, CAST(N'2021-04-10T11:46:12.440' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2055, N'I''m currently battling with Angular form array.', 1, 1015, 1, CAST(N'2021-04-10T11:46:12.440' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2056, N'suman saxena', 0, 1015, 1, CAST(N'2021-04-10T11:46:12.440' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3053, N'NEHA', 0, 2016, 1, CAST(N'2021-04-10T14:37:55.047' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3054, N'NEHA', 0, 2015, 1, CAST(N'2021-04-10T14:37:55.053' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3055, N'NITIN SAXENA', 1, 2015, 1, CAST(N'2021-04-10T14:37:55.053' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3056, N'I''m currently battling with Angular form array.', 0, 2015, 1, CAST(N'2021-04-10T14:37:55.053' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3057, N'suman saxena', 0, 2015, 1, CAST(N'2021-04-10T14:37:55.053' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3058, N'NITIN SAXENA', 1, 2016, 1, CAST(N'2021-04-10T14:37:55.047' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3059, N'I''m currently battling with Angular form array.', 0, 2016, 1, CAST(N'2021-04-10T14:37:55.047' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3060, N'suman saxena', 0, 2016, 1, CAST(N'2021-04-10T14:37:55.047' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4053, N'ASDD', 0, 3015, 1, CAST(N'2021-04-10T19:10:52.960' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4054, N'ertdfg', 1, 3015, 1, CAST(N'2021-04-10T19:10:52.960' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4055, N'ertyu', 0, 3015, 1, CAST(N'2021-04-10T19:10:52.960' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4056, N'ertfgh', 0, 3015, 1, CAST(N'2021-04-10T19:10:52.960' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4057, N'NITIN SAXENA', NULL, 3016, 1, CAST(N'2021-04-10T19:11:15.307' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4058, N'suman saxena', 1, 3016, 1, CAST(N'2021-04-10T19:11:15.307' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4059, N'we', NULL, 3016, 1, CAST(N'2021-04-10T19:11:15.307' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4060, N'I''m currently battling with Angular form array.', NULL, 3016, 1, CAST(N'2021-04-10T19:11:15.307' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4061, N'NEHA', 0, 3017, 1, CAST(N'2021-04-24T12:39:09.890' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4062, N'ert', 1, 3017, 1, CAST(N'2021-04-24T12:39:09.890' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4063, N'nfjfjhfjk', 0, 3017, 1, CAST(N'2021-04-24T12:39:09.890' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4064, N'fjhghjf', 0, 3017, 1, CAST(N'2021-04-24T12:39:09.890' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Option] OFF
GO
SET IDENTITY_INSERT [dbo].[PaperType] ON 
GO
INSERT [dbo].[PaperType] ([Id], [SubjectText], [isActive]) VALUES (1, N'First Paper 1', 1)
GO
INSERT [dbo].[PaperType] ([Id], [SubjectText], [isActive]) VALUES (2, N'Hindi', 1)
GO
INSERT [dbo].[PaperType] ([Id], [SubjectText], [isActive]) VALUES (3, N'English', 1)
GO
INSERT [dbo].[PaperType] ([Id], [SubjectText], [isActive]) VALUES (4, N'Physcics', 1)
GO
INSERT [dbo].[PaperType] ([Id], [SubjectText], [isActive]) VALUES (5, N'SSC CL', 1)
GO
SET IDENTITY_INSERT [dbo].[PaperType] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1, N'A', 1, CAST(N'2021-04-03T19:32:44.970' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (2, N'A1', 1, CAST(N'2021-04-03T19:32:45.163' AS DateTime), 2)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (3, N'A2', 1, CAST(N'2021-04-03T19:32:45.167' AS DateTime), 3)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (4, N'A3', 1, CAST(N'2021-04-03T19:32:45.167' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (5, N'A4', 1, CAST(N'2021-04-03T19:32:45.167' AS DateTime), 2)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1002, N'I''m currently battling with Angular form array.', 1, CAST(N'2021-04-04T14:36:45.490' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1003, N'I''m currently battling with Angular form array.', 1, CAST(N'2021-04-04T14:56:44.410' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1004, N'I''m currently battling with Angular form array.', 1, CAST(N'2021-04-04T15:05:11.730' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1005, N'well, I feel more confortable usign directity the contructor of formControl and formGroup', 1, CAST(N'2021-04-04T15:09:56.130' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1006, N'well, I feel more confortable usign directity the contructor of formControl and formGroup', 1, CAST(N'2021-04-04T15:10:19.653' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1007, N'well, I feel more confortable usign directity the contructor of formControl and formGroup', 1, CAST(N'2021-04-04T15:11:59.720' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1008, N'well, I feel more confortable usign directity the contructor of formControl and formGroup', 1, CAST(N'2021-04-04T15:15:23.630' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1009, N'rte', 1, CAST(N'2021-04-04T15:19:18.480' AS DateTime), 1)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1010, N'first Questtion', 1, CAST(N'2021-04-04T21:40:01.143' AS DateTime), 1005)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1011, N'A11', 1, CAST(N'2021-04-05T21:18:39.590' AS DateTime), 1006)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1012, N'A11', 1, CAST(N'2021-04-05T21:19:06.980' AS DateTime), 1006)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1013, N'test', 1, CAST(N'2021-04-07T08:41:43.997' AS DateTime), 1004)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1014, N'Test 2', 1, CAST(N'2021-04-07T08:42:07.330' AS DateTime), 1004)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (1015, N'Tet344', 1, CAST(N'2021-04-10T11:46:10.933' AS DateTime), 1006)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (2015, N'test45', 1, CAST(N'2021-04-10T14:37:54.977' AS DateTime), 1006)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (2016, N'test45', 1, CAST(N'2021-04-10T14:37:54.977' AS DateTime), 1006)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (3015, N'The National Eligibility Test, also known as UGC NET or NTA-UGC-NET, is the examination for determining', 1, CAST(N'2021-04-10T19:10:52.950' AS DateTime), 1006)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (3016, N'test4', 1, CAST(N'2021-04-10T19:11:15.303' AS DateTime), 1006)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (3017, N'hinfidi d   d  duhd d hdjh  jd d   dhjh d', 1, CAST(N'2021-04-24T12:39:09.873' AS DateTime), 1006)
GO
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionType] ON 
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate]) VALUES (1, N'UGC NET', 1, CAST(N'2021-04-07T08:01:23.940' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
GO
SET IDENTITY_INSERT [dbo].[TbL_User] ON 
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone]) VALUES (1, N'nitin', N'nitin', N'nitinsaxenahapur@gmail.com', N'5P0lKecWmzc+8qMnEngw8Q==', N'a30B9swlu6aq+iiJWnOohw==', N'yyGbHySVlt6vCj8kRw5BVg==', 1, 1, CAST(N'2021-04-03T19:28:37.537' AS DateTime), CAST(N'2021-04-03T19:28:37.537' AS DateTime), 0)
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone]) VALUES (2, N'testw', N'testw', N'infoindia78@gmail.com', N'vBrBoLNFqSok5wXZDdFhwA==', N'i+U9N0UXkLAJNDqR2jAd0g==', N'i+U9N0UXkLAJNDqR2jAd0g==', 1, 1, CAST(N'2021-04-10T16:37:42.873' AS DateTime), CAST(N'2021-04-10T16:37:42.873' AS DateTime), 0)
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone]) VALUES (3, N'Neha', N'Neha', N'neha@gmail.com', N'DNaJc908Nt+pNbwlL5bBRQ==', N'71Yf8Jyo9Enmi/55zME41A==', N'71Yf8Jyo9Enmi/55zME41A==', 1, 1, CAST(N'2021-04-10T19:01:38.573' AS DateTime), CAST(N'2021-04-10T19:01:38.573' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[TbL_User] OFF
GO
SET IDENTITY_INSERT [dbo].[TestSeries] ON 
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1, N'A', 1, CAST(N'2021-04-03T19:27:33.947' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (2, N'A1', 1, CAST(N'2021-04-03T19:27:34.247' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (3, N'A2', 1, CAST(N'2021-04-03T19:27:34.270' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (4, N'A3', 1, CAST(N'2021-04-03T19:27:34.273' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (5, N'A4', 1, CAST(N'2021-04-03T19:27:34.273' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1002, N'Test AB', 0, CAST(N'2021-04-04T20:58:18.800' AS DateTime), 1, N'UGC NET ', 30, 1, NULL, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1003, N'Test ABe', 0, CAST(N'2021-04-04T20:58:25.113' AS DateTime), 1, N'UGC NET ', 30, 1, NULL, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1004, N'Test3', 1, CAST(N'2021-04-04T21:06:23.103' AS DateTime), 1, N'Des', 23, 1, 2, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1005, N'Test33', 1, CAST(N'2021-04-04T21:07:22.407' AS DateTime), 1, N'Des', 23, 1, 1, NULL)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1006, N'UGC Net English', 1, CAST(N'2021-04-05T21:16:11.617' AS DateTime), 1, N'English', 45, 1, 8, NULL)
GO
SET IDENTITY_INSERT [dbo].[TestSeries] OFF
GO
/****** Object:  StoredProcedure [dbo].[get_Question_list]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_Question_list]
(
@PaperType int 
)
as
BEGIN

select id,qustinonLink,AnswerLink,Yeasr,PName,isActive from MasterQuestionPdf where PaperType=@paperType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getDashBardDetails]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getDashBardDetails]
(
@userid int 
)
as
BEGIN
Declare @totalLeft int ,@Attempt int 
select @Attempt=count(t.Id)  from TestSeries t
left join AttemptQuiz a on t.Id=a.TestSeriesId
where a.userid=@userid


select @totalLeft  = count(t.Id)  from TestSeries  t
left join AttemptQuiz a on t.Id=a.TestSeriesId
where t.Id not in (select TestSeriesId from  AttemptQuiz where Userid=@userid)


select @totalLeft as TotalLeft,@Attempt as Attempt
END


GO
/****** Object:  StoredProcedure [dbo].[sp_getPaperSeries]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- exec  [sp_getLatestJoined] 1, 'gh'
CREATE proc [dbo].[sp_getPaperSeries]
(
@UserId int ,
@skipValue int ,
@GetValue int,
@statusType int
)
as

BEGIn
select t.Id,t.PName as Name ,t.qustinonLink as qustinonLink,
t.Yeasr ,t.IsActive as isActive,pt.SubjectText
from MasterQuestionPdf t
left join PaperType pt on t.PaperType=pt.Id
order by t.Id desc

END






GO
/****** Object:  StoredProcedure [dbo].[sp_getPaperTypeList]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getPaperTypeList]
(@UserId int 
)
as
BEGIN
select Id as KEYId,SubjectText as Text from PaperType
ENd
GO
/****** Object:  StoredProcedure [dbo].[sp_getQuestionTypeList]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_getQuestionTypeList]
(@UserId int 
)
as
BEGIN
select Id as KEYId,Value as Text from QuestionType
ENd
GO
/****** Object:  StoredProcedure [dbo].[sp_getTestSeries]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- exec  [sp_getLatestJoined] 1, 'gh'
CREATE proc [dbo].[sp_getTestSeries]
(
@UserId int ,
@skipValue int ,
@GetValue int,
@statusType int
)
as
BEGIN 
if(@statusType=2)
BEGIn
select t.Id,SeriesName as Name ,'' as Subject,isnull(totalQ,0) as NoOfQustion,isnull(t.time,50) as Time,isActive as isActive, 1 as status
,0 as scored from TestSeries t
left join AttemptQuiz a on t.Id=a.TestSeriesId
where a.userid=@UserId and t.IsActive=1

END
if(@statusType=3)
BEGIn
select t.Id,SeriesName as Name ,'' as Subject,isnull(totalQ,0) as NoOfQustion,isnull(time,50) as Time,isActive as isActive,3 as status
,0 as scored from TestSeries t
order by t.Id desc

END
ELSE

BEGiN
select t.Id,SeriesName as Name ,'' as Subject,isnull(totalQ,0) as NoOfQustion,isnull(t.time,50) as Time,isActive as isActive,2 as status
,0 as scored from TestSeries  t
left join AttemptQuiz a on t.Id=a.TestSeriesId
where t.Id not in (select TestSeriesId from  AttemptQuiz where Userid=@UserId) and  t.IsActive=1
END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_getTestSeriesById]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- exec  [sp_getLatestJoined] 1, 'gh'
CREATE proc [dbo].[sp_getTestSeriesById]
(
@UserId int ,
@skipValue int ,
@GetValue int,
@testId int
)
as
BEGIN 
select ts.SeriesName,q.QuestinName ,q.qId as Id,isnull(ts.Time,50) as Time,
(select id,Name,isAnswer,QuestionId from [Option] where QuestionId=q.Qid FOR JSON AUTO) as Options
from TestSeries ts
left join Question q on q.testSerieId=ts.Id
where ts.id=@testId
if not exists(select top 1 * from AttemptQuiz where UserId=@UserId and TestSeriesId=@testId)
BEGIN
insert into AttemptQuiz(TestSeriesId,AttemtDate,isCompleted,Scored,UserId) values(@testId,getDAte(),1,10,@UserId)
END
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PaperSeries]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaperSeries]  
(  
@Paper nvarchar(300),  
@time nvarchar(max),  
@Userid int null,  
@description nvarchar(max),  
@questionUrl nvarchar(max),  
@answerurl nvarchar(max),  
@paperType int null,  
@status INT OUTPUT  
  
)  
 
as   
BEGIN  
  
insert into MasterQuestionPdf(qustinonLink	,AnswerLink	,PaperType	,Yeasr	,IsActive,	CreatedDate,	PName,	SMonth) values(@questionUrl,@answerurl,@paperType,@time,1,GETDATE(),@Paper,null)  
select @status=1  
return ;  

END  
  
  
  
  
  
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_publish]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_publish]
(

@testId int null,

@status INT OUTPUT

)

as 
BEGIN
update TestSeries
set IsActive=1
where id=@testId
select @status=1

END









GO
/****** Object:  StoredProcedure [dbo].[sp_Question]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Question]
(
@Quetion nvarchar(500),
@Option nvarchar(max),
@userid int,
@testSeriesid int,

@QuestionNo INT OUTPUT

)
as 
BEGIN
Declare @QuestionId int 

insert into Question (QuestinName,IsActive,CreatedDate,testSerieid) values(@Quetion,1,GETDATE(),@testSeriesid)
set @QuestionId=@@Identity
select @QuestionNo=count(Qid) from Question where testSerieId=@testSeriesid
update TestSeries
set totalQ=@QuestionNo
where id=@testSeriesid
insert into [Option](Name,isAnswer,QuestionId,IsActive,CreatedDate)
select  [option],answer,@QuestionId,1,getDate() from 
OPENJSON(@Option, '$.arr')  
With([option] varchar(100),answer bit)


--select @QuestionNo
END








GO
/****** Object:  StoredProcedure [dbo].[sp_saveUser]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_saveUser]
(
@FirstName nvarchar(300),
@Phone bigint null,
@Email nvarchar(max),
@Password nvarchar(max),
@PassWordSalt nvarchar(max),

@status INT OUTPUT

)
as 
BEGIN
Declare @profileId nvarchar(max)
if exists(select top 1 * from TbL_User where UserName=@Email)
BEGIN
select @status=1
return ;
END
ELSE
BEGIN
 set @profileId= 'QT' + REPLACE(STR(isnull((select top 1 UserId from  TbL_User order by UserId desc ),1),5),' ', '0') 
insert into TbL_User values(@FirstName,@FirstName,LOWER(@Email),@Password,@PassWordSalt,@PassWordSalt,1,1,getdate(),GETdATE(),@Phone)
select @status=2
return ;
END

END








GO
/****** Object:  StoredProcedure [dbo].[sp_testSeries]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_testSeries]
(
@testSeries nvarchar(300),
@time int null,
@Userid int null,
@description nvarchar(max),
@status INT OUTPUT

)

as 
BEGIN

if exists(select top 1 * from TestSeries where SeriesName=@testSeries)
BEGIN
select @status=2
return ;
END
ELSE
BEGIN

insert into TestSeries values(@testSeries,0,GETDATE(),1,@description,@time,@Userid,0)
select @status=1
return ;
END

END









GO
/****** Object:  StoredProcedure [dbo].[sp_updatePassword]    Script Date: 08-05-2021 12:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_updatePassword]
(

@Password nvarchar(max),
@PassWordSalt nvarchar(max),
@Userid int,
@status INT OUTPUT

)
as 
BEGIN

if exists(select top 1 * from TbL_User where Userid=@UserId)
BEGIN
select @status=1
update TbL_User
set Password=@Password,
Salt=@PassWordSalt
where userId=@Userid

END
ELSE
BEGIN 
select @status=2
END
END






GO
USE [master]
GO
ALTER DATABASE [OnlineQuiz] SET  READ_WRITE 
GO
