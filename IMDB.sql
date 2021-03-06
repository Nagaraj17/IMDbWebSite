USE [IMDBdb]
GO
/****** Object:  Table [dbo].[tblActors]    Script Date: 4/16/2019 1:07:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[ActorName] [nvarchar](100) NOT NULL,
	[GenderID] [int] NOT NULL,
	[Dob] [date] NOT NULL,
	[Bio] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblActors] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGenders]    Script Date: 4/16/2019 1:07:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGenders](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblGenders] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMovie_Actors_Rel]    Script Date: 4/16/2019 1:07:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMovie_Actors_Rel](
	[MovieID] [int] NOT NULL,
	[ActorID] [int] NOT NULL,
	[Role] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblMovie_Actors_Rel] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMovies]    Script Date: 4/16/2019 1:07:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMovies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [nvarchar](100) NOT NULL,
	[RealeaseDate] [date] NULL,
	[Plot] [nvarchar](max) NULL,
	[Poster] [varbinary](max) NULL,
	[ProducerID] [int] NOT NULL,
 CONSTRAINT [PK_tblMovies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducers]    Script Date: 4/16/2019 1:07:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducers](
	[ProducerID] [int] IDENTITY(1,1) NOT NULL,
	[ProducerName] [nvarchar](100) NOT NULL,
	[GenderID] [int] NOT NULL,
	[Dob] [date] NOT NULL,
	[Bio] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblProducers] PRIMARY KEY CLUSTERED 
(
	[ProducerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblActors]  WITH CHECK ADD  CONSTRAINT [FK_tblActors_tblGenders] FOREIGN KEY([GenderID])
REFERENCES [dbo].[tblGenders] ([GenderID])
GO
ALTER TABLE [dbo].[tblActors] CHECK CONSTRAINT [FK_tblActors_tblGenders]
GO
ALTER TABLE [dbo].[tblMovie_Actors_Rel]  WITH CHECK ADD  CONSTRAINT [FK_tblMovie_Actors_Rel_tblMovies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[tblMovies] ([MovieID])
GO
ALTER TABLE [dbo].[tblMovie_Actors_Rel] CHECK CONSTRAINT [FK_tblMovie_Actors_Rel_tblMovies]
GO
ALTER TABLE [dbo].[tblProducers]  WITH CHECK ADD  CONSTRAINT [FK_tblProducers_tblGenders] FOREIGN KEY([GenderID])
REFERENCES [dbo].[tblGenders] ([GenderID])
GO
ALTER TABLE [dbo].[tblProducers] CHECK CONSTRAINT [FK_tblProducers_tblGenders]
GO
