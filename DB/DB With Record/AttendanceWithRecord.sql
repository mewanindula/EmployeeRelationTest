USE [Attendance]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/14/2018 3:01:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpNo] [nvarchar](50) NOT NULL,
	[EmpName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelationDetails]    Script Date: 9/14/2018 3:01:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[RelationTypeId] [int] NOT NULL,
	[RelationName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RelationDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelationType]    Script Date: 9/14/2018 3:01:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RelationType] [nvarchar](50) NULL,
 CONSTRAINT [PK_RelationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelationTypeCount]    Script Date: 9/14/2018 3:01:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationTypeCount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[RelTypeId] [int] NOT NULL,
	[MaxCount] [int] NULL,
 CONSTRAINT [PK_RelationTypeCount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [EmpNo], [EmpName]) VALUES (1, N'E001', N'Mewan')
INSERT [dbo].[Employee] ([Id], [EmpNo], [EmpName]) VALUES (2, N'E002', N'Indula')
INSERT [dbo].[Employee] ([Id], [EmpNo], [EmpName]) VALUES (3, N'E003', N'Thilan')
INSERT [dbo].[Employee] ([Id], [EmpNo], [EmpName]) VALUES (4, N'E004', N'Tharindu')
INSERT [dbo].[Employee] ([Id], [EmpNo], [EmpName]) VALUES (5, N'E005', N'Kalhara')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[RelationDetails] ON 

INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (1, 1, 1, N'Rathnasena')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (2, 1, 2, N'Lakshmi')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (3, 1, 4, N'Thilina')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (4, 1, 4, N'Thilan')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (5, 1, 4, N'Isuru')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (6, 2, 2, N'Garusinghe')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (7, 2, 4, N'Kasun')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (8, 5, 5, N'Kalhari')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (9, 5, 5, N'Bashi')
INSERT [dbo].[RelationDetails] ([Id], [EmpId], [RelationTypeId], [RelationName]) VALUES (10, 1, 4, N'Sanjeewa')
SET IDENTITY_INSERT [dbo].[RelationDetails] OFF
SET IDENTITY_INSERT [dbo].[RelationType] ON 

INSERT [dbo].[RelationType] ([Id], [RelationType]) VALUES (1, N'Father')
INSERT [dbo].[RelationType] ([Id], [RelationType]) VALUES (2, N'Mother')
INSERT [dbo].[RelationType] ([Id], [RelationType]) VALUES (3, N'Wife')
INSERT [dbo].[RelationType] ([Id], [RelationType]) VALUES (4, N'Children')
INSERT [dbo].[RelationType] ([Id], [RelationType]) VALUES (5, N'Sister')
INSERT [dbo].[RelationType] ([Id], [RelationType]) VALUES (6, N'Brother')
SET IDENTITY_INSERT [dbo].[RelationType] OFF
SET IDENTITY_INSERT [dbo].[RelationTypeCount] ON 

INSERT [dbo].[RelationTypeCount] ([Id], [EmpId], [RelTypeId], [MaxCount]) VALUES (1, 1, 1, 1)
INSERT [dbo].[RelationTypeCount] ([Id], [EmpId], [RelTypeId], [MaxCount]) VALUES (2, 1, 2, 1)
INSERT [dbo].[RelationTypeCount] ([Id], [EmpId], [RelTypeId], [MaxCount]) VALUES (3, 2, 1, 1)
INSERT [dbo].[RelationTypeCount] ([Id], [EmpId], [RelTypeId], [MaxCount]) VALUES (4, 1, 4, 7)
INSERT [dbo].[RelationTypeCount] ([Id], [EmpId], [RelTypeId], [MaxCount]) VALUES (5, 2, 2, 1)
INSERT [dbo].[RelationTypeCount] ([Id], [EmpId], [RelTypeId], [MaxCount]) VALUES (6, 2, 4, 6)
INSERT [dbo].[RelationTypeCount] ([Id], [EmpId], [RelTypeId], [MaxCount]) VALUES (7, 5, 5, 2)
SET IDENTITY_INSERT [dbo].[RelationTypeCount] OFF
ALTER TABLE [dbo].[RelationDetails]  WITH CHECK ADD  CONSTRAINT [FK_RelationDetails_Employee] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[RelationDetails] CHECK CONSTRAINT [FK_RelationDetails_Employee]
GO
ALTER TABLE [dbo].[RelationDetails]  WITH CHECK ADD  CONSTRAINT [FK_RelationDetails_RelationType] FOREIGN KEY([RelationTypeId])
REFERENCES [dbo].[RelationType] ([Id])
GO
ALTER TABLE [dbo].[RelationDetails] CHECK CONSTRAINT [FK_RelationDetails_RelationType]
GO
ALTER TABLE [dbo].[RelationTypeCount]  WITH CHECK ADD  CONSTRAINT [FK_RelationTypeCount_Employee] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[RelationTypeCount] CHECK CONSTRAINT [FK_RelationTypeCount_Employee]
GO
ALTER TABLE [dbo].[RelationTypeCount]  WITH CHECK ADD  CONSTRAINT [FK_RelationTypeCount_RelationType] FOREIGN KEY([RelTypeId])
REFERENCES [dbo].[RelationType] ([Id])
GO
ALTER TABLE [dbo].[RelationTypeCount] CHECK CONSTRAINT [FK_RelationTypeCount_RelationType]
GO
