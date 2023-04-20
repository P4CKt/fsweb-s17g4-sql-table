USE [Wit]
GO
/****** Object:  Table [dbo].[islem]    Script Date: 20.04.2023 20:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[islem](
	[id] [tinyint] NOT NULL,
	[ogrenci_id] [tinyint] NOT NULL,
	[kitap_id] [tinyint] NOT NULL,
	[atarih] [varchar](19) NOT NULL,
	[vtarih] [varchar](19) NOT NULL,
 CONSTRAINT [PK_islem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kitap]    Script Date: 20.04.2023 20:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitap](
	[id] [tinyint] NOT NULL,
	[ad] [varchar](28) NOT NULL,
	[sayfasayisi] [smallint] NOT NULL,
	[puan] [tinyint] NOT NULL,
	[yazar_id] [tinyint] NOT NULL,
	[tur_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_kitap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogrenci]    Script Date: 20.04.2023 20:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenci](
	[id] [tinyint] NOT NULL,
	[ad] [varchar](30) NOT NULL,
	[soyad] [varchar](30) NOT NULL,
	[dtarih] [nchar](10) NOT NULL,
	[cinsiyet] [varchar](1) NOT NULL,
	[sinif] [varchar](4) NOT NULL,
	[puan] [tinyint] NOT NULL,
 CONSTRAINT [PK_ogrenci] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tur]    Script Date: 20.04.2023 20:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tur](
	[id] [tinyint] NOT NULL,
	[ad] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tur] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yazar]    Script Date: 20.04.2023 20:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yazar](
	[id] [tinyint] NOT NULL,
	[ad] [varchar](30) NOT NULL,
	[soyad] [varchar](30) NOT NULL,
 CONSTRAINT [PK_yazar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[islem]  WITH CHECK ADD  CONSTRAINT [FK_islem_kitap] FOREIGN KEY([kitap_id])
REFERENCES [dbo].[kitap] ([id])
GO
ALTER TABLE [dbo].[islem] CHECK CONSTRAINT [FK_islem_kitap]
GO
ALTER TABLE [dbo].[islem]  WITH CHECK ADD  CONSTRAINT [FK_islem_ogrenci] FOREIGN KEY([ogrenci_id])
REFERENCES [dbo].[ogrenci] ([id])
GO
ALTER TABLE [dbo].[islem] CHECK CONSTRAINT [FK_islem_ogrenci]
GO
ALTER TABLE [dbo].[kitap]  WITH CHECK ADD  CONSTRAINT [FK_kitap_tur] FOREIGN KEY([tur_id])
REFERENCES [dbo].[tur] ([id])
GO
ALTER TABLE [dbo].[kitap] CHECK CONSTRAINT [FK_kitap_tur]
GO
ALTER TABLE [dbo].[kitap]  WITH CHECK ADD  CONSTRAINT [FK_kitap_yazar] FOREIGN KEY([yazar_id])
REFERENCES [dbo].[yazar] ([id])
GO
ALTER TABLE [dbo].[kitap] CHECK CONSTRAINT [FK_kitap_yazar]
GO
