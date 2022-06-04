USE [OnlineQuiz]
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
SET IDENTITY_INSERT [dbo].[AttemptQuiz] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 
GO
INSERT [dbo].[feedback] ([Id], [FeedBack], [UserId], [Createdate]) VALUES (1, N'gfghfghfgh ggfg', 2, CAST(N'2021-12-11T19:12:05.177' AS DateTime))
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
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4065, N'?????????? ??????', 0, 3018, 1, CAST(N'2021-12-12T10:51:09.500' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4066, N'??? ??? ???????? ??????', 0, 3018, 1, CAST(N'2021-12-12T10:51:09.500' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4067, N'??? ???? ??????', 1, 3018, 1, CAST(N'2021-12-12T10:51:09.500' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4068, N'?????? ??????', 0, 3018, 1, CAST(N'2021-12-12T10:51:09.500' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4069, N' प्रतिरक्षा उद्योग', 0, 3020, 1, CAST(N'2021-12-12T11:03:31.147' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4070, N' प्रतिरक्षा उद्योग', 0, 3020, 1, CAST(N'2021-12-12T11:03:31.147' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4071, N'लघु वाहन उद्योग', 1, 3020, 1, CAST(N'2021-12-12T11:03:31.147' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4072, N'मशीनरी उद्योग', 0, 3020, 1, CAST(N'2021-12-12T11:03:31.147' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4073, N' प्रतिरक्षा उद्योग', 0, 3019, 1, CAST(N'2021-12-12T11:03:31.160' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4074, N' प्रतिरक्षा उद्योग', 0, 3019, 1, CAST(N'2021-12-12T11:03:31.160' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4075, N'लघु वाहन उद्योग', 1, 3019, 1, CAST(N'2021-12-12T11:03:31.160' AS DateTime))
GO
INSERT [dbo].[Option] ([Id], [Name], [isAnswer], [QuestionId], [IsActive], [CreatedDate]) VALUES (4076, N'मशीनरी उद्योग', 0, 3019, 1, CAST(N'2021-12-12T11:03:31.160' AS DateTime))
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
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (3018, N' निम्नलिखित में कौन सामान्यतया मूल उद्योग की श्रेणी में नहीं आता है ?', 1, CAST(N'2021-12-12T10:51:09.473' AS DateTime), 1011)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (3019, N'सार्वजनिक क्षेत्र के कितने उपक्रम नवरत्नों की श्रेणी में है ?', 1, CAST(N'2021-12-12T11:03:31.140' AS DateTime), 1011)
GO
INSERT [dbo].[Question] ([QId], [QuestinName], [IsActive], [CreatedDate], [testSerieId]) VALUES (3020, N'सार्वजनिक क्षेत्र के कितने उपक्रम नवरत्नों की श्रेणी में है ?', 1, CAST(N'2021-12-12T11:03:31.140' AS DateTime), 1011)
GO
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionType] ON 
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate]) VALUES (1, N'UGC NET', 1, CAST(N'2021-04-07T08:01:23.940' AS DateTime))
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate]) VALUES (2, N'Blood Releation', 1, CAST(N'2021-12-12T09:08:44.000' AS DateTime))
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate]) VALUES (3, N'SSC CGL', 1, CAST(N'2021-12-12T09:08:44.000' AS DateTime))
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate]) VALUES (4, N'UPSC', 1, CAST(N'2021-12-12T09:08:44.003' AS DateTime))
GO
INSERT [dbo].[QuestionType] ([Id], [Value], [IsActive], [CreatedDate]) VALUES (5, N'GK India', 1, CAST(N'2021-12-12T09:08:44.003' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
GO
SET IDENTITY_INSERT [dbo].[TbL_User] ON 
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone]) VALUES (1, N'nitin', N'nitin', N'nitinsaxenahapur@gmail.com', N'5P0lKecWmzc+8qMnEngw8Q==', N'a30B9swlu6aq+iiJWnOohw==', N'yyGbHySVlt6vCj8kRw5BVg==', 1, 1, CAST(N'2021-04-03T19:28:37.537' AS DateTime), CAST(N'2021-04-03T19:28:37.537' AS DateTime), 0)
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone]) VALUES (2, N'testw', N'testw', N'infoindia78@gmail.com', N'zaAmua/gnfTdYzmOkpnQAg==', N'K0CiBB8CyagoZkK+EDtbFw==', N'i+U9N0UXkLAJNDqR2jAd0g==', 1, 1, CAST(N'2021-04-10T16:37:42.873' AS DateTime), CAST(N'2021-04-10T16:37:42.873' AS DateTime), 0)
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone]) VALUES (3, N'Neha', N'Neha', N'neha@gmail.com', N'DNaJc908Nt+pNbwlL5bBRQ==', N'71Yf8Jyo9Enmi/55zME41A==', N'71Yf8Jyo9Enmi/55zME41A==', 1, 1, CAST(N'2021-04-10T19:01:38.573' AS DateTime), CAST(N'2021-04-10T19:01:38.573' AS DateTime), 0)
GO
INSERT [dbo].[TbL_User] ([UserId], [FirstName], [LastName], [UserName], [Password], [Salt], [EmailSalt], [IsActive], [Status], [CreatedDate], [UpdateDate], [Phone]) VALUES (4, N'vishal', N'vishal', N'infoindia178@gmail.com', N'WJHRCs2JsP0F20Q8moQeAQ==', N'RV3GuHHGbTSC6ENVl/j97w==', N'RV3GuHHGbTSC6ENVl/j97w==', 1, 1, CAST(N'2021-12-11T18:01:41.643' AS DateTime), CAST(N'2021-12-11T18:01:41.643' AS DateTime), 8755673969)
GO
SET IDENTITY_INSERT [dbo].[TbL_User] OFF
GO
SET IDENTITY_INSERT [dbo].[TestSeries] ON 
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1, N'A', 1, CAST(N'2021-04-03T19:27:33.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (2, N'A1', 1, CAST(N'2021-04-03T19:27:34.247' AS DateTime), 1, NULL, NULL, NULL, NULL, 2)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (3, N'A2', 1, CAST(N'2021-04-03T19:27:34.270' AS DateTime), 1, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (4, N'A3', 1, CAST(N'2021-04-03T19:27:34.273' AS DateTime), 1, NULL, NULL, NULL, NULL, 4)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (5, N'A4', 1, CAST(N'2021-04-03T19:27:34.273' AS DateTime), 1, NULL, NULL, NULL, NULL, 5)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1002, N'Test AB', 0, CAST(N'2021-04-04T20:58:18.800' AS DateTime), 1, N'UGC NET ', 30, 1, NULL, 5)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1003, N'Test ABe', 0, CAST(N'2021-04-04T20:58:25.113' AS DateTime), 1, N'UGC NET ', 30, 1, NULL, 3)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1004, N'Test3', 1, CAST(N'2021-04-04T21:06:23.103' AS DateTime), 1, N'Des', 23, 1, 2, 1)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1005, N'Test33', 1, CAST(N'2021-04-04T21:07:22.407' AS DateTime), 1, N'Des', 23, 1, 1, 1)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1006, N'UGC Net English', 1, CAST(N'2021-04-05T21:16:11.617' AS DateTime), 1, N'English', 45, 1, 8, 1)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1007, N'भारतीय अर्थव्यवस्था से सम्बंधित सामान्य जानकारी बहु', 1, CAST(N'2021-12-12T10:43:28.790' AS DateTime), 1, N'भारतीय अर्थव्यवस्था से सम्बंधित सामान्य जानकारी बहु', 8, 2, 0, 1)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1008, N'भारतीय अर्थव्यवस्था से सम्बंधित सामान्य जानकारी बहु', 1, CAST(N'2021-12-12T10:46:16.620' AS DateTime), 1, N'भारतीय अर्थव्यवस्था से सम्बंधित सामान्य जानकारी बहु', 8, 2, 0, 2)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1009, N'प्रतिरक्षा उद्योग', 1, CAST(N'2021-12-12T10:46:53.227' AS DateTime), 1, N'प्रतिरक्षा उद्योग6', 90, 2, 0, 3)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1010, N'प्रतिरक्षा उद्योग', 1, CAST(N'2021-12-12T10:47:03.683' AS DateTime), 1, N'प्रतिरक्षा उद्योग6', 90, 2, 0, 3)
GO
INSERT [dbo].[TestSeries] ([Id], [SeriesName], [IsActive], [CreatedDate], [Org], [Subject], [Time], [UserdId], [totalQ], [QuestionType]) VALUES (1011, N'प्रतिरक्षा उद्योग', 1, CAST(N'2021-12-12T10:49:54.133' AS DateTime), 1, N'प्रतिरक्षा उद्योग', 67, 2, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[TestSeries] OFF
GO
