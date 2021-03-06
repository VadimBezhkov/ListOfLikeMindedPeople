CREATE DATABASE ListOfLikeMindedPeople
GO
Use ListOfLikeMindedPeople
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[SecondName] [nvarchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Login] [varchar](30) NOT NULL,
	[DateBirth] [date] NULL,
	[TimeRegistration] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DialogID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Text] [text] NOT NULL,
	[TextChanged] [bit] NOT NULL,
	[TimeCreations] [datetime] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersDialog]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersDialog](
	[UserID] [int] NOT NULL,
	[DialogID] [int] NOT NULL,
	[TimeCreation] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dialogs]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dialogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TimeCreation] [datetime] NOT NULL,
 CONSTRAINT [PK_Dialogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MessegePhoto]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MessegePhoto]
AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.SecondName, dbo.Messages.Text
FROM            dbo.UsersDialog INNER JOIN
                         dbo.Dialogs ON dbo.UsersDialog.DialogID = dbo.Dialogs.ID INNER JOIN
                         dbo.Messages ON dbo.Dialogs.ID = dbo.Messages.DialogID INNER JOIN
                         dbo.Users ON dbo.UsersDialog.UserID = dbo.Users.ID
GO
/****** Object:  Table [dbo].[PhotoMessage]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoMessage](
	[PhotoID] [int] NOT NULL,
	[MessageID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ALLINFO]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ALLINFO]
AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.SecondName, dbo.Messages.Text, dbo.PhotoMessage.PhotoID
FROM            dbo.UsersDialog INNER JOIN
                         dbo.Dialogs ON dbo.UsersDialog.DialogID = dbo.Dialogs.ID INNER JOIN
                         dbo.Messages ON dbo.Dialogs.ID = dbo.Messages.DialogID INNER JOIN
                         dbo.Users ON dbo.UsersDialog.UserID = dbo.Users.ID INNER JOIN
                         dbo.PhotoMessage ON dbo.Messages.ID = dbo.PhotoMessage.MessageID
GO
/****** Object:  Table [dbo].[MessageAvatar]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageAvatar](
	[AvatarID] [int] NOT NULL,
	[MessageID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MessageAvatarView]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MessageAvatarView]
AS
SELECT        dbo.Messages.Text, dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.SecondName, dbo.MessageAvatar.AvatarID
FROM            dbo.MessageAvatar INNER JOIN
                         dbo.Messages ON dbo.MessageAvatar.MessageID = dbo.Messages.ID INNER JOIN
                         dbo.Dialogs ON dbo.Messages.DialogID = dbo.Dialogs.ID INNER JOIN
                         dbo.UsersDialog ON dbo.Dialogs.ID = dbo.UsersDialog.DialogID INNER JOIN
                         dbo.Users ON dbo.UsersDialog.UserID = dbo.Users.ID
GO
/****** Object:  Table [dbo].[LikePhoto]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhotoID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Сondition] [bit] NOT NULL,
 CONSTRAINT [PK_LikePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeAvatar]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeAvatar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AvatarID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Сondition] [bit] NOT NULL,
 CONSTRAINT [PK_LikeAvatar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LikePA]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LikePA]
AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.SecondName, dbo.LikePhoto.ID, dbo.LikeAvatar.ID AS Expr1
FROM            dbo.Users INNER JOIN
                         dbo.LikePhoto ON dbo.Users.ID = dbo.LikePhoto.UserID INNER JOIN
                         dbo.LikeAvatar ON dbo.Users.ID = dbo.LikeAvatar.UserID
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[TimeCreation] [date] NOT NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avatars]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avatars](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[path] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Avatars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID1] [int] NOT NULL,
	[UserID2] [int] NOT NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](50) NOT NULL,
	[AlbumID] [int] NOT NULL,
	[TimeCreation] [date] NOT NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([ID], [Name], [UserID], [TimeCreation]) VALUES (2, N'winner', 12, CAST(N'2020-04-12' AS Date))
INSERT [dbo].[Albums] ([ID], [Name], [UserID], [TimeCreation]) VALUES (5, N'sum', 16, CAST(N'2020-12-12' AS Date))
SET IDENTITY_INSERT [dbo].[Albums] OFF
GO
SET IDENTITY_INSERT [dbo].[Avatars] ON 

INSERT [dbo].[Avatars] ([ID], [UserID], [path], [Active]) VALUES (4, 12, N'www.vb.com', 1)
INSERT [dbo].[Avatars] ([ID], [UserID], [path], [Active]) VALUES (8, 16, N'www.vb.com', 0)
SET IDENTITY_INSERT [dbo].[Avatars] OFF
GO
SET IDENTITY_INSERT [dbo].[Dialogs] ON 

INSERT [dbo].[Dialogs] ([ID], [Name], [TimeCreation]) VALUES (1, N'dgdgf', CAST(N'2021-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Dialogs] ([ID], [Name], [TimeCreation]) VALUES (3, N'dfgdfg', CAST(N'2021-04-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Dialogs] ([ID], [Name], [TimeCreation]) VALUES (4, N'ghgh', CAST(N'1988-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Dialogs] ([ID], [Name], [TimeCreation]) VALUES (5, N'cvncvbn', CAST(N'2020-05-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Dialogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Friends] ON 

INSERT [dbo].[Friends] ([ID], [UserID1], [UserID2]) VALUES (1, 12, 16)
INSERT [dbo].[Friends] ([ID], [UserID1], [UserID2]) VALUES (2, 16, 12)
SET IDENTITY_INSERT [dbo].[Friends] OFF
GO
SET IDENTITY_INSERT [dbo].[LikeAvatar] ON 

INSERT [dbo].[LikeAvatar] ([ID], [AvatarID], [UserID], [Сondition]) VALUES (1, 4, 12, 1)
INSERT [dbo].[LikeAvatar] ([ID], [AvatarID], [UserID], [Сondition]) VALUES (2, 8, 16, 0)
INSERT [dbo].[LikeAvatar] ([ID], [AvatarID], [UserID], [Сondition]) VALUES (3, 4, 28, 1)
INSERT [dbo].[LikeAvatar] ([ID], [AvatarID], [UserID], [Сondition]) VALUES (7, 4, 37, 1)
SET IDENTITY_INSERT [dbo].[LikeAvatar] OFF
GO
SET IDENTITY_INSERT [dbo].[LikePhoto] ON 

INSERT [dbo].[LikePhoto] ([ID], [PhotoID], [UserID], [Сondition]) VALUES (1, 4, 28, 1)
INSERT [dbo].[LikePhoto] ([ID], [PhotoID], [UserID], [Сondition]) VALUES (2, 7, 16, 1)
INSERT [dbo].[LikePhoto] ([ID], [PhotoID], [UserID], [Сondition]) VALUES (3, 4, 12, 1)
INSERT [dbo].[LikePhoto] ([ID], [PhotoID], [UserID], [Сondition]) VALUES (4, 7, 22, 1)
INSERT [dbo].[LikePhoto] ([ID], [PhotoID], [UserID], [Сondition]) VALUES (8, 4, 37, 1)
SET IDENTITY_INSERT [dbo].[LikePhoto] OFF
GO
INSERT [dbo].[MessageAvatar] ([AvatarID], [MessageID]) VALUES (4, 2)
INSERT [dbo].[MessageAvatar] ([AvatarID], [MessageID]) VALUES (8, 4)
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([ID], [DialogID], [UserID], [Text], [TextChanged], [TimeCreations]) VALUES (2, 1, 14, N'hello', 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Messages] ([ID], [DialogID], [UserID], [Text], [TextChanged], [TimeCreations]) VALUES (4, 3, 12, N'Good', 1, CAST(N'2020-10-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
INSERT [dbo].[PhotoMessage] ([PhotoID], [MessageID]) VALUES (4, 2)
INSERT [dbo].[PhotoMessage] ([PhotoID], [MessageID]) VALUES (7, 2)
INSERT [dbo].[PhotoMessage] ([PhotoID], [MessageID]) VALUES (7, 4)
GO
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([ID], [Path], [AlbumID], [TimeCreation]) VALUES (4, N'www.vb.com', 2, CAST(N'2019-10-10' AS Date))
INSERT [dbo].[Photos] ([ID], [Path], [AlbumID], [TimeCreation]) VALUES (7, N'www.vb.com', 5, CAST(N'2021-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[Photos] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [SecondName], [Email], [Password], [Login], [DateBirth], [TimeRegistration]) VALUES (12, N'Sid', N'Alex', N'Mistery', N'asd@gmail.com', N'asasdsadas', N'alex', CAST(N'1988-10-10' AS Date), CAST(N'2021-04-19T10:10:10.000' AS DateTime))
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [SecondName], [Email], [Password], [Login], [DateBirth], [TimeRegistration]) VALUES (16, N'First', N'Michael', N'Vasilevich', N'agsgs@gmail.com', N'asdfadsf', N'asdfasdfasdf', CAST(N'1987-10-10' AS Date), CAST(N'1977-10-10T10:10:10.000' AS DateTime))
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [SecondName], [Email], [Password], [Login], [DateBirth], [TimeRegistration]) VALUES (22, N'Sailent', N'Mister', N'Mixterivery', N'mix41@gmail.com', N'asdasd', N'asdasd', CAST(N'2001-02-03' AS Date), CAST(N'1978-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [SecondName], [Email], [Password], [Login], [DateBirth], [TimeRegistration]) VALUES (28, N'Lex', N'Alex', N'Lexy', N'Le121@gmail.com', N'asdasd21341', N'asxzczxc', CAST(N'1978-11-10' AS Date), CAST(N'2021-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [SecondName], [Email], [Password], [Login], [DateBirth], [TimeRegistration]) VALUES (37, N'Davidenok', N'Vlad', N'Victorovich', N'mist@gmail.com', N'45545644', N'asdasddas', CAST(N'1989-12-10' AS Date), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UsersDialog] ([UserID], [DialogID], [TimeCreation]) VALUES (12, 1, CAST(N'2020-02-20T00:00:00.000' AS DateTime))
INSERT [dbo].[UsersDialog] ([UserID], [DialogID], [TimeCreation]) VALUES (16, 3, CAST(N'2020-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[UsersDialog] ([UserID], [DialogID], [TimeCreation]) VALUES (16, 4, CAST(N'2005-10-20T00:00:00.000' AS DateTime))
GO
/****** Object:  Index [IX-AvatarID-UserID]    Script Date: 21.04.2021 12:02:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX-AvatarID-UserID] ON [dbo].[LikeAvatar]
(
	[AvatarID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [EQ_LikePhoto]    Script Date: 21.04.2021 12:02:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [EQ_LikePhoto] ON [dbo].[LikePhoto]
(
	[PhotoID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX-UserID-PhotoID]    Script Date: 21.04.2021 12:02:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX-UserID-PhotoID] ON [dbo].[LikePhoto]
(
	[PhotoID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX-PhotoID-MessageID]    Script Date: 21.04.2021 12:02:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX-PhotoID-MessageID] ON [dbo].[PhotoMessage]
(
	[PhotoID] ASC,
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EQ_Email]    Script Date: 21.04.2021 12:02:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [EQ_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EQ_Login]    Script Date: 21.04.2021 12:02:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [EQ_Login] ON [dbo].[Users]
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_Albums_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_Albums_User]
GO
ALTER TABLE [dbo].[Avatars]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Avatars] CHECK CONSTRAINT [FK_User]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_UserID1] FOREIGN KEY([UserID1])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_UserID1]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_UserID2] FOREIGN KEY([UserID2])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_UserID2]
GO
ALTER TABLE [dbo].[LikeAvatar]  WITH CHECK ADD  CONSTRAINT [FK_LikeAvatar_Avatars] FOREIGN KEY([AvatarID])
REFERENCES [dbo].[Avatars] ([ID])
GO
ALTER TABLE [dbo].[LikeAvatar] CHECK CONSTRAINT [FK_LikeAvatar_Avatars]
GO
ALTER TABLE [dbo].[LikeAvatar]  WITH CHECK ADD  CONSTRAINT [FK_LikeAvatar_LikeUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[LikeAvatar] CHECK CONSTRAINT [FK_LikeAvatar_LikeUser]
GO
ALTER TABLE [dbo].[LikePhoto]  WITH CHECK ADD  CONSTRAINT [FK_LikePhoto_LikeUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[LikePhoto] CHECK CONSTRAINT [FK_LikePhoto_LikeUser]
GO
ALTER TABLE [dbo].[LikePhoto]  WITH CHECK ADD  CONSTRAINT [FK_LikePhoto_Photo] FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photos] ([ID])
GO
ALTER TABLE [dbo].[LikePhoto] CHECK CONSTRAINT [FK_LikePhoto_Photo]
GO
ALTER TABLE [dbo].[MessageAvatar]  WITH CHECK ADD  CONSTRAINT [FK_MessageAvatar_Avatar] FOREIGN KEY([AvatarID])
REFERENCES [dbo].[Avatars] ([ID])
GO
ALTER TABLE [dbo].[MessageAvatar] CHECK CONSTRAINT [FK_MessageAvatar_Avatar]
GO
ALTER TABLE [dbo].[MessageAvatar]  WITH CHECK ADD  CONSTRAINT [FK_MessageAvatar_Message] FOREIGN KEY([MessageID])
REFERENCES [dbo].[Messages] ([ID])
GO
ALTER TABLE [dbo].[MessageAvatar] CHECK CONSTRAINT [FK_MessageAvatar_Message]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Dialog] FOREIGN KEY([DialogID])
REFERENCES [dbo].[Dialogs] ([ID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Dialog]
GO
ALTER TABLE [dbo].[PhotoMessage]  WITH CHECK ADD  CONSTRAINT [FK_PhotoMessage_Message] FOREIGN KEY([MessageID])
REFERENCES [dbo].[Messages] ([ID])
GO
ALTER TABLE [dbo].[PhotoMessage] CHECK CONSTRAINT [FK_PhotoMessage_Message]
GO
ALTER TABLE [dbo].[PhotoMessage]  WITH CHECK ADD  CONSTRAINT [FK_PhotoMessage_Photo] FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photos] ([ID])
GO
ALTER TABLE [dbo].[PhotoMessage] CHECK CONSTRAINT [FK_PhotoMessage_Photo]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Alboms] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Albums] ([ID])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Alboms]
GO
ALTER TABLE [dbo].[UsersDialog]  WITH CHECK ADD  CONSTRAINT [FK_UsersDialog_Dialog] FOREIGN KEY([DialogID])
REFERENCES [dbo].[Dialogs] ([ID])
GO
ALTER TABLE [dbo].[UsersDialog] CHECK CONSTRAINT [FK_UsersDialog_Dialog]
GO
ALTER TABLE [dbo].[UsersDialog]  WITH CHECK ADD  CONSTRAINT [FK_UsersDialog_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UsersDialog] CHECK CONSTRAINT [FK_UsersDialog_Users]
GO
/****** Object:  StoredProcedure [dbo].[AddLikePhoto]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddLikePhoto]
	-- Add the parameters for the stored procedure here
	@PhotoID int,
	@UserID int,
	@Condition bit =True

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Insert INTO LikePhoto(PhotoID,UserID,Сondition)
Values (@PhotoID,@UserID,@Condition)
END
GO
/****** Object:  StoredProcedure [dbo].[AddMessagePhoto]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddMessagePhoto]
	-- Add the parameters for the stored procedure here
	@PhotoID int,
	@MessageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert INTO PhotoMessage(PhotoID,MessageID)
	Values (@PhotoID,@MessageID)
END
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddUser]
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50),
	@LatstName nvarchar(50),
	@SecondName nvarchar(50),
	@Email nvarchar(50),
	@Password varchar(30),
	@Login varchar(30),
	@DateBirth date,
	@TimeRegistration datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert Into Users (FirstName,LastName,SecondName,Email,Password,Login,DateBirth,TimeRegistration)
	Values (@FirstName,@LatstName,@SecondName,@Email,@Password,@Login,@DateBirth,@TimeRegistration)

END
GO
/****** Object:  StoredProcedure [dbo].[LikeAvatarAdd]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LikeAvatarAdd]
	-- Add the parameters for the stored procedure here
@AvatarID int,
	@UserID int,
	@Condition bit =True

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Insert INTO LikeAvatar(AvatarID,UserId,Сondition)
Values (@AvatarID,@UserID,@Condition)
END
GO
/****** Object:  StoredProcedure [dbo].[LikeAvatarDelete]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LikeAvatarDelete] 
	-- Add the parameters for the stored procedure here
	@ID int
	AS
BEGIN
	Delete From LikeAvatar
	Where ID=@ID
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[LikeDelete]    Script Date: 21.04.2021 12:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LikeDelete]	
	-- Add the parameters for the stored procedure here
	@ID int
	AS
BEGIN
	Delete From LikePhoto
	Where ID=@ID
	SET NOCOUNT ON;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UsersDialog"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Messages"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dialogs"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 119
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 136
               Right = 852
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PhotoMessage"
            Begin Extent = 
               Top = 6
               Left = 890
               Bottom = 193
               Right = 1059
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ALLINFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ALLINFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ALLINFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LikePhoto"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 136
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LikeAvatar"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 136
               Right = 640
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LikePA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LikePA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MessageAvatar_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Messages"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UsersDialog"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 119
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dialogs"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 119
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 886
               Bottom = 136
               Right = 1064
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessageAvatarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'r = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessageAvatarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessageAvatarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UsersDialog"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dialogs"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 119
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Messages"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 136
               Right = 852
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessegePhoto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessegePhoto'
GO
