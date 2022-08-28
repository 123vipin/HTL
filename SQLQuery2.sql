USE [master]
GO
/****** Object:  Database [OnlineQuiz]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[AttemptQuiz]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[config]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[Demo]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[feedback]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[MasterQuestionPdf]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 28-08-2022 13:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Menu] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[isActive] [bit] NULL,
	[urlValue] [nvarchar](500) NULL,
	[iclass] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[PaperType]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[PdfSeries]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[QuestionType]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 28-08-2022 13:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMenuPermissin]    Script Date: 28-08-2022 13:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMenuPermissin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Menu] [nvarchar](200) NULL,
	[RoleId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbL_User]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  Table [dbo].[TestSeries]    Script Date: 28-08-2022 13:45:37 ******/
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
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT ((0)) FOR [isDefault]
GO
/****** Object:  StoredProcedure [dbo].[get_Question_list]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[save_Product]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[save_ProductCtaegory]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_feedback]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getDashBardDetails]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getPaperSeries]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getPaperTypeList]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getProductcategoryList]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getProductDatabyId]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getQuestionTypeList]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getRoleById]    Script Date: 28-08-2022 13:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
-- exec  [sp_getLatestJoined] 1, 'gh'  
CREATE proc [dbo].[sp_getRoleById]  
(  
@roleId int ,  
@skipValue int ,  
@GetValue int,  
@statusType int  
)  
as  
BEGIN   
if(@roleId=0)
BEGIN
select menu,id,0 as roleId from Menu where isActive=1
 select m.menu, isnull(RoleId,0) as RoleId,m.id as id from Menu m 
 left join RoleMenuPermissin  rm on rm.RoleId=m.Id
 where rm.RoleId=@roleId and m.isActive=1
select RoleName ,isActive,id from [dbo].[Role]  where id=@roleId
 END
 ELSE
 BEGIN
 select menu,id,0 as roleId from Menu where isActive=1
 select m.menu, isnull(RoleId,0) as RoleId,m.id as id from Menu m 
 left join RoleMenuPermissin  rm on rm.RoleId=m.Id
 where rm.RoleId=@roleId and m.isActive=1

 select RoleName ,isActive,id from [dbo].[Role]  where id=@roleId



 END
END  


GO
/****** Object:  StoredProcedure [dbo].[sp_getRoleList]    Script Date: 28-08-2022 13:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
-- exec  [sp_getLatestJoined] 1, 'gh'  
Create proc [dbo].[sp_getRoleList]  
(  
@UserId int ,  
@skipValue int ,  
@GetValue int,  
@statusType int  
)  
as  
BEGIN   

 select RoleName ,isActive,id from [dbo].[Role]  order by rolename asc
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_getsideBarMenu]    Script Date: 28-08-2022 13:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
-- exec  [sp_getsideBarMenu] 2  
CREATE proc [dbo].[sp_getsideBarMenu]  
(  
@UserId int  
 
)  
as  
BEGIN   
Declare @roleid int
select top 1  @roleid=roleId from TbL_User where UserId=@userId
select m.Menu ,m.id ,m.urlValue,m.iclass  from RoleMenuPermissin rm
left join Menu m on m.id=rm.menu
where rm.RoleId=@roleid
END  



GO
/****** Object:  StoredProcedure [dbo].[sp_getTestSeries]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getTestSeriesById]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getUserList]    Script Date: 28-08-2022 13:45:37 ******/
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
if(@statusType=0)
BEGIN
select  (FirstName +' ' +Lastname) as username ,UserName as email ,tblu.IsActive,Phone,isnull(rl.RoleName,'N/A')  as RoleName,isnull(rl.id,0) as roleId,UserId,
tblu.CreatedDate,isnull((select top 1 username  from TbL_User where UserId=tblu.CreatedBy),'')  as CreatedBy ,tblu.UpdateDate,tblu.UpdatedBy from TbL_User tblu
left join  [dbo].[Role] rl on tblu.Roleid=rl.Id
 select RoleName ,isActive,id from [dbo].[Role]  where isActive=1 order by rolename asc
 END
 BEGIN

 select  (FirstName +' ' +Lastname) as username ,UserName as email ,tblu.IsActive,Phone,isnull(rl.RoleName,'N/A')  as RoleName,isnull(rl.id,0) as roleId,UserId,
tblu.CreatedDate,isnull((select top 1 username  from TbL_User where UserId=tblu.CreatedBy),'')  as CreatedBy ,tblu.UpdateDate,tblu.UpdatedBy from TbL_User tblu
left join  [dbo].[Role] rl on tblu.Roleid=rl.Id
where tblu.UserId=@UserId
 select RoleName ,isActive,id from [dbo].[Role]  where isActive=1 order by rolename asc

 END
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_PaperSeries]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_PrductList]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_publish]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Question]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_saveRole]    Script Date: 28-08-2022 13:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_saveRole]
(
@rolename nvarchar(300),
@roleId int null,
@menuid nvarchar(max),
@UserId int,
@status INT OUTPUT

)
as 
BEGIN
Declare @profileId nvarchar(max)
if(@roleId=0)
BEGIN
if exists(select top 1 * from Role where RoleName=@rolename)
BEGIN
select @status=1
return ;
END
ELSE
BEGIN
 set @profileId= 'QT' + REPLACE(STR(isnull((select top 1 Id from  Role order by Id desc ),1),5),' ', '0') 
insert into Role(RoleName,IsActive,CreatedDate,CreatedBy) 
values(@rolename,1,getdate(),@UserId)
set @roleId=@@IDENTITY
insert into RoleMenuPermissin(Menu,RoleId,CreatedBy,CreatedDate,isActive)
select TRY_CAST(value AS INT),@roleId,@UserId,GETDATE(),1
FROM   STRING_SPLIT(@menuid,',') 
select @status=2
return ;
END
END

ELSE
BEGIN
select @status=2

update Role
set RoleName=@rolename,

UpdatedDate=GETUTCDATE(),
UpdateBy=@UserId
where Id=@RoleId
select @status=2
END
delete from RoleMenuPermissin where RoleId=@roleId
insert into RoleMenuPermissin(Menu,RoleId,CreatedBy,CreatedDate,isActive)
select TRY_CAST(value AS INT),@roleId,@UserId,GETDATE(),1
FROM   STRING_SPLIT(@menuid,',') 
END







GO
/****** Object:  StoredProcedure [dbo].[sp_saveUser]    Script Date: 28-08-2022 13:45:37 ******/
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
@RoleId int ,
@UserId int,
@status INT OUTPUT

)
as 
BEGIN
Declare @profileId nvarchar(max)
if(@UserId=0)
BEGIN
if exists(select top 1 * from TbL_User where UserName=@Email)
BEGIN
select @status=1
return ;
END
ELSE
BEGIN
 set @profileId= 'QT' + REPLACE(STR(isnull((select top 1 UserId from  TbL_User order by UserId desc ),1),5),' ', '0') 
insert into TbL_User(FirstName,UserName,Password,Salt,EmailSalt,IsActive,Status,CreatedDate,UpdateDate,Phone,roleId,CreatedBy,UpdatedBy) 
values(@FirstName,LOWER(@Email),@Password,@PassWordSalt,@PassWordSalt,1,1,getdate(),GETdATE(),@Phone,@RoleId,@UserId,@UserId)
select @status=2
return ;
END
END

ELSE
BEGIN
select @status=2

update TbL_User
set Firstname=@FirstName,
UserName=LOWER(@Email),
Phone=@Phone,
roleId=@RoleId,
UpdateDate=GETUTCDATE(),
UpdatedBy=@UserId
where Userid=@UserId
select @status=2
END
END







GO
/****** Object:  StoredProcedure [dbo].[sp_testSeries]    Script Date: 28-08-2022 13:45:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_updatePassword]    Script Date: 28-08-2022 13:45:37 ******/
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
