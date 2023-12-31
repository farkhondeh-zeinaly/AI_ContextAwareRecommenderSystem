USE [TourismDB]
GO
/****** Object:  Table [dbo].[tbl_ContextFactor]    Script Date: 2/16/2019 10:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ContextFactor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_ContextFactor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_ContextFactorRelation]    Script Date: 2/16/2019 10:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ContextFactorRelation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[ChildId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_ContextFactorRelation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_POI]    Script Date: 2/16/2019 10:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_POI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Latitude] [nvarchar](50) NOT NULL,
	[Longitude] [nvarchar](50) NOT NULL,
	[DomainId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_POI] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_TourismDomain]    Script Date: 2/16/2019 10:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TourismDomain](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_TourismDomain] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_TourismDomainRelation]    Script Date: 2/16/2019 10:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TourismDomainRelation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[ChildId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_TourismDomainRelation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 2/16/2019 10:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_UserPreferences]    Script Date: 2/16/2019 10:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserPreferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DomainId] [int] NOT NULL,
	[ContextFactorId] [int] NULL,
	[PreferenceValue] [float] NOT NULL,
	[ConfidenceValue] [float] NOT NULL,
 CONSTRAINT [PK_tbl_UserPreferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_ContextFactor] ON 

INSERT [dbo].[tbl_ContextFactor] ([Id], [Name], [Title]) VALUES (1, N'SunnyWorkday', N'وسط هفته آفتابی')
INSERT [dbo].[tbl_ContextFactor] ([Id], [Name], [Title]) VALUES (2, N'SunnyWeekend', N'آخر هفته آفتابی')
INSERT [dbo].[tbl_ContextFactor] ([Id], [Name], [Title]) VALUES (3, N'SnowyWorkday', N'وسط هفته برفی')
INSERT [dbo].[tbl_ContextFactor] ([Id], [Name], [Title]) VALUES (4, N'SnowyWeekend', N'آخر هفته برفی')
SET IDENTITY_INSERT [dbo].[tbl_ContextFactor] OFF
SET IDENTITY_INSERT [dbo].[tbl_POI] ON 

INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (1, N'باشگاه شاهین', N'باشگاه بدنسازی', N'32.23234', N'25.002356', 20)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (2, N'مسجد جعفر صادق', NULL, N'23', N'65', 32)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (4, N'پارک لاله', N'یکی از بزرگترین پارک های تهران', N'32.23234', N'25.002356', 7)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (5, N'POI_ZW6JF', N'نقطه علاقه مندی اضافه شده رندوم', N'39', N'46', 29)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (6, N'POI_5CIHY', N'نقطه علاقه مندی اضافه شده رندوم', N'55', N'56', 31)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (7, N'POI_ZCFGD', N'نقطه علاقه مندی اضافه شده رندوم', N'42', N'32', 8)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (8, N'POI_V2DKN', N'نقطه علاقه مندی اضافه شده رندوم', N'41', N'53', 22)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (9, N'POI_VKIFV', N'نقطه علاقه مندی اضافه شده رندوم', N'57', N'49', 29)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (10, N'POI_W3P61', N'نقطه علاقه مندی اضافه شده رندوم', N'44', N'32', 16)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (11, N'POI_1DCGT', N'نقطه علاقه مندی اضافه شده رندوم', N'36', N'37', 28)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (12, N'POI_JDXMY', N'نقطه علاقه مندی اضافه شده رندوم', N'44', N'36', 11)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (13, N'POI_GWWN3', N'نقطه علاقه مندی اضافه شده رندوم', N'44', N'34', 26)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (14, N'POI_VDTJD', N'نقطه علاقه مندی اضافه شده رندوم', N'44', N'41', 14)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (15, N'POI_XTQ0I', N'نقطه علاقه مندی اضافه شده رندوم', N'33', N'37', 10)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (16, N'POI_D0Y87', N'نقطه علاقه مندی اضافه شده رندوم', N'38', N'44', 19)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (17, N'POI_5G7HY', N'نقطه علاقه مندی اضافه شده رندوم', N'58', N'54', 33)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (18, N'POI_NNZ11', N'نقطه علاقه مندی اضافه شده رندوم', N'32', N'57', 26)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (19, N'POI_Q5U4O', N'نقطه علاقه مندی اضافه شده رندوم', N'53', N'55', 35)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (20, N'POI_DJ9P4', N'نقطه علاقه مندی اضافه شده رندوم', N'50', N'41', 15)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (21, N'POI_I6KAF', N'نقطه علاقه مندی اضافه شده رندوم', N'34', N'32', 21)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (22, N'POI_RTN50', N'نقطه علاقه مندی اضافه شده رندوم', N'47', N'31', 35)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (23, N'POI_84RCK', N'نقطه علاقه مندی اضافه شده رندوم', N'51', N'36', 22)
INSERT [dbo].[tbl_POI] ([Id], [Name], [Description], [Latitude], [Longitude], [DomainId]) VALUES (24, N'POI_SUEOV', N'نقطه علاقه مندی اضافه شده رندوم', N'42', N'46', 11)
SET IDENTITY_INSERT [dbo].[tbl_POI] OFF
SET IDENTITY_INSERT [dbo].[tbl_TourismDomain] ON 

INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (1, N'Leisure', N'استراحت')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (2, N'Sport', N'ورزش')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (3, N'Nature', N'طبیعت')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (4, N'Culture', N'فرهنگ')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (5, N'Shopping', N'خرید')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (6, N'Gastronomy', N'غذا خوردن')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (7, N'Park', N'پارک')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (8, N'Cinema', N'سینما')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (9, N'Restaurant', N'رستوران')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (10, N'Cafe', N'کافه')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (11, N'CoffeeShop', N'کافی شاپ')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (12, N'FastFood', N'فست فود')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (13, N'NonTraditionalRestaurant', N'رستوران مدرن')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (14, N'TraditionalRestaurant', N'رستوران سنتی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (15, N'LoaclMarket', N'مغازه محلی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (16, N'ShoppingCenter', N'مرکز خرید')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (17, N'ShoppingArea', N'محله خرید')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (18, N'IranianSports', N'ورزش های ایرانی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (19, N'AquaticSports', N'ورزش های آبی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (20, N'NonAquaticSports', N'ورزش های غیر آبی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (21, N'Stadium', N'استادیوم')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (22, N'OtherSports', N'ورزش های دیگر')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (23, N'RoofedNature', N'طبیعت مسقف')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (24, N'NaturalMuseum', N'موزه طبیعی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (25, N'Museum', N'موزه')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (26, N'ArchitecturalMuseum', N'موزه معماری')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (27, N'PaintingMuseum', N'موزه نقاشی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (28, N'EthnographicMuseum', N'موزه مردم شناسی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (29, N'ArtMuseum', N'موزه هنر')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (30, N'HistoryMuseum', N'موزه تاریخ')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (31, N'ArcheologyMuseum', N'موزه باستان شناسی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (32, N'Mosque', N'مسجد')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (33, N'Monument', N'بنای تاریخی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (34, N'Traditional', N'سنتی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (35, N'TraditionalOpenArea', N'مکان باز سنتی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (36, N'Gymnasium', N'ورزشگاه')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (37, N'TraditionalBuilding', N'بنای سنتی')
INSERT [dbo].[tbl_TourismDomain] ([Id], [Name], [Title]) VALUES (38, N'OtherTraditionalBuilding', N'بناهای سنتی دیگر')
SET IDENTITY_INSERT [dbo].[tbl_TourismDomain] OFF
SET IDENTITY_INSERT [dbo].[tbl_TourismDomainRelation] ON 

INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (1, 1, 5)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (2, 1, 6)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (3, 1, 7)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (4, 1, 8)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (5, 5, 17)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (6, 5, 16)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (7, 5, 15)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (8, 6, 12)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (9, 6, 11)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (10, 6, 10)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (11, 6, 9)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (12, 9, 13)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (13, 9, 14)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (14, 2, 18)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (15, 2, 19)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (16, 2, 20)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (17, 2, 21)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (19, 2, 22)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (20, 3, 7)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (21, 3, 23)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (22, 23, 24)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (23, 4, 25)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (24, 25, 24)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (25, 25, 26)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (26, 25, 27)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (27, 25, 28)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (28, 25, 29)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (29, 25, 30)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (30, 25, 31)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (31, 18, 36)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (32, 4, 34)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (33, 4, 32)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (34, 4, 33)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (35, 34, 37)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (36, 37, 38)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (37, 34, 36)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (38, 34, 35)
INSERT [dbo].[tbl_TourismDomainRelation] ([Id], [ParentId], [ChildId]) VALUES (39, 37, 14)
SET IDENTITY_INSERT [dbo].[tbl_TourismDomainRelation] OFF
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([Id], [Username], [Password], [FirstName], [LastName]) VALUES (1, N'nima', N'123', N'nima', N'poorali')
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
SET IDENTITY_INSERT [dbo].[tbl_UserPreferences] ON 

INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (191, 1, 1, NULL, 0.8, 1)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (192, 1, 5, NULL, 0.8, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (193, 1, 17, NULL, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (194, 1, 16, NULL, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (195, 1, 15, NULL, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (196, 1, 6, NULL, 0.8, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (197, 1, 12, NULL, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (198, 1, 11, NULL, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (199, 1, 10, NULL, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (200, 1, 9, NULL, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (201, 1, 13, NULL, 0.8, 0.4)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (202, 1, 14, NULL, 0.55, 0.4)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (203, 1, 7, NULL, 0.7, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (204, 1, 8, NULL, 0.8, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (205, 1, 2, NULL, 0.4, 1)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (206, 1, 18, NULL, 0.4, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (207, 1, 36, NULL, 0.35, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (208, 1, 19, NULL, 0.4, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (209, 1, 20, NULL, 0.4, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (210, 1, 21, NULL, 0.4, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (211, 1, 22, NULL, 0.4, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (212, 1, 3, NULL, 0.6, 1)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (213, 1, 23, NULL, 0.6, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (214, 1, 24, NULL, 0.45, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (215, 1, 4, NULL, 0.3, 1)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (216, 1, 25, NULL, 0.3, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (217, 1, 26, NULL, 0.3, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (218, 1, 27, NULL, 0.3, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (219, 1, 28, NULL, 0.3, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (220, 1, 29, NULL, 0.3, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (221, 1, 30, NULL, 0.3, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (222, 1, 31, NULL, 0.3, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (223, 1, 34, NULL, 0.3, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (224, 1, 37, NULL, 0.3, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (225, 1, 38, NULL, 0.3, 0.4)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (226, 1, 35, NULL, 0.3, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (227, 1, 32, NULL, 0.3, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (228, 1, 33, NULL, 0.3, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (229, 1, 1, 1, 0.2, 1)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (230, 1, 5, 1, 0.2, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (231, 1, 17, 1, 0.2, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (232, 1, 16, 1, 0.2, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (233, 1, 15, 1, 0.2, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (234, 1, 6, 1, 0.2, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (235, 1, 12, 1, 0.2, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (236, 1, 11, 1, 0.2, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (237, 1, 10, 1, 0.2, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (238, 1, 9, 1, 0.2, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (239, 1, 13, 1, 0.2, 0.4)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (240, 1, 14, 1, 0.5, 0.4)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (241, 1, 7, 1, 0.3, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (242, 1, 8, 1, 0.2, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (243, 1, 2, 1, 0.6, 1)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (244, 1, 18, 1, 0.6, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (245, 1, 36, 1, 0.7, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (246, 1, 19, 1, 0.6, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (247, 1, 20, 1, 0.6, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (248, 1, 21, 1, 0.6, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (249, 1, 22, 1, 0.6, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (250, 1, 3, 1, 0.4, 1)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (251, 1, 23, 1, 0.4, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (252, 1, 24, 1, 0.6, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (253, 1, 4, 1, 0.8, 1)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (254, 1, 25, 1, 0.8, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (255, 1, 26, 1, 0.72, 0.72)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (256, 1, 27, 1, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (257, 1, 28, 1, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (258, 1, 29, 1, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (259, 1, 30, 1, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (260, 1, 31, 1, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (261, 1, 34, 1, 0.8, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (262, 1, 37, 1, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (263, 1, 38, 1, 0.8, 0.4)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (264, 1, 35, 1, 0.8, 0.6)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (265, 1, 32, 1, 0.8, 0.8)
INSERT [dbo].[tbl_UserPreferences] ([Id], [UserId], [DomainId], [ContextFactorId], [PreferenceValue], [ConfidenceValue]) VALUES (266, 1, 33, 1, 0.8, 0.8)
SET IDENTITY_INSERT [dbo].[tbl_UserPreferences] OFF
ALTER TABLE [dbo].[tbl_ContextFactorRelation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ContextFactorRelation_tbl_ContextFactor] FOREIGN KEY([ParentId])
REFERENCES [dbo].[tbl_ContextFactor] ([Id])
GO
ALTER TABLE [dbo].[tbl_ContextFactorRelation] CHECK CONSTRAINT [FK_tbl_ContextFactorRelation_tbl_ContextFactor]
GO
ALTER TABLE [dbo].[tbl_ContextFactorRelation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ContextFactorRelation_tbl_ContextFactor1] FOREIGN KEY([ChildId])
REFERENCES [dbo].[tbl_ContextFactor] ([Id])
GO
ALTER TABLE [dbo].[tbl_ContextFactorRelation] CHECK CONSTRAINT [FK_tbl_ContextFactorRelation_tbl_ContextFactor1]
GO
ALTER TABLE [dbo].[tbl_POI]  WITH CHECK ADD  CONSTRAINT [FK_tbl_POI_tbl_TourismDomain] FOREIGN KEY([DomainId])
REFERENCES [dbo].[tbl_TourismDomain] ([Id])
GO
ALTER TABLE [dbo].[tbl_POI] CHECK CONSTRAINT [FK_tbl_POI_tbl_TourismDomain]
GO
ALTER TABLE [dbo].[tbl_TourismDomainRelation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TourismDomainRelation_tbl_TourismDomain] FOREIGN KEY([ParentId])
REFERENCES [dbo].[tbl_TourismDomain] ([Id])
GO
ALTER TABLE [dbo].[tbl_TourismDomainRelation] CHECK CONSTRAINT [FK_tbl_TourismDomainRelation_tbl_TourismDomain]
GO
ALTER TABLE [dbo].[tbl_TourismDomainRelation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TourismDomainRelation_tbl_TourismDomain1] FOREIGN KEY([ChildId])
REFERENCES [dbo].[tbl_TourismDomain] ([Id])
GO
ALTER TABLE [dbo].[tbl_TourismDomainRelation] CHECK CONSTRAINT [FK_tbl_TourismDomainRelation_tbl_TourismDomain1]
GO
ALTER TABLE [dbo].[tbl_UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserPreferences_tbl_ContextFactor] FOREIGN KEY([ContextFactorId])
REFERENCES [dbo].[tbl_ContextFactor] ([Id])
GO
ALTER TABLE [dbo].[tbl_UserPreferences] CHECK CONSTRAINT [FK_tbl_UserPreferences_tbl_ContextFactor]
GO
ALTER TABLE [dbo].[tbl_UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserPreferences_tbl_TourismDomain] FOREIGN KEY([DomainId])
REFERENCES [dbo].[tbl_TourismDomain] ([Id])
GO
ALTER TABLE [dbo].[tbl_UserPreferences] CHECK CONSTRAINT [FK_tbl_UserPreferences_tbl_TourismDomain]
GO
ALTER TABLE [dbo].[tbl_UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserPreferences_tbl_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_User] ([Id])
GO
ALTER TABLE [dbo].[tbl_UserPreferences] CHECK CONSTRAINT [FK_tbl_UserPreferences_tbl_User]
GO
