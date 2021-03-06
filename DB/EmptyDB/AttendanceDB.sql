USE [Attendance]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/14/2018 3:00:43 PM ******/
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
/****** Object:  Table [dbo].[RelationDetails]    Script Date: 9/14/2018 3:00:43 PM ******/
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
/****** Object:  Table [dbo].[RelationType]    Script Date: 9/14/2018 3:00:43 PM ******/
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
/****** Object:  Table [dbo].[RelationTypeCount]    Script Date: 9/14/2018 3:00:43 PM ******/
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
