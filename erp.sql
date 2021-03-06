USE [master]
GO
/****** Object:  Database [erp_KaderGUR]    Script Date: 14.01.2020 17:15:36 ******/
CREATE DATABASE [erp_KaderGUR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'erp_KaderGUR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\erp_KaderGUR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'erp_KaderGUR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\erp_KaderGUR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [erp_KaderGUR] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [erp_KaderGUR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [erp_KaderGUR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET ARITHABORT OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [erp_KaderGUR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [erp_KaderGUR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [erp_KaderGUR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [erp_KaderGUR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET RECOVERY FULL 
GO
ALTER DATABASE [erp_KaderGUR] SET  MULTI_USER 
GO
ALTER DATABASE [erp_KaderGUR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [erp_KaderGUR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [erp_KaderGUR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [erp_KaderGUR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [erp_KaderGUR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'erp_KaderGUR', N'ON'
GO
ALTER DATABASE [erp_KaderGUR] SET QUERY_STORE = OFF
GO
USE [erp_KaderGUR]
GO
/****** Object:  Table [dbo].[Departman]    Script Date: 14.01.2020 17:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departman](
	[DepartmanId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmanAd] [nvarchar](50) NULL,
	[KullaniciDepartmani] [bit] NULL,
 CONSTRAINT [PK_Departman] PRIMARY KEY CLUSTERED 
(
	[DepartmanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dilekce]    Script Date: 14.01.2020 17:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dilekce](
	[DilekceId] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](200) NULL,
	[icerik] [nvarchar](max) NULL,
	[Tarih] [smalldatetime] NULL,
	[AdSoyad] [nvarchar](150) NULL,
	[Okundu] [bit] NULL,
 CONSTRAINT [PK_Dilekce] PRIMARY KEY CLUSTERED 
(
	[DilekceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faturalar]    Script Date: 14.01.2020 17:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faturalar](
	[FaturaId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [nvarchar](100) NULL,
	[Miktar] [int] NULL,
	[UrunBirimFiyat] [money] NULL,
	[KullaniciID] [int] NULL,
	[IsOrtaklariID] [int] NULL,
	[ToplamFiyatKDV] [money] NULL,
 CONSTRAINT [PK_Faturalar] PRIMARY KEY CLUSTERED 
(
	[FaturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IsOrtaklari]    Script Date: 14.01.2020 17:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IsOrtaklari](
	[IsOrtaklariId] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAd] [nvarchar](100) NULL,
	[Adres] [nvarchar](200) NULL,
	[Gsm] [char](11) NULL,
	[Email] [nvarchar](70) NULL,
 CONSTRAINT [PK_IsOrtaklari] PRIMARY KEY CLUSTERED 
(
	[IsOrtaklariId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 14.01.2020 17:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[TC] [char](11) NULL,
	[AdSoyad] [nvarchar](150) NULL,
	[DogumTarihi] [date] NULL,
	[Email] [nvarchar](70) NULL,
	[Gsm] [char](11) NULL,
	[Cinsiyet] [bit] NULL,
	[DepartmanID] [int] NULL,
	[Sifre] [nvarchar](20) NULL,
	[Role] [nvarchar](2) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 14.01.2020 17:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelId] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](150) NULL,
	[TC] [char](11) NULL,
	[Email] [nvarchar](70) NULL,
	[Gsm] [char](11) NULL,
	[iseGirisTarihi] [smalldatetime] NULL,
	[DepartmanID] [int] NULL,
	[Maas] [money] NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[PersonelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stok]    Script Date: 14.01.2020 17:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stok](
	[StokId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [nvarchar](100) NULL,
	[Miktar] [int] NULL,
	[GelisTarih] [date] NULL,
 CONSTRAINT [PK_Stok] PRIMARY KEY CLUSTERED 
(
	[StokId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departman] ON 

INSERT [dbo].[Departman] ([DepartmanId], [DepartmanAd], [KullaniciDepartmani]) VALUES (1, N'Bilgi İşlem', 1)
INSERT [dbo].[Departman] ([DepartmanId], [DepartmanAd], [KullaniciDepartmani]) VALUES (2, N'Finans', 1)
INSERT [dbo].[Departman] ([DepartmanId], [DepartmanAd], [KullaniciDepartmani]) VALUES (3, N'İnsan Kaynakları', 1)
INSERT [dbo].[Departman] ([DepartmanId], [DepartmanAd], [KullaniciDepartmani]) VALUES (4, N'Satış ve Pazarlama', 1)
INSERT [dbo].[Departman] ([DepartmanId], [DepartmanAd], [KullaniciDepartmani]) VALUES (5, N'İşçi', 0)
INSERT [dbo].[Departman] ([DepartmanId], [DepartmanAd], [KullaniciDepartmani]) VALUES (6, N'Şef', 0)
INSERT [dbo].[Departman] ([DepartmanId], [DepartmanAd], [KullaniciDepartmani]) VALUES (7, N'Güvenlik', 0)
SET IDENTITY_INSERT [dbo].[Departman] OFF
SET IDENTITY_INSERT [dbo].[Dilekce] ON 

INSERT [dbo].[Dilekce] ([DilekceId], [Baslik], [icerik], [Tarih], [AdSoyad], [Okundu]) VALUES (1, N'Yemekhane', N'Yemekhane ye turnike koyulmasını talep ediyorum taşeron firmalar ile fabrika çalışanları karışıyor', CAST(N'2019-10-25T21:55:00' AS SmallDateTime), N'Ahmet Yergördü', 0)
INSERT [dbo].[Dilekce] ([DilekceId], [Baslik], [icerik], [Tarih], [AdSoyad], [Okundu]) VALUES (2, N'Sigara içme alanı temiz bırakılmıyor.', N'Kanal 1 de ikinci sigara içme alanında her yerde izmarit ve çay bardakları vardı çöp kutuları boşaltılmamıştı. Sigara içme alanı temiz bırakılmıyor.', CAST(N'2019-12-04T21:55:00' AS SmallDateTime), N'Yasin Kırmızı', 0)
SET IDENTITY_INSERT [dbo].[Dilekce] OFF
SET IDENTITY_INSERT [dbo].[Faturalar] ON 

INSERT [dbo].[Faturalar] ([FaturaId], [UrunAd], [Miktar], [UrunBirimFiyat], [KullaniciID], [IsOrtaklariID], [ToplamFiyatKDV]) VALUES (1, N'Yeşil Mobilya Kumaşı', 25, 3200.0000, 2, 1, 14400.0000)
INSERT [dbo].[Faturalar] ([FaturaId], [UrunAd], [Miktar], [UrunBirimFiyat], [KullaniciID], [IsOrtaklariID], [ToplamFiyatKDV]) VALUES (2, N'Gül Desenli Perde Kumaşı', 5, 1200.0000, 2, 1, 1080.0000)
INSERT [dbo].[Faturalar] ([FaturaId], [UrunAd], [Miktar], [UrunBirimFiyat], [KullaniciID], [IsOrtaklariID], [ToplamFiyatKDV]) VALUES (1002, N'Beyaz Kumaş', 15, 1000.0000, 3, 1003, 2700.0000)
INSERT [dbo].[Faturalar] ([FaturaId], [UrunAd], [Miktar], [UrunBirimFiyat], [KullaniciID], [IsOrtaklariID], [ToplamFiyatKDV]) VALUES (1003, N'İşlenmemiş Kumaş', 10, 560.0000, 3, 1003, 1008.0000)
SET IDENTITY_INSERT [dbo].[Faturalar] OFF
SET IDENTITY_INSERT [dbo].[IsOrtaklari] ON 

INSERT [dbo].[IsOrtaklari] ([IsOrtaklariId], [FirmaAd], [Adres], [Gsm], [Email]) VALUES (1, N'Aydın Tekstil', N'3. Organize Sanayi Söğütlü/Sakarya', N'05369106561', N'tekstil@aydin.com')
INSERT [dbo].[IsOrtaklari] ([IsOrtaklariId], [FirmaAd], [Adres], [Gsm], [Email]) VALUES (2, N'Gur Boya', N'Bozuyük/Bilecik', N'05411441212', N'info@gurboya.com')
INSERT [dbo].[IsOrtaklari] ([IsOrtaklariId], [FirmaAd], [Adres], [Gsm], [Email]) VALUES (1003, N'Uzman İplik', N'Arifiye 1. Organize/Sakarya', N'02643737100', N'uzman@info.com')
SET IDENTITY_INSERT [dbo].[IsOrtaklari] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciId], [TC], [AdSoyad], [DogumTarihi], [Email], [Gsm], [Cinsiyet], [DepartmanID], [Sifre], [Role]) VALUES (1, N'11223344556', N'Kader Gür', CAST(N'1999-11-30' AS Date), N'kader.gur@ogr.sakarya.edu.tr', N'02547893540', 0, 1, N'123123', N'IT')
INSERT [dbo].[Kullanici] ([KullaniciId], [TC], [AdSoyad], [DogumTarihi], [Email], [Gsm], [Cinsiyet], [DepartmanID], [Sifre], [Role]) VALUES (2, N'23456187956', N'Nurselin Gür', CAST(N'1976-11-25' AS Date), N'nurselingur@gmail.com', N'02156387459', 0, 2, N'123123', N'F')
INSERT [dbo].[Kullanici] ([KullaniciId], [TC], [AdSoyad], [DogumTarihi], [Email], [Gsm], [Cinsiyet], [DepartmanID], [Sifre], [Role]) VALUES (3, N'87456213584', N'Kerem Gür', CAST(N'2000-06-14' AS Date), N'krmgur@gmail.com', N'02145789642', 1, 2, N'123123', N'F')
INSERT [dbo].[Kullanici] ([KullaniciId], [TC], [AdSoyad], [DogumTarihi], [Email], [Gsm], [Cinsiyet], [DepartmanID], [Sifre], [Role]) VALUES (5, N'47895214368', N'Merve Kocabaş', CAST(N'1995-10-10' AS Date), N'mrvkcbs@gmail.com', N'05412536869', 0, 3, N'123123', N'IK')
INSERT [dbo].[Kullanici] ([KullaniciId], [TC], [AdSoyad], [DogumTarihi], [Email], [Gsm], [Cinsiyet], [DepartmanID], [Sifre], [Role]) VALUES (6, N'12548536952', N'Ahmet Ermezli', CAST(N'1988-02-02' AS Date), N'ahmt.ermz@gmail.com', N'05376352361', 1, 4, N'123123', N'SP')
INSERT [dbo].[Kullanici] ([KullaniciId], [TC], [AdSoyad], [DogumTarihi], [Email], [Gsm], [Cinsiyet], [DepartmanID], [Sifre], [Role]) VALUES (7, N'25349867526', N'Ceyhun Kara', CAST(N'1992-06-18' AS Date), N'cyhn.black@outlook.com', N'05352366542', 1, 4, N'123123', N'SP')
INSERT [dbo].[Kullanici] ([KullaniciId], [TC], [AdSoyad], [DogumTarihi], [Email], [Gsm], [Cinsiyet], [DepartmanID], [Sifre], [Role]) VALUES (8, N'56356874582', N'Feyyaz Uçar', CAST(N'1994-01-01' AS Date), N'fyyz.fly@hotmail.com', N'05322689635', 1, 2, N'123123', N'F')
INSERT [dbo].[Kullanici] ([KullaniciId], [TC], [AdSoyad], [DogumTarihi], [Email], [Gsm], [Cinsiyet], [DepartmanID], [Sifre], [Role]) VALUES (9, N'45122486952', N'Berna Uyur', CAST(N'1991-05-05' AS Date), N'berna.sleep@gmail.com', N'05423245561', 0, 3, N'123123', N'U')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (1, N'Yılmaz Baş', N'12345678987', N'ylmzzbas@gmail.com', N'02357846912', CAST(N'2019-12-04T00:00:00' AS SmallDateTime), 6, 3400.0000)
INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (2, N'Cansu Bağlı', N'54236871254', N'cansubgl@gmail.com', N'08547962354', CAST(N'2019-02-01T00:00:00' AS SmallDateTime), 6, 10020.0000)
INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (6, N'Ahmet Gündoğan', N'47895214368', N'ahmtgndgn@gmail.com', N'05412536869', CAST(N'2019-01-12T00:00:00' AS SmallDateTime), 5, 2020.0000)
INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (8, N'Şule Pala', N'78562489354', N'sulepala_54@gmail.com', N'05412585858', CAST(N'2019-04-08T00:00:00' AS SmallDateTime), 5, 2020.0000)
INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (9, N'Leyla Kara', N'21453698756', N'lyla.is.very.black@gmail.com', N'05418526393', CAST(N'2019-02-12T00:00:00' AS SmallDateTime), 5, 2020.0000)
INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (10, N'Büşra Çetin', N'47896325146', N'crazy.bsrctn.11@gmail.com', N'05826953265', CAST(N'2018-11-01T00:00:00' AS SmallDateTime), 6, 3020.0000)
INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (11, N'Mert Beyaz', N'87542136984', N'mrtwhitenow@gmail.com', N'05236985656', CAST(N'2018-10-09T00:00:00' AS SmallDateTime), 5, 2020.0000)
INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (12, N'Erdoğan Özbakan', N'65874236124', N'ozbakan.erdgn@gmail.com', N'05232563147', CAST(N'2019-03-03T00:00:00' AS SmallDateTime), 6, 3120.0000)
INSERT [dbo].[Personel] ([PersonelId], [AdSoyad], [TC], [Email], [Gsm], [iseGirisTarihi], [DepartmanID], [Maas]) VALUES (2004, N'Derya Öztürk', N'42154236954', N'drya.oztr@outlook.com', N'05324252332', CAST(N'2018-12-25T00:00:00' AS SmallDateTime), 5, 2270.0000)
SET IDENTITY_INSERT [dbo].[Personel] OFF
SET IDENTITY_INSERT [dbo].[Stok] ON 

INSERT [dbo].[Stok] ([StokId], [UrunAd], [Miktar], [GelisTarih]) VALUES (1, N'Kumaş', 100, CAST(N'2019-11-25' AS Date))
INSERT [dbo].[Stok] ([StokId], [UrunAd], [Miktar], [GelisTarih]) VALUES (2, N'İplik', 258, CAST(N'2019-11-23' AS Date))
INSERT [dbo].[Stok] ([StokId], [UrunAd], [Miktar], [GelisTarih]) VALUES (3, N'Kumaş Boyası', 83, CAST(N'2019-11-11' AS Date))
SET IDENTITY_INSERT [dbo].[Stok] OFF
ALTER TABLE [dbo].[Dilekce] ADD  CONSTRAINT [DF_Dilekce_Okundu]  DEFAULT ((0)) FOR [Okundu]
GO
ALTER TABLE [dbo].[Faturalar]  WITH CHECK ADD  CONSTRAINT [FK_Faturalar_IsOrtaklari] FOREIGN KEY([IsOrtaklariID])
REFERENCES [dbo].[IsOrtaklari] ([IsOrtaklariId])
GO
ALTER TABLE [dbo].[Faturalar] CHECK CONSTRAINT [FK_Faturalar_IsOrtaklari]
GO
ALTER TABLE [dbo].[Faturalar]  WITH CHECK ADD  CONSTRAINT [FK_Faturalar_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Faturalar] CHECK CONSTRAINT [FK_Faturalar_Kullanici]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Departman] FOREIGN KEY([DepartmanID])
REFERENCES [dbo].[Departman] ([DepartmanId])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Departman]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK_Personel_Departman] FOREIGN KEY([DepartmanID])
REFERENCES [dbo].[Departman] ([DepartmanId])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK_Personel_Departman]
GO
/****** Object:  StoredProcedure [dbo].[spIsOrtaklariSil]    Script Date: 14.01.2020 17:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spIsOrtaklariSil]
@IsOrtaklariSil int	
as
begin
	delete from IsOrtaklari where IsOrtaklariId=@IsOrtaklariSil
end

GO
/****** Object:  StoredProcedure [dbo].[spPersonelSil]    Script Date: 14.01.2020 17:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPersonelSil]
@id int	
as
begin
	delete from Personel where PersonelId=@id
end

GO
USE [master]
GO
ALTER DATABASE [erp_KaderGUR] SET  READ_WRITE 
GO
