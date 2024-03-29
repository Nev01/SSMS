USE [Panshin_ReklamnoeAgentstvo]
GO
/****** Object:  Table [dbo].[Klienti]    Script Date: 14.02.2024 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienti](
	[ID_Klienta] [int] IDENTITY(1,1) NOT NULL,
	[Familia] [varchar](max) NULL,
	[Ima] [varchar](max) NULL,
	[Otchestvo] [varchar](max) NULL,
	[№_Telephona] [varchar](max) NULL,
	[Data_Zakaza] [date] NULL,
	[Stoimost_Zakaza] [money] NULL,
 CONSTRAINT [PK_Klienti] PRIMARY KEY CLUSTERED 
(
	[ID_Klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kontrakti]    Script Date: 14.02.2024 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontrakti](
	[ID_Kontrakta] [int] IDENTITY(1,1) NOT NULL,
	[Reklama] [int] NULL,
	[ID_Klienta] [int] NULL,
	[ID_Sotrydnika] [int] NULL,
	[Data_Zakluchenia] [date] NULL,
	[Data_Rastorzenia] [date] NULL,
 CONSTRAINT [PK_Kontrakti] PRIMARY KEY CLUSTERED 
(
	[ID_Kontrakta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reklama]    Script Date: 14.02.2024 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reklama](
	[ID_Reklami] [int] IDENTITY(1,1) NOT NULL,
	[Vid_Reklami] [varchar](max) NULL,
	[Stoimost] [money] NULL,
	[Foto] [image] NULL,
 CONSTRAINT [PK_Reklama_1] PRIMARY KEY CLUSTERED 
(
	[ID_Reklami] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrydniki]    Script Date: 14.02.2024 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrydniki](
	[ID_Sotrydnika] [int] IDENTITY(1,1) NOT NULL,
	[Familia] [varchar](max) NULL,
	[Ima] [varchar](max) NULL,
	[Otchestvo] [varchar](max) NULL,
	[Dolznost] [varchar](max) NULL,
	[№_Telephona] [varchar](max) NULL,
	[Zarplata] [money] NULL,
	[Foto] [image] NULL,
 CONSTRAINT [PK_Sotrydniki_1] PRIMARY KEY CLUSTERED 
(
	[ID_Sotrydnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kontrakti]  WITH CHECK ADD  CONSTRAINT [FK_Kontrakti_Klienti] FOREIGN KEY([ID_Klienta])
REFERENCES [dbo].[Klienti] ([ID_Klienta])
GO
ALTER TABLE [dbo].[Kontrakti] CHECK CONSTRAINT [FK_Kontrakti_Klienti]
GO
ALTER TABLE [dbo].[Kontrakti]  WITH CHECK ADD  CONSTRAINT [FK_Kontrakti_Reklama] FOREIGN KEY([Reklama])
REFERENCES [dbo].[Reklama] ([ID_Reklami])
GO
ALTER TABLE [dbo].[Kontrakti] CHECK CONSTRAINT [FK_Kontrakti_Reklama]
GO
ALTER TABLE [dbo].[Kontrakti]  WITH CHECK ADD  CONSTRAINT [FK_Kontrakti_Sotrydniki] FOREIGN KEY([ID_Sotrydnika])
REFERENCES [dbo].[Sotrydniki] ([ID_Sotrydnika])
GO
ALTER TABLE [dbo].[Kontrakti] CHECK CONSTRAINT [FK_Kontrakti_Sotrydniki]
GO
