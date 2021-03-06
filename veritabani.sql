USE [DbServeySystem]
GO
/****** Object:  Table [dbo].[TblAnswerLine]    Script Date: 25.05.2020 00:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAnswerLine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnswerId] [int] NULL,
	[Question] [nvarchar](300) NULL,
	[Answer] [nvarchar](10) NULL,
	[Image] [nvarchar](150) NULL,
 CONSTRAINT [PK_TblAnswerLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblAnswers]    Script Date: 25.05.2020 00:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAnswers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherCode] [nvarchar](10) NULL,
	[TeacherName] [nvarchar](50) NULL,
	[UserCode] [nvarchar](50) NULL,
	[Score] [nvarchar](10) NULL,
	[IsComplete] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblAnswers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblQuestions]    Script Date: 25.05.2020 00:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblQuestions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](300) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTeacher]    Script Date: 25.05.2020 00:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Code] [nvarchar](10) NULL,
	[Password] [nvarchar](10) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](50) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_TblTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblAnswerLine] ON 

INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (7, 6, N'eğitmen mufredata uygun mu anlatıyor??', N'Hayır', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (8, 6, N'eğitmen konusunda basarılı mı ?', N'Hayır', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (9, 7, N'eğitmen mufredata uygun mu anlatıyor??', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (10, 7, N'eğitmen konusunda basarılı mı ?', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (11, 8, N'eğitmen mufredata uygun mu anlatıyor??', N'Hayır', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (12, 8, N'eğitmen konusunda basarılı mı ?', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (13, 9, N'eğitmen mufredata uygun mu anlatıyor??', N'Hayır', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (14, 9, N'eğitmen konusunda basarılı mı ?', N'Hayır', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (15, 10, N'eğitmen mufredata uygun mu anlatıyor??', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (16, 10, N'eğitmen konusunda basarılı mı ?', N'Hayır', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (17, 11, N'eğitmen mufredata uygun mu anlatıyor??', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (18, 11, N'eğitmen konusunda basarılı mı ?', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (19, 10, N'Eğitmen gruba hakimdi.', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (20, 10, N'Eğitmen konuya ilgi topladı.', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (21, 10, N'Eğitmenin verdiği mesajlar açık ve anlaşılırdı.', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (22, 10, N'Eğitmenin sunum şekli akıcıydı.', N'Hayır', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (23, 9, N'Eğitmen gruba hakimdi.', N'Hayır', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (24, 9, N'Eğitmen konuya ilgi topladı.', N'Evet', NULL)
INSERT [dbo].[TblAnswerLine] ([Id], [AnswerId], [Question], [Answer], [Image]) VALUES (25, 9, N'Eğitmenin verdiği mesajlar açık ve anlaşılırdı.', N'Evet', NULL)
SET IDENTITY_INSERT [dbo].[TblAnswerLine] OFF
SET IDENTITY_INSERT [dbo].[TblAnswers] ON 

INSERT [dbo].[TblAnswers] ([Id], [TeacherCode], [TeacherName], [UserCode], [Score], [IsComplete], [CreateDate], [CreateBy]) VALUES (6, N'61', N'61', N'123', N'0', 0, CAST(N'2020-05-24T13:43:49.427' AS DateTime), N'Zeynep')
INSERT [dbo].[TblAnswers] ([Id], [TeacherCode], [TeacherName], [UserCode], [Score], [IsComplete], [CreateDate], [CreateBy]) VALUES (7, N'37', N'37', N'123', N'100', 1, CAST(N'2020-05-24T14:08:45.153' AS DateTime), N'Zeynep')
INSERT [dbo].[TblAnswers] ([Id], [TeacherCode], [TeacherName], [UserCode], [Score], [IsComplete], [CreateDate], [CreateBy]) VALUES (8, N'123', N'123', N'37', N'50', 0, CAST(N'2020-05-24T15:02:16.923' AS DateTime), N'KübraYilmaz')
INSERT [dbo].[TblAnswers] ([Id], [TeacherCode], [TeacherName], [UserCode], [Score], [IsComplete], [CreateDate], [CreateBy]) VALUES (9, N'37', N'37', N'34', N'40', 0, CAST(N'2020-05-24T16:16:30.000' AS DateTime), N'Elif')
INSERT [dbo].[TblAnswers] ([Id], [TeacherCode], [TeacherName], [UserCode], [Score], [IsComplete], [CreateDate], [CreateBy]) VALUES (10, N'61', N'61', N'34', N'50', 0, CAST(N'2020-05-24T16:16:50.483' AS DateTime), N'Elif')
INSERT [dbo].[TblAnswers] ([Id], [TeacherCode], [TeacherName], [UserCode], [Score], [IsComplete], [CreateDate], [CreateBy]) VALUES (11, N'34', N'34', N'61', N'100', 1, CAST(N'2020-05-24T23:23:22.373' AS DateTime), N'AygünYılmaz')
SET IDENTITY_INSERT [dbo].[TblAnswers] OFF
SET IDENTITY_INSERT [dbo].[TblQuestions] ON 

INSERT [dbo].[TblQuestions] ([Id], [Question], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy]) VALUES (6, N'Eğitmen gruba hakimdi.', CAST(N'2020-05-24T23:56:54.137' AS DateTime), N'Elif', NULL, NULL)
INSERT [dbo].[TblQuestions] ([Id], [Question], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy]) VALUES (7, N'Eğitmen konuya ilgi topladı.', CAST(N'2020-05-24T23:57:06.900' AS DateTime), N'Elif', NULL, NULL)
INSERT [dbo].[TblQuestions] ([Id], [Question], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy]) VALUES (8, N'Eğitmenin verdiği mesajlar açık ve anlaşılırdı.', CAST(N'2020-05-24T23:57:34.327' AS DateTime), N'Elif', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblQuestions] OFF
SET IDENTITY_INSERT [dbo].[TblTeacher] ON 

INSERT [dbo].[TblTeacher] ([Id], [FullName], [Code], [Password], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [IsAdmin]) VALUES (2, N'KübraYilmaz', N'37', N'37', CAST(N'2020-05-23T10:51:02.480' AS DateTime), N'System', CAST(N'2020-05-25T00:00:27.310' AS DateTime), N'Elif', 1)
INSERT [dbo].[TblTeacher] ([Id], [FullName], [Code], [Password], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [IsAdmin]) VALUES (3, N'Zeynep', N'123', N'123', CAST(N'2020-05-23T15:49:01.080' AS DateTime), N'System', NULL, NULL, NULL)
INSERT [dbo].[TblTeacher] ([Id], [FullName], [Code], [Password], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [IsAdmin]) VALUES (4, N'AygünYılmaz', N'61', N'61', CAST(N'2020-05-23T20:10:20.537' AS DateTime), N'Zeynep', NULL, NULL, NULL)
INSERT [dbo].[TblTeacher] ([Id], [FullName], [Code], [Password], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [IsAdmin]) VALUES (5, N'Elif', N'34', N'34', CAST(N'2020-05-24T15:33:11.467' AS DateTime), N'Zeynep', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[TblTeacher] OFF
