USE [master]
GO
/****** Object:  Database [OnlineQuiz]    Script Date: 19-08-2022 18:33:29 ******/
CREATE DATABASE [OnlineQuiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineQuiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\OnlineQuiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineQuiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\OnlineQuiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[AttemptQuiz]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  Table [dbo].[config]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  Table [dbo].[Demo]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JSONValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeedBack] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[Createdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterQuestionPdf]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] NULL,
	[Menu] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  Table [dbo].[PaperType]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  Table [dbo].[PdfSeries]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](550) NULL,
	[ImageUrl] [nvarchar](300) NULL,
	[Price] [decimal](18, 2) NULL,
	[isActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Quantity] [int] NULL,
	[Category] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[isActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
	[ModifyBy] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[isDefault] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 19-08-2022 18:33:30 ******/
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
	[sorting] [int] NULL,
	[youtube] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[QId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[subjectCat] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NULL,
	[RoleName] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMenuPermissin]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMenuPermissin](
	[Id] [int] NULL,
	[Menu] [nvarchar](200) NULL,
	[RoleId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbL_User]    Script Date: 19-08-2022 18:33:30 ******/
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
	[roleId] [int] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestSeries]    Script Date: 19-08-2022 18:33:30 ******/
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
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1005, 1004, CAST(N'2021-12-11T17:57:29.967' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1006, 1, CAST(N'2021-12-11T19:24:34.233' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1007, 1005, CAST(N'2021-12-11T19:27:10.413' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1008, 2, CAST(N'2021-12-11T19:37:52.387' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1009, 3, CAST(N'2021-12-12T08:38:03.960' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1010, 4, CAST(N'2021-12-12T09:12:29.950' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1011, 1009, CAST(N'2021-12-12T10:51:44.260' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1012, 1010, CAST(N'2021-12-12T10:51:55.207' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1013, 1011, CAST(N'2021-12-12T10:52:09.540' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1014, 5, CAST(N'2021-12-18T17:51:29.257' AS DateTime), 1, 10, 2)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1015, 1006, CAST(N'2022-01-22T09:26:57.933' AS DateTime), 1, 10, 0)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1016, 3, CAST(N'2022-01-22T09:31:22.663' AS DateTime), 1, 10, 0)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1017, 1, CAST(N'2022-01-22T09:31:53.400' AS DateTime), 1, 10, 0)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1018, 2, CAST(N'2022-01-22T09:31:59.360' AS DateTime), 1, 10, 0)
GO
INSERT [dbo].[AttemptQuiz] ([id], [TestSeriesId], [AttemtDate], [isCompleted], [Scored], [Userid]) VALUES (1019, 5, CAST(N'2022-01-22T09:32:04.020' AS DateTime), 1, 10, 0)
GO
SET IDENTITY_INSERT [dbo].[AttemptQuiz] OFF
GO
SET IDENTITY_INSERT [dbo].[Demo] ON 
GO
INSERT [dbo].[Demo] ([Id], [JSONValue]) VALUES (1, N'{"id":1,"Name":"test123","isAnswer":true,"QuestionId":1}')
GO
INSERT [dbo].[Demo] ([Id], [JSONValue]) VALUES (2, N'{"id":1,"Name":"TEST1","isAnswer":true,"QuestionId":1}')
GO
INSERT [dbo].[Demo] ([Id], [JSONValue]) VALUES (3, N'{"id":2,"Name":"Final Data","isAnswer":true,"QuestionId":1}')
GO
SET IDENTITY_INSERT [dbo].[Demo] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 
GO
INSERT [dbo].[feedback] ([Id], [FeedBack], [UserId], [Createdate]) VALUES (1, N'gfghfghfgh ggfg', 2, CAST(N'2021-12-11T19:12:05.177' AS DateTime))
GO
INSERT [dbo].[feedback] ([Id], [FeedBack], [UserId], [Createdate]) VALUES (2, N'tets', 2, CAST(N'2022-07-24T11:24:50.270' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[feedback] OFF
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
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (1, N'माँ', 1, 1, 1, CAST(N'2021-12-18T19:01:51.413' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (2, N'बहन', 0, 1, 1, CAST(N'2021-12-18T19:01:51.413' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (3, N'पुत्री', 0, 1, 1, CAST(N'2021-12-18T19:01:51.413' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4, N'दादी', 0, 1, 1, CAST(N'2021-12-18T19:01:51.413' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (5, N'E,C का भाई है', NULL, 2, 1, CAST(N'2021-12-18T19:03:17.490' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (6, N'E,C का पिता है', 1, 2, 1, CAST(N'2021-12-18T19:03:17.490' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (7, N'E,C का पुत्र है', NULL, 2, 1, CAST(N'2021-12-18T19:03:17.490' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (8, N'E,C की बहन है', NULL, 2, 1, CAST(N'2021-12-18T19:03:17.490' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (9, N'बेटा', NULL, 3, 1, CAST(N'2021-12-18T19:04:25.853' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (10, N'दादा', 1, 3, 1, CAST(N'2021-12-18T19:04:25.853' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (11, N'भतीजा', NULL, 3, 1, CAST(N'2021-12-18T19:04:25.853' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (12, N'दामाद', NULL, 3, 1, CAST(N'2021-12-18T19:04:25.853' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (13, N'उसके पिता का', 0, 4, 1, CAST(N'2021-12-18T19:08:36.800' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (14, N'स्वंय उसी का', 0, 4, 1, CAST(N'2021-12-18T19:08:36.800' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (15, N'उसके दादा का', 1, 4, 1, CAST(N'2021-12-18T19:08:36.800' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (16, N'इनमें से कोई नहीं', 0, 4, 1, CAST(N'2021-12-18T19:08:36.800' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (17, N'Oxygen', 0, 5, 1, CAST(N'2022-01-16T15:14:53.757' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (18, N'Hydrogen sulphide', 0, 5, 1, CAST(N'2022-01-16T15:14:53.757' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (19, N'Carbon dioxide', 0, 5, 1, CAST(N'2022-01-16T15:14:53.757' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (20, N'Nitrogen', 0, 5, 1, CAST(N'2022-01-16T15:14:53.757' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (21, N'Oxygen', 0, 6, 1, CAST(N'2022-01-16T15:17:07.787' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (22, N'Hydrogen sulphide', 1, 6, 1, CAST(N'2022-01-16T15:17:07.787' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (23, N'Carbon dioxide', 0, 6, 1, CAST(N'2022-01-16T15:17:07.787' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (24, N'Nitrogen', 0, 6, 1, CAST(N'2022-01-16T15:17:07.787' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (25, N'Phosphorous', NULL, 7, 1, CAST(N'2022-01-16T15:18:05.850' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (26, N'Bromine', 1, 7, 1, CAST(N'2022-01-16T15:18:05.850' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (27, N'Chlorine', NULL, 7, 1, CAST(N'2022-01-16T15:18:05.850' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (28, N'Helium', NULL, 7, 1, CAST(N'2022-01-16T15:18:05.850' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (29, N'Tin', NULL, 8, 1, CAST(N'2022-01-16T15:18:59.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (30, N'Mercury', 1, 8, 1, CAST(N'2022-01-16T15:18:59.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (31, N'Lead', NULL, 8, 1, CAST(N'2022-01-16T15:18:59.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (32, N'Zinc', NULL, 8, 1, CAST(N'2022-01-16T15:18:59.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (33, N'NaAlO2', 0, 9, 1, CAST(N'2022-01-16T15:33:26.793' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (34, N'H2O', 1, 9, 1, CAST(N'2022-01-16T15:33:26.793' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (35, N'Al2O3', 0, 9, 1, CAST(N'2022-01-16T15:33:26.793' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (36, N'CaSiO3', 0, 9, 1, CAST(N'2022-01-16T15:33:26.793' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (37, N'nitrogen', 1, 10, 1, CAST(N'2022-01-16T15:34:50.683' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (38, N'hydrogen', NULL, 10, 1, CAST(N'2022-01-16T15:34:50.683' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (39, N'carbon dioxide', NULL, 10, 1, CAST(N'2022-01-16T15:34:50.683' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (40, N'oxygen', NULL, 10, 1, CAST(N'2022-01-16T15:34:50.683' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (41, N'Methane', NULL, 11, 1, CAST(N'2022-01-16T15:36:13.750' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (42, N'Nitrous oxide', NULL, 11, 1, CAST(N'2022-01-16T15:36:13.750' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (43, N'Carbon dioxide', NULL, 11, 1, CAST(N'2022-01-16T15:36:13.750' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (44, N'Hydrogen', 1, 11, 1, CAST(N'2022-01-16T15:36:13.750' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (45, N'Sodium carbonate', 1, 12, 1, CAST(N'2022-01-16T15:37:39.813' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (46, N'Calcium bicarbonate', NULL, 12, 1, CAST(N'2022-01-16T15:37:39.813' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (47, N'Sodium bicarbonate', NULL, 12, 1, CAST(N'2022-01-16T15:37:39.813' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (48, N'Calcium carbonate', NULL, 12, 1, CAST(N'2022-01-16T15:37:39.813' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (49, N'black solid', NULL, 13, 1, CAST(N'2022-01-16T15:39:10.223' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (50, N'red liquid', 1, 13, 1, CAST(N'2022-01-16T15:39:10.223' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (51, N'colourless gas', NULL, 13, 1, CAST(N'2022-01-16T15:39:10.223' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (52, N'highly inflammable gas', NULL, 13, 1, CAST(N'2022-01-16T15:39:10.223' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (53, N'pain killer', NULL, 14, 1, CAST(N'2022-01-16T15:40:21.243' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (54, N'fire extinguisher', NULL, 14, 1, CAST(N'2022-01-16T15:40:21.243' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (55, N'mosquito repellent', NULL, 14, 1, CAST(N'2022-01-16T15:40:21.243' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (56, N'petrol additive', 1, 14, 1, CAST(N'2022-01-16T15:40:21.243' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (57, N'Graphite', 1, 15, 1, CAST(N'2022-01-16T15:41:46.420' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (58, N'Silica', NULL, 15, 1, CAST(N'2022-01-16T15:41:46.420' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (59, N'Iron Oxide', NULL, 15, 1, CAST(N'2022-01-16T15:41:46.420' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (60, N'Diamond', NULL, 15, 1, CAST(N'2022-01-16T15:41:46.420' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (61, N'oxygen and hydrogen', NULL, 16, 1, CAST(N'2022-01-16T15:43:06.870' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (62, N'oxygen, hydrogen, acetylene and nitrogen', NULL, 16, 1, CAST(N'2022-01-16T15:43:06.870' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (63, N'oxygen, acetylene and argon', NULL, 16, 1, CAST(N'2022-01-16T15:43:06.870' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (64, N'oxygen and acetylene', 1, 16, 1, CAST(N'2022-01-16T15:43:06.870' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (65, N'osmosis', NULL, 17, 1, CAST(N'2022-01-16T15:44:28.017' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (66, N'deliquescence', 1, 17, 1, CAST(N'2022-01-16T15:44:28.017' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (67, N'efflorescence', NULL, 17, 1, CAST(N'2022-01-16T15:44:28.017' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (68, N'desiccation', NULL, 17, 1, CAST(N'2022-01-16T15:44:28.017' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (69, N'3%', NULL, 18, 1, CAST(N'2022-01-16T15:46:00.367' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (70, N'3.5%', 1, 18, 1, CAST(N'2022-01-16T15:46:00.367' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (71, N'2.5%', NULL, 18, 1, CAST(N'2022-01-16T15:46:00.367' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (72, N'2%', NULL, 18, 1, CAST(N'2022-01-16T15:46:00.367' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (73, N'without any change in the weight of the nail', NULL, 19, 1, CAST(N'2022-01-16T15:47:18.180' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (74, N'with decrease in the weight of the nail', NULL, 19, 1, CAST(N'2022-01-16T15:47:18.180' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (75, N'with increase in the weight of the nail', 1, 19, 1, CAST(N'2022-01-16T15:47:18.180' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (76, N'without any change in colour or weight of the nail', NULL, 19, 1, CAST(N'2022-01-16T15:47:18.180' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (77, N'lead', NULL, 20, 1, CAST(N'2022-01-16T15:48:21.363' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (78, N'chromium', NULL, 20, 1, CAST(N'2022-01-16T15:48:21.363' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (79, N'zinc', 1, 20, 1, CAST(N'2022-01-16T15:48:21.363' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (80, N'tin', NULL, 20, 1, CAST(N'2022-01-16T15:48:21.363' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (81, N'transition metals', 1, 21, 1, CAST(N'2022-01-16T15:50:05.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (82, N'main group metals', NULL, 21, 1, CAST(N'2022-01-16T15:50:05.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (83, N'alkali metals', NULL, 21, 1, CAST(N'2022-01-16T15:50:05.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (84, N'rare metals', NULL, 21, 1, CAST(N'2022-01-16T15:50:05.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (85, N'deuterium oxide', 1, 22, 1, CAST(N'2022-01-16T15:51:09.110' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (86, N'PH7', NULL, 22, 1, CAST(N'2022-01-16T15:51:09.110' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (87, N'rain water', NULL, 22, 1, CAST(N'2022-01-16T15:51:09.110' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (88, N'tritium oxide', NULL, 22, 1, CAST(N'2022-01-16T15:51:09.110' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (89, N'hydrogen', 1, 23, 1, CAST(N'2022-01-16T15:52:19.577' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (90, N'carbon', NULL, 23, 1, CAST(N'2022-01-16T15:52:19.577' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (91, N'sulphur', NULL, 23, 1, CAST(N'2022-01-16T15:52:19.577' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (92, N'oxygen', NULL, 23, 1, CAST(N'2022-01-16T15:52:19.577' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (93, N'titanium', NULL, 24, 1, CAST(N'2022-01-16T15:53:26.040' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (94, N'zirconium', NULL, 24, 1, CAST(N'2022-01-16T15:53:26.040' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (95, N'iron', NULL, 24, 1, CAST(N'2022-01-16T15:53:26.040' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (96, N'thorium', 1, 24, 1, CAST(N'2022-01-16T15:53:26.040' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (97, N'allotropes', 1, 25, 1, CAST(N'2022-01-16T15:54:32.577' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (98, N'isomers', NULL, 25, 1, CAST(N'2022-01-16T15:54:32.577' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (99, N'isomorphs', NULL, 25, 1, CAST(N'2022-01-16T15:54:32.577' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (100, N'isotopes', NULL, 25, 1, CAST(N'2022-01-16T15:54:32.577' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (101, N'sodium carbonate', 1, 26, 1, CAST(N'2022-01-16T15:55:51.140' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (102, N'alum', NULL, 26, 1, CAST(N'2022-01-16T15:55:51.140' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (103, N'potassium permanganate', NULL, 26, 1, CAST(N'2022-01-16T15:55:51.140' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (104, N'lime', NULL, 26, 1, CAST(N'2022-01-16T15:55:51.140' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (105, N'carbonic acid', NULL, 27, 1, CAST(N'2022-01-16T15:57:26.663' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (106, N'sulphuric acid', NULL, 27, 1, CAST(N'2022-01-16T15:57:26.663' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (107, N'carbon dioxide', 1, 27, 1, CAST(N'2022-01-16T15:57:26.663' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (108, N'nitrous acid', NULL, 27, 1, CAST(N'2022-01-16T15:57:26.663' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (109, N'galena', NULL, 28, 1, CAST(N'2022-01-16T15:58:29.663' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (110, N'calamine', NULL, 28, 1, CAST(N'2022-01-16T15:58:29.663' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (111, N'calcite', NULL, 28, 1, CAST(N'2022-01-16T15:58:29.663' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (112, N'bauxite', 1, 28, 1, CAST(N'2022-01-16T15:58:29.663' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (113, N'camphor', NULL, 29, 1, CAST(N'2022-01-16T15:59:41.097' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (114, N'sulphur', NULL, 29, 1, CAST(N'2022-01-16T15:59:41.097' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (115, N'common salt', NULL, 29, 1, CAST(N'2022-01-16T15:59:41.097' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (116, N'sugar', 1, 29, 1, CAST(N'2022-01-16T15:59:41.097' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (117, N'Lithium', NULL, 30, 1, CAST(N'2022-01-16T16:00:50.430' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (118, N'Sodium', NULL, 30, 1, CAST(N'2022-01-16T16:00:50.430' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (119, N'Francium', 1, 30, 1, CAST(N'2022-01-16T16:00:50.430' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (120, N'Cerium', NULL, 30, 1, CAST(N'2022-01-16T16:00:50.430' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (125, N'Phosphorous', 0, 32, 1, CAST(N'2022-01-16T16:12:28.313' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (126, N'Bromine', 1, 32, 1, CAST(N'2022-01-16T16:12:28.313' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (127, N'Chlorine', 0, 32, 1, CAST(N'2022-01-16T16:12:28.313' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (128, N'Helium', 0, 32, 1, CAST(N'2022-01-16T16:12:28.313' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (129, N'copper', NULL, 33, 1, CAST(N'2022-01-16T16:13:39.800' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (130, N'magnesium', 1, 33, 1, CAST(N'2022-01-16T16:13:39.800' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (131, N'iron', NULL, 33, 1, CAST(N'2022-01-16T16:13:39.800' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (132, N'calcium', NULL, 33, 1, CAST(N'2022-01-16T16:13:39.800' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (133, N'Graphite', 1, 34, 1, CAST(N'2022-01-16T16:14:56.777' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (134, N'Silicon', NULL, 34, 1, CAST(N'2022-01-16T16:14:56.777' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (135, N'Charcoal', NULL, 34, 1, CAST(N'2022-01-16T16:14:56.777' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (136, N'Phosphorous', NULL, 34, 1, CAST(N'2022-01-16T16:14:56.777' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (137, N'Nitrous Oxide', 1, 35, 1, CAST(N'2022-01-16T16:16:53.320' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (138, N'Carbon monoxide', NULL, 35, 1, CAST(N'2022-01-16T16:16:53.320' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (139, N'Sulphur dioxide', NULL, 35, 1, CAST(N'2022-01-16T16:16:53.320' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (140, N'Hydrogen peroxide', NULL, 35, 1, CAST(N'2022-01-16T16:16:53.320' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (141, N'97 to 104', NULL, 36, 1, CAST(N'2022-01-16T16:17:58.890' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (142, N'101 to 115', NULL, 36, 1, CAST(N'2022-01-16T16:17:58.890' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (143, N'89 to 103', 1, 36, 1, CAST(N'2022-01-16T16:17:58.890' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (144, N'36 from 43', NULL, 36, 1, CAST(N'2022-01-16T16:17:58.890' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (145, N'tungsten', 1, 37, 1, CAST(N'2022-01-16T16:19:02.820' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (146, N'nichrome', NULL, 37, 1, CAST(N'2022-01-16T16:19:02.820' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (147, N'graphite', NULL, 37, 1, CAST(N'2022-01-16T16:19:02.820' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (148, N'iron', NULL, 37, 1, CAST(N'2022-01-16T16:19:02.820' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (149, N'germanium', NULL, 38, 1, CAST(N'2022-01-16T16:20:02.550' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (150, N'carbon', 1, 38, 1, CAST(N'2022-01-16T16:20:02.550' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (151, N'silicon', NULL, 38, 1, CAST(N'2022-01-16T16:20:02.550' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (152, N'sulphur', NULL, 38, 1, CAST(N'2022-01-16T16:20:02.550' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (153, N'sodium', NULL, 39, 1, CAST(N'2022-01-16T16:21:05.000' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (154, N'barium', 1, 39, 1, CAST(N'2022-01-16T16:21:05.000' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (155, N'mercury', NULL, 39, 1, CAST(N'2022-01-16T16:21:05.000' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (156, N'potassium', NULL, 39, 1, CAST(N'2022-01-16T16:21:05.000' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (157, N'nitrogen', NULL, 40, 1, CAST(N'2022-01-16T16:22:08.723' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (158, N'ethane', NULL, 40, 1, CAST(N'2022-01-16T16:22:08.723' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (159, N'methane', 1, 40, 1, CAST(N'2022-01-16T16:22:08.723' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (160, N'hydrogen', NULL, 40, 1, CAST(N'2022-01-16T16:22:08.723' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (161, N'methane, ethane and hexane', NULL, 41, 1, CAST(N'2022-01-16T16:23:12.563' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (162, N'ethane, hexane and nonane', NULL, 41, 1, CAST(N'2022-01-16T16:23:12.563' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (163, N'methane, hexane and nonane', NULL, 41, 1, CAST(N'2022-01-16T16:23:12.563' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (164, N'methane, butane and propane', 1, 41, 1, CAST(N'2022-01-16T16:23:12.563' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (165, N'compound', NULL, 42, 1, CAST(N'2022-01-16T16:24:15.467' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (166, N'element', NULL, 42, 1, CAST(N'2022-01-16T16:24:15.467' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (167, N'electrolyte', NULL, 42, 1, CAST(N'2022-01-16T16:24:15.467' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (168, N'mixture', 1, 42, 1, CAST(N'2022-01-16T16:24:15.467' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (169, N'nitrogen', NULL, 43, 1, CAST(N'2022-01-16T16:25:22.233' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (170, N'helium', 1, 43, 1, CAST(N'2022-01-16T16:25:22.233' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (171, N'oxygen', NULL, 43, 1, CAST(N'2022-01-16T16:25:22.233' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (172, N'argon', NULL, 43, 1, CAST(N'2022-01-16T16:25:22.233' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (173, N'Silver and Gold', NULL, 44, 1, CAST(N'2022-01-16T16:26:38.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (174, N'Zinc and Gold', 1, 44, 1, CAST(N'2022-01-16T16:26:38.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (175, N'Copper and Silver', NULL, 44, 1, CAST(N'2022-01-16T16:26:38.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (176, N'Copper and Gold', NULL, 44, 1, CAST(N'2022-01-16T16:26:38.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (177, N'Copper', NULL, 45, 1, CAST(N'2022-01-16T16:28:13.303' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (178, N'Chromium', NULL, 45, 1, CAST(N'2022-01-16T16:28:13.303' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (179, N'Lead', 1, 45, 1, CAST(N'2022-01-16T16:28:13.303' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (180, N'Cadmium', NULL, 45, 1, CAST(N'2022-01-16T16:28:13.303' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (181, N'nickel and copper', NULL, 46, 1, CAST(N'2022-01-16T16:29:21.137' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (182, N'zinc and copper', NULL, 46, 1, CAST(N'2022-01-16T16:29:21.137' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (183, N'brass and nickel', NULL, 46, 1, CAST(N'2022-01-16T16:29:21.137' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (184, N'tin and copper', 1, 46, 1, CAST(N'2022-01-16T16:29:21.137' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (185, N'Tritium', NULL, 47, 1, CAST(N'2022-01-16T16:30:30.077' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (186, N'Deuterium', NULL, 47, 1, CAST(N'2022-01-16T16:30:30.077' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (187, N'Protium', NULL, 47, 1, CAST(N'2022-01-16T16:30:30.077' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (188, N'Yttrium', 1, 47, 1, CAST(N'2022-01-16T16:30:30.077' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (189, N'highly coloured alloys', NULL, 48, 1, CAST(N'2022-01-16T16:31:33.677' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (190, N'alloys which contain mercury as one of the contents', 1, 48, 1, CAST(N'2022-01-16T16:31:33.677' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (191, N'alloys which have great resistance to abrasion', NULL, 48, 1, CAST(N'2022-01-16T16:31:33.677' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (192, N'alloys which contain carbon', NULL, 48, 1, CAST(N'2022-01-16T16:31:33.677' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (193, N'Mercury', NULL, 49, 1, CAST(N'2022-01-16T16:32:37.137' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (194, N'Lithium', 1, 49, 1, CAST(N'2022-01-16T16:32:37.137' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (195, N'Lead', NULL, 49, 1, CAST(N'2022-01-16T16:32:37.137' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (196, N'Silver', NULL, 49, 1, CAST(N'2022-01-16T16:32:37.137' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (197, N'Radium', NULL, 50, 1, CAST(N'2022-01-16T16:33:47.967' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (198, N'Zinc', NULL, 50, 1, CAST(N'2022-01-16T16:33:47.967' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (199, N'Uranium', NULL, 50, 1, CAST(N'2022-01-16T16:33:47.967' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (200, N'Mercury', 1, 50, 1, CAST(N'2022-01-16T16:33:47.967' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (201, N'it is a sterilising agent', NULL, 51, 1, CAST(N'2022-01-16T16:35:10.570' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (202, N'it dissolves the impurities of water', NULL, 51, 1, CAST(N'2022-01-16T16:35:10.570' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (203, N'it is a reducing agent', NULL, 51, 1, CAST(N'2022-01-16T16:35:10.570' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (204, N'it is an oxidising agent', 1, 51, 1, CAST(N'2022-01-16T16:35:10.570' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (205, N'Ruby', NULL, 52, 1, CAST(N'2022-01-16T16:36:13.720' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (206, N'Sapphire', NULL, 52, 1, CAST(N'2022-01-16T16:36:13.720' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (207, N'Emerald', NULL, 52, 1, CAST(N'2022-01-16T16:36:13.720' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (208, N'Diamond', 1, 52, 1, CAST(N'2022-01-16T16:36:13.720' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (209, N'calcium oxide and ammonium chloride', NULL, 53, 1, CAST(N'2022-01-16T16:37:32.393' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (210, N'calcium carbonate and magnesium carbonate', 1, 53, 1, CAST(N'2022-01-16T16:37:32.393' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (211, N'aragonite and conchiolin', NULL, 53, 1, CAST(N'2022-01-16T16:37:32.393' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (212, N'ammonium sulphate and sodium carbonate', NULL, 53, 1, CAST(N'2022-01-16T16:37:32.393' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (213, N'it has a high specific heat', NULL, 54, 1, CAST(N'2022-01-16T16:38:37.370' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (214, N'it has no colour', NULL, 54, 1, CAST(N'2022-01-16T16:38:37.370' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (215, N'it has a high dipole moment', 1, 54, 1, CAST(N'2022-01-16T16:38:37.370' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (216, N'it has a high boiling point', NULL, 54, 1, CAST(N'2022-01-16T16:38:37.370' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (217, N'chlorine', NULL, 55, 1, CAST(N'2022-01-16T16:40:19.140' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (218, N'washing soda', 1, 55, 1, CAST(N'2022-01-16T16:40:19.140' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (219, N'potassium permanganate', NULL, 55, 1, CAST(N'2022-01-16T16:40:19.140' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (220, N'bleaching powder', NULL, 55, 1, CAST(N'2022-01-16T16:40:19.140' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (221, N'Krypton', 0, 56, 1, CAST(N'2022-01-16T16:42:32.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (222, N'Xenon', 0, 56, 1, CAST(N'2022-01-16T16:42:32.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (223, N'Neon', 0, 56, 1, CAST(N'2022-01-16T16:42:32.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (224, N'Helium', 1, 56, 1, CAST(N'2022-01-16T16:42:32.783' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (225, N'Lithium', NULL, 57, 1, CAST(N'2022-01-16T16:43:46.107' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (226, N'Sodium', NULL, 57, 1, CAST(N'2022-01-16T16:43:46.107' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (227, N'Francium', 1, 57, 1, CAST(N'2022-01-16T16:43:46.107' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (228, N'Cerium', NULL, 57, 1, CAST(N'2022-01-16T16:43:46.107' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (229, N'bromine', NULL, 58, 1, CAST(N'2022-01-16T16:45:03.570' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (230, N'fluorine', NULL, 58, 1, CAST(N'2022-01-16T16:45:03.570' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (231, N'chlorine', NULL, 58, 1, CAST(N'2022-01-16T16:45:03.570' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (232, N'sulphur', 1, 58, 1, CAST(N'2022-01-16T16:45:03.570' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (233, N'coke is the hardest, graphite is the softest', NULL, 59, 1, CAST(N'2022-01-16T16:46:19.643' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (234, N'diamond is the hardest, coke is the softest', NULL, 59, 1, CAST(N'2022-01-16T16:46:19.643' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (235, N'diamond is the hardest, graphite is the softest', 1, 59, 1, CAST(N'2022-01-16T16:46:19.643' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (236, N'diamond is the hardest, lamp black is the softest', NULL, 59, 1, CAST(N'2022-01-16T16:46:19.643' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (237, N'Argon', NULL, 60, 1, CAST(N'2022-01-16T16:47:37.163' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (238, N'Xenon', NULL, 60, 1, CAST(N'2022-01-16T16:47:37.163' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (239, N'Helium', 1, 60, 1, CAST(N'2022-01-16T16:47:37.163' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (240, N'Krypton', NULL, 60, 1, CAST(N'2022-01-16T16:47:37.163' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (241, N'सरदार पटेल', 0, 61, 1, CAST(N'2022-01-16T17:05:41.463' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (242, N'महलनोबीस', 0, 61, 1, CAST(N'2022-01-16T17:05:41.463' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (243, N' दादाभाई नौरोजी', 1, 61, 1, CAST(N'2022-01-16T17:05:41.463' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (244, N'वी. के. आर. वी. राव', 0, 61, 1, CAST(N'2022-01-16T17:05:41.463' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (245, N' प्राकृतिक संसाधन', NULL, 62, 1, CAST(N'2022-01-16T17:07:37.193' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (246, N'बाजार का आकर', NULL, 62, 1, CAST(N'2022-01-16T17:07:37.193' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (247, N'पूंजी निर्माण', NULL, 62, 1, CAST(N'2022-01-16T17:07:37.193' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (248, N'उपर्युक्त सभी', 1, 62, 1, CAST(N'2022-01-16T17:07:37.193' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (249, N'न्यूयॉर्क', NULL, 63, 1, CAST(N'2022-01-16T17:08:58.117' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (250, N'जेनेवा', 1, 63, 1, CAST(N'2022-01-16T17:08:58.117' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (251, N'यूरुगे', NULL, 63, 1, CAST(N'2022-01-16T17:08:58.117' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (252, N'दोहा', NULL, 63, 1, CAST(N'2022-01-16T17:08:58.117' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (253, N'वित्त आयोग', NULL, 64, 1, CAST(N'2022-01-16T17:09:52.237' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (254, N'योजना आयोग', NULL, 64, 1, CAST(N'2022-01-16T17:09:52.237' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (255, N'व्यापारिक बैंक', NULL, 64, 1, CAST(N'2022-01-16T17:09:52.237' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (256, N'भारतीय रिजर्व बैंक', 1, 64, 1, CAST(N'2022-01-16T17:09:52.237' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (257, N'होगेनक्कल प्रपात', NULL, 65, 1, CAST(N'2022-01-16T17:10:57.463' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (258, N'शिमला प्रपात', NULL, 65, 1, CAST(N'2022-01-16T17:10:57.463' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (259, N' जोग प्रपात', 1, 65, 1, CAST(N'2022-01-16T17:10:57.463' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (260, N'कोर्टाल्ल्म प्रपात', NULL, 65, 1, CAST(N'2022-01-16T17:10:57.463' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (261, N'तमिलनाडु', NULL, 66, 1, CAST(N'2022-01-16T17:12:05.217' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (262, N' पश्चिम बंगाल', 1, 66, 1, CAST(N'2022-01-16T17:12:05.217' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (263, N'ओडिसा', NULL, 66, 1, CAST(N'2022-01-16T17:12:05.217' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (264, N'केरल', NULL, 66, 1, CAST(N'2022-01-16T17:12:05.217' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (265, N'पाकिस्तान एवं चीन', NULL, 67, 1, CAST(N'2022-01-16T17:13:21.093' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (266, N'भारत एवं श्री लंका', 1, 67, 1, CAST(N'2022-01-16T17:13:21.093' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (267, N'उत्तरी कोरिया एवं दक्षिणी कोरिया', NULL, 67, 1, CAST(N'2022-01-16T17:13:21.093' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (268, N' ब्रिटेन एवं फ़्रांस', NULL, 67, 1, CAST(N'2022-01-16T17:13:21.093' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (269, N'तमिलनाडु', NULL, 68, 1, CAST(N'2022-01-16T17:14:36.700' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (270, N'आंध्र प्रदेश', 1, 68, 1, CAST(N'2022-01-16T17:14:36.700' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (271, N'कर्नाटक', NULL, 68, 1, CAST(N'2022-01-16T17:14:36.700' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (272, N'केरल', NULL, 68, 1, CAST(N'2022-01-16T17:14:36.700' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (273, N'नागासाकी', NULL, 69, 1, CAST(N'2022-01-16T17:15:37.610' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (274, N'हांगकांग', NULL, 69, 1, CAST(N'2022-01-16T17:15:37.610' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (275, N'टोक्यो', NULL, 69, 1, CAST(N'2022-01-16T17:15:37.610' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (276, N'हिरोशिमा', 1, 69, 1, CAST(N'2022-01-16T17:15:37.610' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (277, N'आयनमंडल', NULL, 70, 1, CAST(N'2022-01-16T17:16:50.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (278, N'बहिर्मडल', NULL, 70, 1, CAST(N'2022-01-16T17:16:50.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (279, N' क्षमामंडल', NULL, 70, 1, CAST(N'2022-01-16T17:16:50.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (280, N'समतापमंडल', 1, 70, 1, CAST(N'2022-01-16T17:16:50.380' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (281, N'अरविन्द घोष', NULL, 71, 1, CAST(N'2022-01-16T17:17:55.440' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (282, N' गोपालकृष्ण गोखले', 1, 71, 1, CAST(N'2022-01-16T17:17:55.440' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (283, N' बाल गंगाधर तिलक', NULL, 71, 1, CAST(N'2022-01-16T17:17:55.440' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (284, N' लाला लाजपत राय', NULL, 71, 1, CAST(N'2022-01-16T17:17:55.440' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (285, N'वायु', NULL, 72, 1, CAST(N'2022-01-16T17:19:00.103' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (286, N'भूमि', NULL, 72, 1, CAST(N'2022-01-16T17:19:00.103' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (287, N'ध्वनि', 1, 72, 1, CAST(N'2022-01-16T17:19:00.103' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (288, N'जल', NULL, 72, 1, CAST(N'2022-01-16T17:19:00.103' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (289, N'वैशाली', NULL, 73, 1, CAST(N'2022-01-16T17:20:03.743' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (290, N'कौशाम्बी', NULL, 73, 1, CAST(N'2022-01-16T17:20:03.743' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (291, N'श्रावस्ती', NULL, 73, 1, CAST(N'2022-01-16T17:20:03.743' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (292, N'चम्पा', 1, 73, 1, CAST(N'2022-01-16T17:20:03.743' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (293, N'असम', NULL, 74, 1, CAST(N'2022-01-16T17:21:09.390' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (294, N'केरल', 1, 74, 1, CAST(N'2022-01-16T17:21:09.390' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (295, N'अरुणाचल प्रदेश', NULL, 74, 1, CAST(N'2022-01-16T17:21:09.390' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (296, N'तमिलनाडु', NULL, 74, 1, CAST(N'2022-01-16T17:21:09.390' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (297, N'चक्रवात', NULL, 75, 1, CAST(N'2022-01-16T17:22:14.447' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (298, N'ज्वालामुखी', NULL, 75, 1, CAST(N'2022-01-16T17:22:14.447' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (299, N'चन्द्रमा का आकर्षण', NULL, 75, 1, CAST(N'2022-01-16T17:22:14.447' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (300, N'समुद्री सतह पर भूकम्प', 1, 75, 1, CAST(N'2022-01-16T17:22:14.447' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (301, N'अमर्त्य सेन', NULL, 76, 1, CAST(N'2022-01-16T17:23:25.937' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (302, N'मोंटेक सिंह', NULL, 76, 1, CAST(N'2022-01-16T17:23:25.937' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (303, N'महबूब-उल-हक', 1, 76, 1, CAST(N'2022-01-16T17:23:25.937' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (304, N'फ्रीडमैन', NULL, 76, 1, CAST(N'2022-01-16T17:23:25.937' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (305, N' 1947 ', NULL, 77, 1, CAST(N'2022-01-16T17:24:50.230' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (306, N' 1948 ', 1, 77, 1, CAST(N'2022-01-16T17:24:50.230' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (307, N' 1950 ', NULL, 77, 1, CAST(N'2022-01-16T17:24:50.230' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (308, N' 1951', NULL, 77, 1, CAST(N'2022-01-16T17:24:50.230' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (309, N'एडवर्ड जेनर', NULL, 78, 1, CAST(N'2022-01-16T17:25:51.837' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (310, N'एफ. बांटिंग', 1, 78, 1, CAST(N'2022-01-16T17:25:51.837' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (311, N'एस. ए. वेक्समैन', NULL, 78, 1, CAST(N'2022-01-16T17:25:51.837' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (312, N'रोनाल्ड रॉस', NULL, 78, 1, CAST(N'2022-01-16T17:25:51.837' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (313, N'वास्को- डि गामा', NULL, 79, 1, CAST(N'2022-01-16T17:26:56.033' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (314, N'अमुं दसेन', NULL, 79, 1, CAST(N'2022-01-16T17:26:56.033' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (315, N' कैप्टेन कुक ', NULL, 79, 1, CAST(N'2022-01-16T17:26:56.033' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (316, N'कोलंबस', 1, 79, 1, CAST(N'2022-01-16T17:26:56.033' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (317, N'महानदी', NULL, 80, 1, CAST(N'2022-01-16T17:27:48.670' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (318, N'गोदावरी', 1, 80, 1, CAST(N'2022-01-16T17:27:48.670' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (319, N'कृष्णा', NULL, 80, 1, CAST(N'2022-01-16T17:27:48.670' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (320, N' ताप्ती', NULL, 80, 1, CAST(N'2022-01-16T17:27:48.670' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (321, N'फफूंद', 1, 81, 1, CAST(N'2022-01-16T17:28:45.920' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (322, N'जीवाणु', NULL, 81, 1, CAST(N'2022-01-16T17:28:45.920' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (323, N'वाइरस', NULL, 81, 1, CAST(N'2022-01-16T17:28:45.920' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (324, N'शैवाल', NULL, 81, 1, CAST(N'2022-01-16T17:28:45.920' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (325, N' पित्ताशय', NULL, 82, 1, CAST(N'2022-01-16T17:29:38.203' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (326, N'अग्न्याशय', NULL, 82, 1, CAST(N'2022-01-16T17:29:38.203' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (327, N'पित्तवाहिनी', NULL, 82, 1, CAST(N'2022-01-16T17:29:38.203' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (328, N' यकृत', 1, 82, 1, CAST(N'2022-01-16T17:29:38.203' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (329, N'त्रिशूल', 1, 83, 1, CAST(N'2022-01-16T17:30:42.183' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (330, N'अग्नि', NULL, 83, 1, CAST(N'2022-01-16T17:30:42.183' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (331, N'ब्रह्मोस', NULL, 83, 1, CAST(N'2022-01-16T17:30:42.183' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (332, N'सागरिका', NULL, 83, 1, CAST(N'2022-01-16T17:30:42.183' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (333, N'फिजी', NULL, 84, 1, CAST(N'2022-01-16T17:31:49.797' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (334, N'मॉरीशस', NULL, 84, 1, CAST(N'2022-01-16T17:31:49.797' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (335, N'इंडोनेशिया', NULL, 84, 1, CAST(N'2022-01-16T17:31:49.797' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (336, N'नेपाल', 1, 84, 1, CAST(N'2022-01-16T17:31:49.797' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (337, N'सर्वोदय', NULL, 85, 1, CAST(N'2022-01-16T17:33:02.740' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (338, N'आर्य', NULL, 85, 1, CAST(N'2022-01-16T17:33:02.740' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (339, N'टाइम्स ऑफ इण्डिया', NULL, 85, 1, CAST(N'2022-01-16T17:33:02.740' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (340, N'यंग इण्डिया', 1, 85, 1, CAST(N'2022-01-16T17:33:02.740' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (341, N'बाल गंगाधर तिलक', NULL, 86, 1, CAST(N'2022-01-16T17:34:06.763' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (342, N'गोपालकृष्ण गोखले', 1, 86, 1, CAST(N'2022-01-16T17:34:06.763' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (343, N'सुरेन्द्रनाथ बनर्जी', NULL, 86, 1, CAST(N'2022-01-16T17:34:06.763' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (344, N'दादाभाई नौरोजी', NULL, 86, 1, CAST(N'2022-01-16T17:34:06.763' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (345, N'जतिन दास', NULL, 87, 1, CAST(N'2022-01-16T17:35:20.873' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (346, N'चन्द्रशेखर आजाद', NULL, 87, 1, CAST(N'2022-01-16T17:35:20.873' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (347, N'कल्पना दत्त', NULL, 87, 1, CAST(N'2022-01-16T17:35:20.873' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (348, N'राजगुरु', 1, 87, 1, CAST(N'2022-01-16T17:35:20.873' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (349, N'आगरा', 1, 88, 1, CAST(N'2022-01-16T17:36:36.717' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (350, N'जयपुर', NULL, 88, 1, CAST(N'2022-01-16T17:36:36.717' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (351, N'अहमदाबाद', NULL, 88, 1, CAST(N'2022-01-16T17:36:36.717' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (352, N'लाहौर', NULL, 88, 1, CAST(N'2022-01-16T17:36:36.717' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (353, N'माँस', NULL, 89, 1, CAST(N'2022-01-16T17:37:46.940' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (354, N'पीला योक', NULL, 89, 1, CAST(N'2022-01-16T17:37:46.940' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (355, N' घी', NULL, 89, 1, CAST(N'2022-01-16T17:37:46.940' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (356, N'ताजी सब्जियाँ', 1, 89, 1, CAST(N'2022-01-16T17:37:46.940' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (357, N'206', 1, 90, 1, CAST(N'2022-01-16T17:38:45.207' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (358, N'260', NULL, 90, 1, CAST(N'2022-01-16T17:38:45.207' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (359, N'306', NULL, 90, 1, CAST(N'2022-01-16T17:38:45.207' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (360, N'221', NULL, 90, 1, CAST(N'2022-01-16T17:38:45.207' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (361, N' विटामिन B12', NULL, 91, 1, CAST(N'2022-01-16T17:39:47.880' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (362, N'विटामिन C', NULL, 91, 1, CAST(N'2022-01-16T17:39:47.880' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (363, N'विटामिन D', 1, 91, 1, CAST(N'2022-01-16T17:39:47.880' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (364, N'विटामिन K', NULL, 91, 1, CAST(N'2022-01-16T17:39:47.880' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (365, N'हृदय', NULL, 92, 1, CAST(N'2022-01-16T17:40:48.623' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (366, N'मस्तिष्क', NULL, 92, 1, CAST(N'2022-01-16T17:40:48.623' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (367, N'यकृत', 1, 92, 1, CAST(N'2022-01-16T17:40:48.623' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (368, N'गुर्दा', NULL, 92, 1, CAST(N'2022-01-16T17:40:48.623' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (369, N' समतल दर्पण ', NULL, 93, 1, CAST(N'2022-01-16T17:42:16.003' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (370, N'अवतल दर्पण ', NULL, 93, 1, CAST(N'2022-01-16T17:42:16.003' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (371, N' उत्तल दर्पण', NULL, 93, 1, CAST(N'2022-01-16T17:42:16.003' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (372, N' परवलीय दर्पण', 1, 93, 1, CAST(N'2022-01-16T17:42:16.003' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (373, N'36,000 किमी', 1, 94, 1, CAST(N'2022-01-16T17:43:21.073' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (374, N' 30,000 किमी', NULL, 94, 1, CAST(N'2022-01-16T17:43:21.073' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (375, N'42,000 किमी', NULL, 94, 1, CAST(N'2022-01-16T17:43:21.073' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (376, N' इनमें से कोई नहीं', NULL, 94, 1, CAST(N'2022-01-16T17:43:21.073' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (377, N' ताँबा', NULL, 95, 1, CAST(N'2022-01-16T17:44:28.973' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (378, N'निक्रोम', 1, 95, 1, CAST(N'2022-01-16T17:44:28.973' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (379, N'जस्ता', NULL, 95, 1, CAST(N'2022-01-16T17:44:28.973' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (380, N'टंग्स्टेन', NULL, 95, 1, CAST(N'2022-01-16T17:44:28.973' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (381, N'पृथ्वी', NULL, 96, 1, CAST(N'2022-01-16T17:45:25.790' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (382, N'बुध', 1, 96, 1, CAST(N'2022-01-16T17:45:25.790' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (383, N'मंगल', NULL, 96, 1, CAST(N'2022-01-16T17:45:25.790' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (384, N'शुक्र', NULL, 96, 1, CAST(N'2022-01-16T17:45:25.790' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (385, N'सिनेमा', 0, 97, 1, CAST(N'2022-01-18T20:32:05.470' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (386, N'साहित्य', 0, 97, 1, CAST(N'2022-01-18T20:32:05.470' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (387, N'खेल-कूद', 1, 97, 1, CAST(N'2022-01-18T20:32:05.470' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (388, N' विज्ञान', 0, 97, 1, CAST(N'2022-01-18T20:32:05.470' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (389, N'हॉकी', NULL, 98, 1, CAST(N'2022-01-18T20:33:13.493' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (390, N'क्रिकेट', NULL, 98, 1, CAST(N'2022-01-18T20:33:13.493' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (391, N'फुटबॉल', 1, 98, 1, CAST(N'2022-01-18T20:33:13.493' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (392, N'गोल्फ', NULL, 98, 1, CAST(N'2022-01-18T20:33:13.493' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (393, N'क्रिकेट', NULL, 99, 1, CAST(N'2022-01-18T20:34:36.270' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (394, N'बिलियर्डस्', NULL, 99, 1, CAST(N'2022-01-18T20:34:36.270' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (395, N'शतरंज', NULL, 99, 1, CAST(N'2022-01-18T20:34:36.270' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (396, N'तैराकी', 1, 99, 1, CAST(N'2022-01-18T20:34:36.270' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (397, N'1989', NULL, 100, 1, CAST(N'2022-01-18T20:35:32.723' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (398, N'1899', NULL, 100, 1, CAST(N'2022-01-18T20:35:32.723' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (399, N'1961', 1, 100, 1, CAST(N'2022-01-18T20:35:32.723' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (400, N'1997', NULL, 100, 1, CAST(N'2022-01-18T20:35:32.723' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (401, N'फुटबॉल', NULL, 101, 1, CAST(N'2022-01-18T20:36:34.200' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (402, N'मुक्केबाजी', NULL, 101, 1, CAST(N'2022-01-18T20:36:34.200' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (403, N'क्रिकेट', 1, 101, 1, CAST(N'2022-01-18T20:36:34.200' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (404, N' शतरंज', NULL, 101, 1, CAST(N'2022-01-18T20:36:34.200' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (405, N'विजय कुमार', 1, 102, 1, CAST(N'2022-01-18T20:37:52.787' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (406, N'राज्यवर्द्धन सिंह राठौर', NULL, 102, 1, CAST(N'2022-01-18T20:37:52.787' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (407, N'मानवजीत सिंह संधू', NULL, 102, 1, CAST(N'2022-01-18T20:37:52.787' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (408, N'समरेश जंग', NULL, 102, 1, CAST(N'2022-01-18T20:37:52.787' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (409, N' तैराकी', NULL, 103, 1, CAST(N'2022-01-18T20:39:01.090' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (410, N'कबड्डी', 1, 103, 1, CAST(N'2022-01-18T20:39:01.090' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (411, N'फुटबॉल', NULL, 103, 1, CAST(N'2022-01-18T20:39:01.090' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (412, N'मुक्केबाजी', NULL, 103, 1, CAST(N'2022-01-18T20:39:01.090' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (413, N'मुक्केबाजी', NULL, 104, 1, CAST(N'2022-01-18T20:40:16.673' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (414, N'बास्केटबॉल', 1, 104, 1, CAST(N'2022-01-18T20:40:16.673' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (415, N'बिलियर्ड्स', NULL, 104, 1, CAST(N'2022-01-18T20:40:16.673' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (416, N'इनमें से कोई नहीं', NULL, 104, 1, CAST(N'2022-01-18T20:40:16.673' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (417, N' हॉकी', NULL, 105, 1, CAST(N'2022-01-18T20:41:39.173' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (418, N' पोलो', NULL, 105, 1, CAST(N'2022-01-18T20:41:39.173' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (419, N' क्रिकेट', 1, 105, 1, CAST(N'2022-01-18T20:41:39.173' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (420, N'फुटबॉल', NULL, 105, 1, CAST(N'2022-01-18T20:41:39.173' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (421, N'बॉक्सिंग', 1, 106, 1, CAST(N'2022-01-18T20:42:59.090' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (422, N'क्रिकेट', NULL, 106, 1, CAST(N'2022-01-18T20:42:59.090' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (423, N' तैराकी', NULL, 106, 1, CAST(N'2022-01-18T20:42:59.090' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (424, N'इनमें से कोई नहीं', NULL, 106, 1, CAST(N'2022-01-18T20:42:59.090' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (425, N' 5 ', NULL, 107, 1, CAST(N'2022-01-18T20:44:06.870' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (426, N'8', 1, 107, 1, CAST(N'2022-01-18T20:44:06.870' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (427, N'11', NULL, 107, 1, CAST(N'2022-01-18T20:44:06.870' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (428, N'9', NULL, 107, 1, CAST(N'2022-01-18T20:44:06.870' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (429, N'विजय कुमार', NULL, 108, 1, CAST(N'2022-01-18T20:45:14.503' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (430, N'समरेश जंग', NULL, 108, 1, CAST(N'2022-01-18T20:45:14.503' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (431, N'मेजर ध्यानचन्द', 1, 108, 1, CAST(N'2022-01-18T20:45:14.503' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (432, N'इनमें से कोई नहीं', NULL, 108, 1, CAST(N'2022-01-18T20:45:14.503' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (433, N'पृथ्वीपाल सिंह', NULL, 109, 1, CAST(N'2022-01-18T20:46:25.987' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (434, N'अशोक कुमार', NULL, 109, 1, CAST(N'2022-01-18T20:46:25.987' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (435, N'जी एस. रामचन्द', 1, 109, 1, CAST(N'2022-01-18T20:46:25.987' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (436, N'बलवीर सिंह', NULL, 109, 1, CAST(N'2022-01-18T20:46:25.987' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (437, N'योगेश्वर दत्त', 1, 110, 1, CAST(N'2022-01-18T20:47:34.450' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (438, N'सुशील कुमार', NULL, 110, 1, CAST(N'2022-01-18T20:47:34.450' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (439, N' विजय कुमार', NULL, 110, 1, CAST(N'2022-01-18T20:47:34.450' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (440, N'विजेंदर सिंह', NULL, 110, 1, CAST(N'2022-01-18T20:47:34.450' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (441, N'जॉर्ज बुश', NULL, 111, 1, CAST(N'2022-01-18T20:48:35.677' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (442, N'जैक्स रोगे', 1, 111, 1, CAST(N'2022-01-18T20:48:35.677' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (443, N'ज्याफ हावर्थ', NULL, 111, 1, CAST(N'2022-01-18T20:48:35.677' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (444, N'किम ह्यूज', NULL, 111, 1, CAST(N'2022-01-18T20:48:35.677' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (445, N'बेसबॉल', NULL, 112, 1, CAST(N'2022-01-18T20:49:41.557' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (446, N'आइस हॉकी', 1, 112, 1, CAST(N'2022-01-18T20:49:41.557' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (447, N'फुटबॉल', NULL, 112, 1, CAST(N'2022-01-18T20:49:41.557' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (448, N'इनमें से कोई नहीं', NULL, 112, 1, CAST(N'2022-01-18T20:49:41.557' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (449, N'आइस हॉकी', NULL, 113, 1, CAST(N'2022-01-18T20:50:41.877' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (450, N' फुटबॉल', NULL, 113, 1, CAST(N'2022-01-18T20:50:41.877' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (451, N' बेसबॉल', 1, 113, 1, CAST(N'2022-01-18T20:50:41.877' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (452, N'हैण्डबॉल', NULL, 113, 1, CAST(N'2022-01-18T20:50:41.877' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (453, N'कबड्डी', NULL, 114, 1, CAST(N'2022-01-18T20:51:35.333' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (454, N'क्रिकेट', NULL, 114, 1, CAST(N'2022-01-18T20:51:35.333' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (455, N'शतरंज', NULL, 114, 1, CAST(N'2022-01-18T20:51:35.333' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (456, N'हॉकी', 1, 114, 1, CAST(N'2022-01-18T20:51:35.333' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (457, N'क्रिकेट', NULL, 115, 1, CAST(N'2022-01-18T20:52:29.350' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (458, N'कबड्डी', NULL, 115, 1, CAST(N'2022-01-18T20:52:29.350' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (459, N' शतरंज', NULL, 115, 1, CAST(N'2022-01-18T20:52:29.350' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (460, N'जूडो', 1, 115, 1, CAST(N'2022-01-18T20:52:29.350' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (461, N'बिहार', NULL, 116, 1, CAST(N'2022-01-18T20:53:39.010' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (462, N'असम', NULL, 116, 1, CAST(N'2022-01-18T20:53:39.010' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (463, N'मणिपुर', 1, 116, 1, CAST(N'2022-01-18T20:53:39.010' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (464, N' कर्नाटका', NULL, 116, 1, CAST(N'2022-01-18T20:53:39.010' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (465, N'तुर्क ', 1, 117, 1, CAST(N'2022-01-18T20:54:55.113' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (466, N'पुर्तगाली', NULL, 117, 1, CAST(N'2022-01-18T20:54:55.113' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (467, N'यूनानी ', NULL, 117, 1, CAST(N'2022-01-18T20:54:55.113' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (468, N'इनमें से कोई नहीं', NULL, 117, 1, CAST(N'2022-01-18T20:54:55.113' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (469, N'चीन ', NULL, 118, 1, CAST(N'2022-01-18T20:56:05.117' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (470, N'जापान', NULL, 118, 1, CAST(N'2022-01-18T20:56:05.117' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (471, N'भारत ', 1, 118, 1, CAST(N'2022-01-18T20:56:05.117' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (472, N'रूस', NULL, 118, 1, CAST(N'2022-01-18T20:56:05.117' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (473, N'भारत ', 1, 119, 1, CAST(N'2022-01-18T20:57:08.860' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (474, N'जापान', NULL, 119, 1, CAST(N'2022-01-18T20:57:08.860' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (475, N'चीन', NULL, 119, 1, CAST(N'2022-01-18T20:57:08.860' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (476, N' इंग्लैंड', NULL, 119, 1, CAST(N'2022-01-18T20:57:08.860' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (477, N'जापान ', NULL, 120, 1, CAST(N'2022-01-18T20:58:02.133' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (478, N' इंग्लैंड ', 1, 120, 1, CAST(N'2022-01-18T20:58:02.133' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (479, N'चीन', NULL, 120, 1, CAST(N'2022-01-18T20:58:02.133' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (480, N'इनमें से कोई नहीं', NULL, 120, 1, CAST(N'2022-01-18T20:58:02.133' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (481, N'रूस ', NULL, 121, 1, CAST(N'2022-01-18T20:59:04.450' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (482, N' आस्ट्रेलिया', 1, 121, 1, CAST(N'2022-01-18T20:59:04.450' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (483, N'न्यूजीलैंड', NULL, 121, 1, CAST(N'2022-01-18T20:59:04.450' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (484, N' भारत', NULL, 121, 1, CAST(N'2022-01-18T20:59:04.450' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (485, N'9 ', NULL, 122, 1, CAST(N'2022-01-18T20:59:48.093' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (486, N'10', NULL, 122, 1, CAST(N'2022-01-18T20:59:48.093' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (487, N'8', NULL, 122, 1, CAST(N'2022-01-18T20:59:48.093' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (488, N'7', 1, 122, 1, CAST(N'2022-01-18T20:59:48.093' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (489, N'3 ', NULL, 123, 1, CAST(N'2022-01-18T21:01:21.060' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (490, N'2', NULL, 123, 1, CAST(N'2022-01-18T21:01:21.060' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (491, N'4', 1, 123, 1, CAST(N'2022-01-18T21:01:21.060' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (492, N'9', NULL, 123, 1, CAST(N'2022-01-18T21:01:21.060' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (493, N'7', NULL, 124, 1, CAST(N'2022-01-18T21:02:06.320' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (494, N'9', 1, 124, 1, CAST(N'2022-01-18T21:02:06.320' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (495, N'6', NULL, 124, 1, CAST(N'2022-01-18T21:02:06.320' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (496, N'11', NULL, 124, 1, CAST(N'2022-01-18T21:02:06.320' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (497, N'6 ', 1, 125, 1, CAST(N'2022-01-18T21:02:56.040' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (498, N'8', NULL, 125, 1, CAST(N'2022-01-18T21:02:56.040' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (499, N'10', NULL, 125, 1, CAST(N'2022-01-18T21:02:56.040' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (500, N'12', NULL, 125, 1, CAST(N'2022-01-18T21:02:56.040' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (501, N'9', NULL, 126, 1, CAST(N'2022-01-18T21:03:36.833' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (502, N'10', NULL, 126, 1, CAST(N'2022-01-18T21:03:36.833' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (503, N'4', NULL, 126, 1, CAST(N'2022-01-18T21:03:36.833' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (504, N'5', 1, 126, 1, CAST(N'2022-01-18T21:03:36.833' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (505, N'उधम सिंह ', NULL, 127, 1, CAST(N'2022-01-18T21:04:58.620' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (506, N' मेजर ध्यानचंद', 1, 127, 1, CAST(N'2022-01-18T21:04:58.620' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (507, N' रूप सिंह', NULL, 127, 1, CAST(N'2022-01-18T21:04:58.620' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (508, N' इनमें से कोई नहीं', NULL, 127, 1, CAST(N'2022-01-18T21:04:58.620' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [ImageUrl], [Price], [isActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Quantity], [Category]) VALUES (1, N'Rice Frie', N'dslks djsjdns bnj n[pdnin', N'https://images.app.goo.gl/9poRCNJS7jpULbdC6', CAST(444.00 AS Decimal(18, 2)), 1, CAST(N'2022-06-11T13:37:21.237' AS DateTime), 2, CAST(N'2022-08-07T16:01:49.910' AS DateTime), 2, 35, 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [ImageUrl], [Price], [isActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Quantity], [Category]) VALUES (2, N'Omelet', N'sahfg  as gfhsag f sag f', N'https://images.app.goo.gl/9poRCNJS7jpULbdC6', CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2022-06-19T12:15:47.153' AS DateTime), 2, CAST(N'2022-08-07T10:58:24.267' AS DateTime), 2, 1, 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [ImageUrl], [Price], [isActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Quantity], [Category]) VALUES (3, N'Tossed salad', N'Chesss', N'https://images.app.goo.gl/9poRCNJS7jpULbdC6', CAST(200.00 AS Decimal(18, 2)), 1, CAST(N'2022-06-19T12:17:17.777' AS DateTime), 2, CAST(N'2022-08-07T10:39:50.747' AS DateTime), 2, 20, 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [ImageUrl], [Price], [isActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Quantity], [Category]) VALUES (4, N'Pasta', N'vvk', N'https://images.app.goo.gl/9poRCNJS7jpULbdC6', CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2022-06-19T12:17:59.063' AS DateTime), 2, NULL, NULL, 190, 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [ImageUrl], [Price], [isActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Quantity], [Category]) VALUES (5, N'Soup', N'Test', N'https://images.app.goo.gl/9poRCNJS7jpULbdC6', CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2022-06-19T12:21:51.727' AS DateTime), 2, NULL, NULL, 10, 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [ImageUrl], [Price], [isActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Quantity], [Category]) VALUES (6, N'Pizza', N'Test', N'https://images.app.goo.gl/9poRCNJS7jpULbdC6', CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2022-06-19T12:25:04.040' AS DateTime), 2, CAST(N'2022-07-16T15:38:52.380' AS DateTime), 2, 10, 3)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 
GO
INSERT [dbo].[ProductCategory] ([Id], [Name], [isActive], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [Description], [isDefault]) VALUES (2, N'hfgfgum', 1, CAST(N'2022-06-12T12:18:55.017' AS DateTime), 2, CAST(N'2022-08-07T13:54:51.777' AS DateTime), 2, N'', 1)
GO
INSERT [dbo].[ProductCategory] ([Id], [Name], [isActive], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [Description], [isDefault]) VALUES (3, N'fdasg dfg', 1, CAST(N'2022-06-12T12:21:06.183' AS DateTime), 2, CAST(N'2022-08-07T10:19:53.147' AS DateTime), 2, N'', 0)
GO
INSERT [dbo].[ProductCategory] ([Id], [Name], [isActive], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [Description], [isDefault]) VALUES (4, N'Test q2t', 1, CAST(N'2022-06-12T12:37:51.700' AS DateTime), 2, CAST(N'2022-06-12T12:39:46.043' AS DateTime), 2, N'kljkl', 0)
GO
INSERT [dbo].[ProductCategory] ([Id], [Name], [isActive], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [Description], [isDefault]) VALUES (5, N'DSFS', 1, CAST(N'2022-07-24T09:58:17.200' AS DateTime), 2, CAST(N'2022-07-24T09:58:17.200' AS DateTime), 2, N'SDFSAF', 0)
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (1, N'राजीव एक तस्वीर की ओर संकेत करते हुए, एक महिला से कहा, “उसकी बहन के पिता मेरे ससुर के इकलौते पुत्र है” महिला का राजीव से क्या सम्बन्ध है?', 1, CAST(N'2021-12-18T19:01:51.397' AS DateTime), 1, 2830, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (2, N'A + B का अर्थ है, ‘A,B का पुत्र है’, A – B का अर्थ है, ‘A,B की पत्नी है’, A × B का अर्थ है ‘A, B की माँ है’,A ÷ B का अर्थ है, ‘A, B की बहन है। तो C + D – E का अर्थ क्या है?', 1, CAST(N'2021-12-18T19:03:17.453' AS DateTime), 1, 9469, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (3, N'यदि A, B की माँ है, X, Y का पिता है, H, J का भाई है, L, Y के पिता का भाई है, B, L की बहन है और J, A का पति है। तो J का Y से क्या संबंध है?', 1, CAST(N'2021-12-18T19:04:25.850' AS DateTime), 1, 917, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (4, N'किसी फोटोग्राफ की ओर संकेत करते हुए एक व्यक्ति ने कहा, “मुझे कोई भाई या बहन नहीं है लेकिन उस व्यक्ति का पिता मेरे पिता का पुत्र है” वह फोटोग्राफ किसका है-', 1, CAST(N'2021-12-18T19:08:36.800' AS DateTime), 1, 1772, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (5, N'	
Brass gets discoloured in air because of the presence of which of the following gases in air?', 1, CAST(N'2022-01-16T15:14:53.550' AS DateTime), 2, 15, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (32, N'Which of the following is a non metal that remains liquid at room temperature?

', 1, CAST(N'2022-01-16T16:12:28.270' AS DateTime), 2, 6103, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (33, N'Chlorophyll is a naturally occurring chelate compound in which central metal is', 1, CAST(N'2022-01-16T16:13:39.800' AS DateTime), 2, 7919, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (34, N'Which of the following is used in pencils?', 1, CAST(N'2022-01-16T16:14:56.777' AS DateTime), 2, 9238, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (35, N'What is laughing gas?', 1, CAST(N'2022-01-16T16:16:53.317' AS DateTime), 2, 3797, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (36, N'Actinides are the elements with atomic numbers from', 1, CAST(N'2022-01-16T16:17:58.890' AS DateTime), 2, 1802, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (37, N'The filament of an electric bulb is made of', 1, CAST(N'2022-01-16T16:19:02.817' AS DateTime), 2, 628, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (38, N'	
Diamond is an allotropic form of', 1, CAST(N'2022-01-16T16:20:02.547' AS DateTime), 2, 3164, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (39, N' 	
In fireworks, the green flame is produced because of', 1, CAST(N'2022-01-16T16:21:05.000' AS DateTime), 2, 1183, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (40, N'	
Marsh gas is', 1, CAST(N'2022-01-16T16:22:08.720' AS DateTime), 2, 7047, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (41, N'LPG consists of mainly', 1, CAST(N'2022-01-16T16:23:12.563' AS DateTime), 2, 173, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (42, N'Air is a/an', 1, CAST(N'2022-01-16T16:24:15.463' AS DateTime), 2, 641, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (43, N'Balloons are filled with', 1, CAST(N'2022-01-16T16:25:22.233' AS DateTime), 2, 2594, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (44, N'Which of the following does not contain a coinage metal', 1, CAST(N'2022-01-16T16:26:38.380' AS DateTime), 2, 3120, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (45, N'Which metal pollute the air of a big city?', 1, CAST(N'2022-01-16T16:28:13.303' AS DateTime), 2, 1396, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (46, N'Bell metal is an alloy of', 1, CAST(N'2022-01-16T16:29:21.137' AS DateTime), 2, 2557, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (47, N'Which of the following is not an isotope of hydrogen?', 1, CAST(N'2022-01-16T16:30:30.073' AS DateTime), 2, 5540, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (48, N'Amalgams are', 1, CAST(N'2022-01-16T16:31:33.677' AS DateTime), 2, 6236, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (49, N'Which of the following is the lightest metal?', 1, CAST(N'2022-01-16T16:32:37.133' AS DateTime), 2, 6043, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (50, N'Which of the following metals remain in liquid for under normal conditions?', 1, CAST(N'2022-01-16T16:33:47.963' AS DateTime), 2, 1360, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (51, N'Potassium Permanganate is used for purifying drinking water, because', 1, CAST(N'2022-01-16T16:35:10.570' AS DateTime), 2, 5192, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (52, N'Which of the following is an element?', 1, CAST(N'2022-01-16T16:36:13.720' AS DateTime), 2, 4299, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (53, N'The main constituents of pearls are', 1, CAST(N'2022-01-16T16:37:32.393' AS DateTime), 2, 498, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (54, N'Water is a good solvent of ionic salts because', 1, CAST(N'2022-01-16T16:38:37.370' AS DateTime), 2, 4939, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (55, N'Permanent hardness of water can be removed by adding', 1, CAST(N'2022-01-16T16:40:19.137' AS DateTime), 2, 4144, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (56, N'Which of the following was to be discovered first in the chromospheres of the sun?', 1, CAST(N'2022-01-16T16:42:32.783' AS DateTime), 2, 3831, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (57, N'Which of the following is in liquid form at room temperature?', 1, CAST(N'2022-01-16T16:43:46.103' AS DateTime), 2, 8142, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (58, N'The chemical (ethyl mercaptan) added to the otherwise odourless LPG cooking gas for imparting a detectable smell to the gas is a compound of', 1, CAST(N'2022-01-16T16:45:03.563' AS DateTime), 2, 8869, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (59, N'Among the various allotropes of carbon,', 1, CAST(N'2022-01-16T16:46:19.643' AS DateTime), 2, 4093, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (60, N'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 1, CAST(N'2022-01-16T16:47:37.163' AS DateTime), 2, 4624, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (61, N'भारत में राष्ट्रीय आय का आकलन सबसे पहले किसने किया था ?', 1, CAST(N'2022-01-16T17:05:41.360' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (62, N' किसी देश का आर्थिक विकास किस पर निर्भर है ?', 1, CAST(N'2022-01-16T17:07:37.140' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (63, N'डब्ल्यू. टी. ओ. का मुख्यालय कहाँ है ?', 1, CAST(N'2022-01-16T17:08:58.113' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (64, N'मुद्रा-आपूर्ति किसके द्वारा नियंत्रित की जाती है ?', 1, CAST(N'2022-01-16T17:09:52.233' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (65, N'भारत में सबसे ऊँचा जलप्रताप कौन-सा है ?', 1, CAST(N'2022-01-16T17:10:57.460' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (66, N'जूट-उत्पादन में सबसे प्रचुर प्रदेश कौन-सा है ', 1, CAST(N'2022-01-16T17:12:05.213' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (67, N' निम्नलिखित में से कौन-से देश पाल्क स्ट्रेट से जुड़े हुए हैं ?', 1, CAST(N'2022-01-16T17:13:21.093' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (68, N'भारत में किस राज्य को चावल का कटोरा कहा जाता है ?', 1, CAST(N'2022-01-16T17:14:36.697' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (69, N'पहली बार परमाणु बेम कहाँ फेंका गया था ?', 1, CAST(N'2022-01-16T17:15:37.610' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (70, N'ओजोन परत कहाँ पाई जाती है ?', 1, CAST(N'2022-01-16T17:16:50.380' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (71, N' महात्मा गाँधी का राजनीतिक गुरु कौन था ?', 1, CAST(N'2022-01-16T17:17:55.437' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (72, N'डेसिबेल शब्द किससे संबंधित है ?', 1, CAST(N'2022-01-16T17:19:00.100' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (73, N' अंग महाजनपद की राजधानी कहाँ थी ?', 1, CAST(N'2022-01-16T17:20:03.743' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (74, N' शांत घाटी किस राज्य में स्थित है ?', 1, CAST(N'2022-01-16T17:21:09.390' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (75, N'सुनामी का मुख्य कारण क्या है ?', 1, CAST(N'2022-01-16T17:22:14.443' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (76, N'मानव विकास सूचकांक किसने विकसित किया था ?', 1, CAST(N'2022-01-16T17:23:25.937' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (77, N' भारत में न्यूनतम मजदूरी अधिनियम किस वर्ष में पहली बार स्वीकृत हुआ था ?', 1, CAST(N'2022-01-16T17:24:50.227' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (78, N'इंसुलिन का आविष्कार किसने किया ?', 1, CAST(N'2022-01-16T17:25:51.833' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (79, N'अमरीका की खोज किसने की ?', 1, CAST(N'2022-01-16T17:26:56.030' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (80, N' नासिक किस नदी के किनारे स्थित है ?', 1, CAST(N'2022-01-16T17:27:48.667' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (81, N'पेनिसिलिन किससे प्राप्त की जाती है ?', 1, CAST(N'2022-01-16T17:28:45.920' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (82, N' पित्त का स्त्रोत क्या है ?', 1, CAST(N'2022-01-16T17:29:38.200' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (83, N'निम्नलिखित में कौन-सा प्रक्षेपास्त्र भूमि से वायु में जाने वाला प्रक्षेपास्त्र है ?', 1, CAST(N'2022-01-16T17:30:42.180' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (84, N' किस देश में बिक्रम सम्बट आधिकारिक कैलेंडर है ?', 1, CAST(N'2022-01-16T17:31:49.793' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (85, N'गाँधीजी द्वारा सन् 1933 तक सम्पादित समाचार-पत्र का नाम क्या था ?', 1, CAST(N'2022-01-16T17:33:02.740' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (86, N'भारत सेवक समाज'' की स्थापना किसने की थी ?', 1, CAST(N'2022-01-16T17:34:06.763' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (87, N'अंग्रेजों द्वारा निम्नलिखित में से किस क्रांतिकारी को फाँसी की सजा दी गई थी ?', 1, CAST(N'2022-01-16T17:35:20.870' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (88, N'मोती मस्जिद'' निम्नलिखित में से किस नगर में स्थित है ?', 1, CAST(N'2022-01-16T17:36:36.717' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (89, N'निम्नलिखित में से विटामिन ''ई'' का अच्छा स्त्रोत कौन सा है ?', 1, CAST(N'2022-01-16T17:37:46.940' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (90, N'मानव-शरीर में कुल कितनी हड्डियाँ होती हैं ?

', 1, CAST(N'2022-01-16T17:38:45.207' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (91, N'उस विटामिन का नाम बताइए जो किसी भी माँसाहारी, भोजन में नहीं मिलता ?', 1, CAST(N'2022-01-16T17:39:47.880' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (92, N'मानव - शरीर का सबसे बड़ा अंग कौन सा है ?', 1, CAST(N'2022-01-16T17:40:48.620' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (93, N' वाहनों के अग्र दीपों (हेड लाइटों) में किस प्रकार के दर्पण का इस्तेमाल होता है ?', 1, CAST(N'2022-01-16T17:42:16.000' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (94, N'किसी तुल्यकाली उपग्रह की, पृथ्वी की सतह से ऊँचाइ लगभग कितनी होती है ?', 1, CAST(N'2022-01-16T17:43:21.070' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (95, N'किसी बिजली की इस्तरी को गर्म करने के लिए किस धातु का प्रयोग किया जाता है ?

', 1, CAST(N'2022-01-16T17:44:28.973' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (96, N'र्य के सबसे निकट कौनसा ग्रह है ?', 1, CAST(N'2022-01-16T17:45:25.790' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (97, N'अर्जुन पुरस्कार किस क्षेत्र में उत्कृष्टता के लिए प्रदान किए जाते हैं ?', 1, CAST(N'2022-01-18T20:32:05.460' AS DateTime), 5, 1254, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (98, N'D. C. M ट्रॉफी का सम्बन्ध किस खेल से है ?', 1, CAST(N'2022-01-18T20:33:13.483' AS DateTime), 5, 7103, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (99, N'माइकल फेल्प्स किस खेल से सम्बन्धित हैं ?', 1, CAST(N'2022-01-18T20:34:36.270' AS DateTime), 5, 9648, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (100, N' अर्जुन पुरस्कार कब प्रारम्भ हुआ ?', 1, CAST(N'2022-01-18T20:35:32.723' AS DateTime), 5, 1660, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (101, N'सर डॉन ब्रैडमैन ने किस खेल में अंतर्राष्ट्रीय ख्याति प्राप्त की है ?', 1, CAST(N'2022-01-18T20:36:34.200' AS DateTime), 5, 4366, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (102, N'भारत के किस निशानेबाज ने लंदन ओलम्पिक खेलों (2012) में रजत पदक प्राप्त किया ?', 1, CAST(N'2022-01-18T20:37:52.787' AS DateTime), 5, 3254, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (103, N'स्पर्श रेखा किस खेल से सम्बन्धित हैं ?', 1, CAST(N'2022-01-18T20:39:01.090' AS DateTime), 5, 4588, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (104, N'थ्री सेकण्डस् किस खेल से सम्बन्धित हैं ?', 1, CAST(N'2022-01-18T20:40:16.670' AS DateTime), 5, 247, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (105, N'ईरानी कप का सम्बन्ध निम्नलिखित में से किस खेल से है ?', 1, CAST(N'2022-01-18T20:41:39.173' AS DateTime), 5, 1803, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (106, N'अपर कट किस खेल से सम्बन्धित हैं ?', 1, CAST(N'2022-01-18T20:42:59.087' AS DateTime), 5, 3267, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (107, N'खो-खो में कितनी क्रॉस लेन्स होती है ?', 1, CAST(N'2022-01-18T20:44:06.870' AS DateTime), 5, 3913, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (108, N' हॉकी का जादूगर किसे कहते हैं ?', 1, CAST(N'2022-01-18T20:45:14.503' AS DateTime), 5, 8810, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (109, N'निम्नलिखित में से कौन हॉकी का खिलाड़ी नहीं है ?', 1, CAST(N'2022-01-18T20:46:25.983' AS DateTime), 5, 5844, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (110, N'किस खिलाड़ी को वर्ष 2012 का राजीव गांधी खेलरत्न सम्मान प्रदान किया गया है ?', 1, CAST(N'2022-01-18T20:47:34.450' AS DateTime), 5, 295, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (111, N'अन्तर्राष्ट्रीय ओलम्पिक समिति के अध्यक्ष कौन हैं ?', 1, CAST(N'2022-01-18T20:48:35.673' AS DateTime), 5, 4796, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (112, N'कनाडा का राष्ट्रीय खेल क्या है ?', 1, CAST(N'2022-01-18T20:49:41.553' AS DateTime), 5, 5663, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (113, N'संयुक्त राज्य अमेरिका का राष्ट्रीय खेल क्या है ?', 1, CAST(N'2022-01-18T20:50:41.877' AS DateTime), 5, 5781, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (114, N'भारत का राष्ट्रीय खेल क्या है ?', 1, CAST(N'2022-01-18T20:51:35.330' AS DateTime), 5, 9734, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (115, N'जापान का राष्ट्रीय खेल क्या है ?', 1, CAST(N'2022-01-18T20:52:29.347' AS DateTime), 5, 9812, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (116, N'पोलो खेल का प्रचलन भारत के किस राज्य में हुआ ?', 1, CAST(N'2022-01-18T20:53:39.010' AS DateTime), 5, 2866, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (117, N'भारत में पोलो खेल का प्रचलन किसने प्रारम्भ किया ?', 1, CAST(N'2022-01-18T20:54:55.113' AS DateTime), 5, 1860, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (118, N'कबड्डी खेल का जन्मदाता देश किसे कहा जाता है ?', 1, CAST(N'2022-01-18T20:56:05.117' AS DateTime), 5, 8987, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (119, N'शतरंज खेल का जन्मदाता देश किसे कहा जाता है ?', 1, CAST(N'2022-01-18T20:57:08.857' AS DateTime), 5, 5089, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (120, N'क्रिकेट खेल का जन्मदाता देश किसे कहा जाता है ?', 1, CAST(N'2022-01-18T20:58:02.133' AS DateTime), 5, 5920, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (121, N' क्रिकेट के आधुनिक संस्करण '' सुपरमैक्स क्रिकेट '' की शुरुआत कहाँ हुई है ?', 1, CAST(N'2022-01-18T20:59:04.450' AS DateTime), 5, 3605, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (122, N'वाटर पोलो में एक पक्ष में खिलाडियों की संख्या कितनी होती है ?', 1, CAST(N'2022-01-18T20:59:48.093' AS DateTime), 5, 1795, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (123, N'पोलो में प्रत्येक पक्ष में खिलाडियों की संख्या कितनी होती है ?', 1, CAST(N'2022-01-18T21:01:21.057' AS DateTime), 5, 8371, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (124, N'बेसबॉल में प्रत्येक पक्ष में खिलाडियों की संख्या कितनी होती है ?', 1, CAST(N'2022-01-18T21:02:06.317' AS DateTime), 5, 5734, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (125, N'वालीबॉल की प्रत्येक टीम में खिलाडियों की संख्या कितनी होती है ?', 1, CAST(N'2022-01-18T21:02:56.037' AS DateTime), 5, 4199, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (126, N'बास्केटबॉल के प्रत्येक पक्ष में खिलाडियों की संख्या कितनी होती है ?', 1, CAST(N'2022-01-18T21:03:36.833' AS DateTime), 5, 6563, NULL)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId], [sorting], [youtube]) VALUES (127, N'दादा के नाम से किसे जाना जाता है ?', 1, CAST(N'2022-01-18T21:04:58.620' AS DateTime), 5, 6355, NULL)
GO
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionType] ON 
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (1, N'UGC NET', 1, CAST(N'2021-04-07T08:01:23.940' AS DateTime), NULL)
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (2, N'Blood Releation', 1, CAST(N'2021-12-12T09:08:44.000' AS DateTime), NULL)
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (3, N'SSC CGL', 1, CAST(N'2021-12-12T09:08:44.000' AS DateTime), NULL)
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (4, N'UPSC', 1, CAST(N'2021-12-12T09:08:44.003' AS DateTime), NULL)
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (5, N'GK India', 1, CAST(N'2021-12-12T09:08:44.003' AS DateTime), NULL)
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (6, N'Cricket', 1, CAST(N'2022-01-23T13:18:15.937' AS DateTime), N'Sports')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (7, N'Chess', 1, CAST(N'2022-01-23T13:18:48.677' AS DateTime), N'Sports')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (8, N'Baseball', 1, CAST(N'2022-01-23T13:19:17.880' AS DateTime), N'Sports')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (9, N'Badminton', 1, CAST(N'2022-01-23T13:19:54.413' AS DateTime), N'Sports')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (10, N'Basketball', 1, CAST(N'2022-01-23T13:20:30.113' AS DateTime), N'Sports')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (11, N'Boxing', 1, CAST(N'2022-01-23T13:21:06.560' AS DateTime), N'Sports')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (12, N'Indian Economy', 1, CAST(N'2022-01-23T13:24:34.190' AS DateTime), N'Economics')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (13, N'Indian History', 1, CAST(N'2022-01-23T13:26:38.193' AS DateTime), N'History')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (14, N'Indian Political', 1, CAST(N'2022-01-23T13:27:07.940' AS DateTime), N'Political')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (15, N'Blood Releation', 1, CAST(N'2022-01-23T13:28:09.423' AS DateTime), N'Reasoning')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (16, N'Indian Agriculture', 1, CAST(N'2022-01-23T13:28:43.930' AS DateTime), N'Agriculture')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (17, N'Environment, Ecology & Biodiversity', 1, CAST(N'2022-01-23T13:30:26.900' AS DateTime), N'EVS')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (18, N'Set 1', 1, CAST(N'2022-01-23T13:31:02.700' AS DateTime), N'Current')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (19, N'Average - Aptitude ', 1, CAST(N'2022-01-23T13:32:06.837' AS DateTime), N'Math')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (20, N'Set 1 - Aptitude ', 1, CAST(N'2022-01-23T13:33:14.207' AS DateTime), N'Hindi')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (21, N'Indian - Geography ', 1, CAST(N'2022-01-23T13:33:54.717' AS DateTime), N'Geography')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (22, N'Biology', 1, CAST(N'2022-01-23T13:34:29.960' AS DateTime), N'Science')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (23, N'Basic', 1, CAST(N'2022-01-23T13:35:12.043' AS DateTime), N'Computer')
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate], [subjectCat]) VALUES (24, N'Teaching Aptitude-Set 1', 1, CAST(N'2022-01-23T13:35:51.287' AS DateTime), N'Teaching Aptitude')
GO
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
GO
SET IDENTITY_INSERT [dbo].[TbL_User] ON 
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone], [roleId], [CreatedBy], [UpdatedBy]) VALUES (1, N'nitin', N'nitin', N'nitinsaxenahapur@gmail.com', N'5P0lKecWmzc+8qMnEngw8Q==', N'a30B9swlu6aq+iiJWnOohw==', N'yyGbHySVlt6vCj8kRw5BVg==', 1, 1, CAST(N'2021-04-03T19:28:37.537' AS DateTime), CAST(N'2021-04-03T19:28:37.537' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone], [roleId], [CreatedBy], [UpdatedBy]) VALUES (2, N'testw', N'testw', N'infoindia78@gmail.com', N'5kZymHaFHuRbJvtffgKadQ==', N'0Gh6naCQneifGmpwwustIw==', N'i+U9N0UXkLAJNDqR2jAd0g==', 1, 1, CAST(N'2021-04-10T16:37:42.873' AS DateTime), CAST(N'2021-04-10T16:37:42.873' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone], [roleId], [CreatedBy], [UpdatedBy]) VALUES (3, N'Neha', N'Neha', N'neha@gmail.com', N'DNaJc908Nt+pNbwlL5bBRQ==', N'71Yf8Jyo9Enmi/55zME41A==', N'71Yf8Jyo9Enmi/55zME41A==', 1, 1, CAST(N'2021-04-10T19:01:38.573' AS DateTime), CAST(N'2021-04-10T19:01:38.573' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone], [roleId], [CreatedBy], [UpdatedBy]) VALUES (4, N'vishal', N'vishal', N'infoindia178@gmail.com', N'WJHRCs2JsP0F20Q8moQeAQ==', N'RV3GuHHGbTSC6ENVl/j97w==', N'RV3GuHHGbTSC6ENVl/j97w==', 1, 1, CAST(N'2021-12-11T18:01:41.643' AS DateTime), CAST(N'2021-12-11T18:01:41.643' AS DateTime), 8755673969, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TbL_User] OFF
GO
SET IDENTITY_INSERT [dbo].[TestSeries] ON 
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1, N'ब्लड रिलेशन टेस्ट टाइप 1', 1, CAST(N'2021-12-18T18:52:50.547' AS DateTime), 0, N'ब्लड रिलेशन टेस्ट टाइप 1', 50, 2, 4, 2)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (2, N'General Science', 1, CAST(N'2022-01-16T15:01:01.980' AS DateTime), 0, N'General Science', 60, 2, 30, 5)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (4, N'SSC General Awareness', 1, CAST(N'2022-01-16T17:03:50.307' AS DateTime), 0, N'SSC General Awareness', 60, 2, 36, 3)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (5, N'Sport GK', 1, CAST(N'2022-01-18T20:30:34.820' AS DateTime), 0, N'Sport GK', 60, 2, 31, 5)
GO
SET IDENTITY_INSERT [dbo].[TestSeries] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT ((0)) FOR [isDefault]
GO
/****** Object:  StoredProcedure [dbo].[get_Question_list]    Script Date: 19-08-2022 18:33:30 ******/
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

select id,SeriesName PName,isActive from TestSeries where QuestionType=@paperType and IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[save_Product]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[save_Product]   
(  
@Id int ,  
@Name nvarchar(100),  
@Description nvarchar(550) null,  
@ImageUrl nvarchar(300)  null,  
@Price decimal (18,2) null,  
@userId int ,  
@Quantity int ,
@isActive bit  
  
)  
as   
  
BEGIN  
if exists (select top 1* from Product where Id =@Id)  
BEGIN  
  
Update Product  
Set NAme =@Name,  
Description=@Description,  
ImageUrl=@ImageUrl,  
Price=@Price,  
UpdatedBy=@userId,  
UpdatedDate=GETDATE(),  
isActive=@isActive  ,
Quantity=@Quantity
Where Id=@Id  
  
END  
ELSE  
BEGIN  
  
insert into Product ( NAme ,  
Description,  
ImageUrl,  
Price,  
CreatedDate,  
CreatedBy,isActive,Quantity) values(@Name,@Description,@ImageUrl,@Price,GETDATE(),@userId,1,@Quantity)  
END  
  
END

GO
/****** Object:  StoredProcedure [dbo].[save_ProductCtaegory]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[save_ProductCtaegory]   
(  
@Id int ,  
@Name nvarchar(100),  
@Description nvarchar(550) null,  
 
@userId int ,  

@isActive bit  
  
)  
as   
  
BEGIN  
if exists (select top 1* from ProductCategory where Id =@Id)  
BEGIN  
  
Update ProductCategory  
Set NAme =@Name,  
Description=@Description, 
ModifyBy=@userId,  
ModifyDate=GETDATE(),  
isActive=@isActive  
Where Id=@Id  
  
END  
ELSE  
BEGIN  
  
insert into ProductCategory ( NAme ,  
Description,  
 
CreatedDate,  
CreatedBy,isActive,ModifyDate,ModifyBy) values(@Name,@Description,GETDATE(),@userId,1,GETDATE(),@userId)  
END  
  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_feedback]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[sp_feedback]
(

@Password nvarchar(max),

@Userid int,
@status INT OUTPUT

)
as 
BEGIN
insert into feedback(FeedBack,UserId,Createdate) values(@Password,@Userid ,GETDATE())
select @status=1
END







GO
/****** Object:  StoredProcedure [dbo].[sp_getDashBardDetails]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getPaperSeries]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getPaperTypeList]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getPaperTypeList]  
(@UserId varchar(200) null   
)  
as  
BEGIN  
if(@UserId is not null)
BEGIN
select Id as KEYId,Value as Text from QuestionType where IsActive=1 
and subjectcat=@UserId
order by CreatedDate desc  
END
else 
BEGIN
select Id as KEYId,Value as Text from QuestionType where IsActive=1 

order by CreatedDate desc  
END
ENd

GO
/****** Object:  StoredProcedure [dbo].[sp_getProductcategoryList]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_getProductcategoryList]
@UserId int ,
@skipValue int ,
@GetValue int 
as
BEGIN

select Id,Name,pc.isActive,tl.UserName,pc.CreatedDate from ProductCategory pc
left join TbL_User tl on tl.UserId=pc.CreatedBy
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getProductDatabyId]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
-- exec  [sp_getLatestJoined] 1, 'gh'  
CREATE proc [dbo].[sp_getProductDatabyId]  
(  
@id int 
)  
as  
BEGIN   
select Name,Description,ImageUrl,Price,Quantity,isActive,id,category from Product where id=@id

select Id as KEYId,Name as Text from ProductCategory where IsActive=1 

order by CreatedDate desc  
END  
  

GO
/****** Object:  StoredProcedure [dbo].[sp_getQuestionTypeList]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getTestSeries]    Script Date: 19-08-2022 18:33:30 ******/
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
where 
--t.Id not in (select TestSeriesId from  AttemptQuiz where Userid=@UserId) and 
t.IsActive=1  
END  
END  
  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_getTestSeriesById]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
    
-- exec  [sp_getTestSeriesById] 1, 1,10,2    
CREATE proc [dbo].[sp_getTestSeriesById]    
(
@UserId int ,    
@skipValue int ,    
@GetValue int,    
@testId int    
)    
as    
BEGIN Transaction 
BEGIN TRY     

update Question  
set sorting =abs(checksum(NewId()) % 10000)  
where testSerieId=@testId  


select ts.SeriesName,q.QuestinName ,q.qId as Id,isnull(ts.Time,50) as Time,    
(select id,Name,isAnswer,QuestionId from [Option] where QuestionId=q.Qid FOR JSON AUTO) as Options    
from TestSeries ts    
left join Question q on q.testSerieId=ts.Id    
where ts.id=@testId    
order  by sorting desc
if not exists(select top 1 * from AttemptQuiz where UserId=@UserId and TestSeriesId=@testId)    
BEGIN    
insert into AttemptQuiz(TestSeriesId,AttemtDate,isCompleted,Scored,UserId) values(@testId,getDAte(),1,10,@UserId)    
END    

Commit Transaction 
END TRY

  BEGIN  CATCH

  -- INSERT INTO dbo.DB_Errors
  --  VALUES
  --(SUSER_SNAME(),
  -- ERROR_NUMBER(),
  -- ERROR_STATE(),
  -- ERROR_SEVERITY(),
  -- ERROR_LINE(),
  -- ERROR_PROCEDURE(),
  -- ERROR_MESSAGE(),
  -- GETDATE());
 
--insert into Error_Log(sp,createdDate) values('test',getDAte())
ROllBAck Transaction 
  END CATCH
      
    
    
    
    
    
GO
/****** Object:  StoredProcedure [dbo].[sp_getUserList]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
-- exec  [sp_getLatestJoined] 1, 'gh'  
CREATE proc [dbo].[sp_getUserList]  
(  
@UserId int ,  
@skipValue int ,  
@GetValue int,  
@statusType int  
)  
as  
BEGIN   

select  (FirstName +' ' +Lastname) as username ,UserName as email ,tblu.IsActive,Phone,rl.RoleName,rl.id as roleId,UserId,
tblu.CreatedDate,isnull((select top 1 username  from TbL_User where UserId=tblu.CreatedBy),'')  as CreatedBy ,tblu.UpdateDate,tblu.UpdatedBy from TbL_User tblu
left join  [dbo].[Role] rl on tblu.Roleid=rl.Id
 select RoleName ,isActive,id from [dbo].[Role]  where isActive=1 order by rolename asc

END  

GO
/****** Object:  StoredProcedure [dbo].[sp_PaperSeries]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_PrductList]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
-- exec  [sp_getLatestJoined] 1, 'gh'  
CREATE proc [dbo].[sp_PrductList]  
(  
@UserId int ,  
@skipValue int ,  
@GetValue int,  
@statusType int  
)  
as  
BEGIN   
if(@statusType=0)
BEGIN
select Name,Description,ImageUrl,Price,Quantity,isActive,id from Product  
 select Name ,isdefault,id from productCategory  where isActive=1 order by Name asc
END
ELSE
BEGIN
select Name,Description,ImageUrl,Price,Quantity,isActive,id,category from Product  where Category=@statusType
--where category =(select top 1 id  from ProductCategory where isdefault=1)
 select Name ,isdefault,id from productCategory  where isActive=1 order by Name asc
 END
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_publish]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Question]    Script Date: 19-08-2022 18:33:30 ******/
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
With([option] nvarchar(max),answer bit)  
  
  
--select @QuestionNo  
END  
  
  
  
  
  
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_saveUser]    Script Date: 19-08-2022 18:33:30 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_testSeries]    Script Date: 19-08-2022 18:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_testSeries]
(
@testSeries nvarchar(max) null,

@time int ,
@UserId int ,
@description nvarchar(max) null,
@questionType int,
@Status int OUTPUT
 )
 As 
 BEGIN
 insert into TestSeries (SeriesName,IsActive,CreatedDate,Org,Subject,Time,UserdId,totalQ,QuestionType) values(
 @testSeries,1,GETDATE(),0,@description,@time,@UserId,0,@questionType)

 select 1
 END


 --select * from TestSeries
GO
/****** Object:  StoredProcedure [dbo].[sp_updatePassword]    Script Date: 19-08-2022 18:33:30 ******/
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
