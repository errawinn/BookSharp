USE [master]
GO
/****** Object:  Database [APPD_CA2]    Script Date: 4/2/2018 5:50:57 PM ******/
CREATE DATABASE [APPD_CA2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'APPD_CA2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\APPD_CA2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'APPD_CA2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\APPD_CA2_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [APPD_CA2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [APPD_CA2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [APPD_CA2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [APPD_CA2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [APPD_CA2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [APPD_CA2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [APPD_CA2] SET ARITHABORT OFF 
GO
ALTER DATABASE [APPD_CA2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [APPD_CA2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [APPD_CA2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [APPD_CA2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [APPD_CA2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [APPD_CA2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [APPD_CA2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [APPD_CA2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [APPD_CA2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [APPD_CA2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [APPD_CA2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [APPD_CA2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [APPD_CA2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [APPD_CA2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [APPD_CA2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [APPD_CA2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [APPD_CA2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [APPD_CA2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [APPD_CA2] SET  MULTI_USER 
GO
ALTER DATABASE [APPD_CA2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [APPD_CA2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [APPD_CA2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [APPD_CA2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [APPD_CA2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [APPD_CA2]
GO
/****** Object:  Table [dbo].[tblBooking]    Script Date: 4/2/2018 5:50:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBooking](
	[BookingTourID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [char](9) NOT NULL,
	[BookingDate] [varchar](100) NOT NULL,
	[BookingTime] [varchar](100) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[TourID] [char](6) NOT NULL,
	[TourName] [varchar](100) NOT NULL,
	[TourDesc] [varchar](150) NOT NULL,
	[PeopleQty] [int] NOT NULL,
	[FlightSelection] [varchar](3) NOT NULL,
	[RoomSelection] [varchar](3) NOT NULL,
	[AddOnSelection] [varchar](3) NOT NULL,
	[TicketQty] [int] NOT NULL,
	[SingleRmQty] [int] NOT NULL,
	[DoubleRmQty] [int] NOT NULL,
	[CalculatedFlightPrice] [decimal](10, 2) NOT NULL,
	[CalculatedRoomPrice] [decimal](10, 2) NOT NULL,
	[Subtotal] [decimal](10, 2) NOT NULL,
	[SelectedTourStartDate] [varchar](10) NOT NULL,
	[SelectedTourEndDate] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBookmarks]    Script Date: 4/2/2018 5:50:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBookmarks](
	[BookmarkID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](150) NOT NULL,
	[TourID] [varchar](6) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 4/2/2018 5:50:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[TourID] [varchar](8) NOT NULL,
	[TourName] [varchar](100) NOT NULL,
	[TourDesc] [varchar](150) NOT NULL,
	[PeopleQty] [int] NOT NULL,
	[FlightSelection] [varchar](3) NOT NULL,
	[RoomSelection] [varchar](3) NOT NULL,
	[AddOnSelection] [varchar](3) NOT NULL,
	[TicketQty] [int] NOT NULL,
	[SingleRmQty] [int] NOT NULL,
	[DoubleRmQty] [int] NOT NULL,
	[CalculatedFlightPrice] [decimal](10, 2) NOT NULL,
	[CalculatedRoomPrice] [decimal](10, 2) NOT NULL,
	[Subtotal] [decimal](10, 2) NOT NULL,
	[SelectedTourStartDate] [varchar](100) NOT NULL,
	[SelectedTourEndDate] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 4/2/2018 5:50:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Phone] [int] NOT NULL,
	[DOB] [date] NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[TownOrCity] [varchar](50) NOT NULL,
	[Nationality] [varchar](50) NOT NULL,
	[CustAddress] [varchar](100) NOT NULL,
	[PostalCd] [varchar](50) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[CustPassword] [varchar](50) NOT NULL,
	[CardType] [varchar](50) NOT NULL,
	[CardNo] [varchar](50) NOT NULL,
	[CardExpirationDate] [varchar](50) NOT NULL,
	[CardHolderName] [varchar](100) NOT NULL,
	[CCV] [varchar](50) NOT NULL,
	[Membership] [varchar](50) NOT NULL,
	[ExpiryDate] [varchar](50) NULL,
	[Subsidy] [decimal](2, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReviews]    Script Date: 4/2/2018 5:50:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblReviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[TourID] [varchar](6) NOT NULL,
	[ReviewName] [varchar](50) NOT NULL,
	[ReviewMessage] [varchar](350) NOT NULL,
	[ReviewDateTime] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTour]    Script Date: 4/2/2018 5:50:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTour](
	[TourID] [varchar](6) NOT NULL,
	[TourName] [varchar](100) NOT NULL,
	[TourDesc] [varchar](150) NOT NULL,
	[TourPrice] [decimal](10, 2) NOT NULL,
	[TourStartDate] [date] NOT NULL,
	[TourEndDate] [date] NOT NULL,
	[TourDuration] [int] NOT NULL,
	[TourImageSource] [varchar](150) NOT NULL,
	[TourCountry] [varchar](50) NOT NULL,
	[TourRegion] [varchar](50) NOT NULL,
	[TourSummary] [text] NULL,
	[TourItinerary] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblBooking] ON 

INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (1, N'B00000001', N'1/8/2018', N'2:01 PM', N'admin1', N'CMB001', N'CAMBODIA TOUR', N'6D4N FLAVOURS OF CAMBODIA', 13, N'No', N'No', N'No', 0, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4600.00 AS Decimal(10, 2)), N'23/2/2018', N'28/2/2018')
INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (2, N'B00000001', N'1/8/2018', N'2:01 PM', N'admin1', N'CHN001', N'CHINA TOUR', N'8D7N WONDERS OF BEIJING AND XI''AN', 15, N'Yes', N'Yes', N'No', 3, 2, 0, CAST(1079.10 AS Decimal(10, 2)), CAST(181.00 AS Decimal(10, 2)), CAST(7260.10 AS Decimal(10, 2)), N'21/2/2018', N'28/2/2018')
INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (3, N'B00000002', N'4/2/2018', N'4:40 PM', N'admin2', N'IND001', N'INDIA TOUR', N'8D GOLDEN TRIANGLE', 9, N'Yes', N'Yes', N'Yes', 7, 1, 2, CAST(2517.90 AS Decimal(10, 2)), CAST(341.50 AS Decimal(10, 2)), CAST(23666.40 AS Decimal(10, 2)), N'23/2/2018', N'2/3/2018')
INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (4, N'B00000003', N'4/2/2018', N'4:51 PM', N'admin1', N'VTN001', N'VIETNAM TOUR', N'6D5N NORTHERN VIETNAM AND SAPA', 13, N'Yes', N'Yes', N'Yes', 11, 4, 0, CAST(3956.70 AS Decimal(10, 2)), CAST(362.00 AS Decimal(10, 2)), CAST(38225.70 AS Decimal(10, 2)), N'14/2/2018', N'19/2/2018')
INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (5, N'B00000003', N'4/2/2018', N'4:51 PM', N'admin1', N'TWN002', N'TAIWAN TOUR', N'7D6N CAPTIVATING SOUTH TAIWAN ', 11, N'Yes', N'Yes', N'No', 7, 4, 2, CAST(2517.90 AS Decimal(10, 2)), CAST(613.00 AS Decimal(10, 2)), CAST(26230.90 AS Decimal(10, 2)), N'21/2/2018', N'27/2/2018')
INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (8, N'B00000005', N'8/2/2018', N'2:01 PM', N'admin1', N'CMB001', N'CAMBODIA TOUR', N'6D4N FLAVOURS OF CAMBODIA', 13, N'No', N'No', N'No', 0, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4600.00 AS Decimal(10, 2)), N'23/2/2018', N'28/2/2018')
INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (9, N'B00000006', N'8/2/2018', N'2:01 PM', N'admin1', N'CHN001', N'CHINA TOUR', N'8D7N WONDERS OF BEIJING AND XI''AN', 15, N'Yes', N'Yes', N'No', 3, 2, 0, CAST(1079.10 AS Decimal(10, 2)), CAST(181.00 AS Decimal(10, 2)), CAST(7260.10 AS Decimal(10, 2)), N'21/2/2018', N'28/2/2018')
INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (6, N'B00000004', N'4/2/2018', N'4:55 PM', N'admin2', N'TWN002', N'TAIWAN TOUR', N'7D6N CAPTIVATING SOUTH TAIWAN ', 15, N'Yes', N'Yes', N'Yes', 10, 5, 3, CAST(3597.00 AS Decimal(10, 2)), CAST(829.00 AS Decimal(10, 2)), CAST(36033.00 AS Decimal(10, 2)), N'15/2/2018', N'21/2/2018')
INSERT [dbo].[tblBooking] ([BookingTourID], [BookingID], [BookingDate], [BookingTime], [Username], [TourID], [TourName], [TourDesc], [PeopleQty], [FlightSelection], [RoomSelection], [AddOnSelection], [TicketQty], [SingleRmQty], [DoubleRmQty], [CalculatedFlightPrice], [CalculatedRoomPrice], [Subtotal], [SelectedTourStartDate], [SelectedTourEndDate]) VALUES (7, N'B00000004', N'4/2/2018', N'4:55 PM', N'admin2', N'CHN001', N'CHINA TOUR', N'8D7N WONDERS OF BEIJING AND XI''AN', 13, N'Yes', N'Yes', N'Yes', 10, 3, 3, CAST(3597.00 AS Decimal(10, 2)), CAST(648.00 AS Decimal(10, 2)), CAST(30352.00 AS Decimal(10, 2)), N'28/2/2018', N'7/3/2018')
SET IDENTITY_INSERT [dbo].[tblBooking] OFF
INSERT [dbo].[tblCustomer] ([FirstName], [LastName], [Email], [Phone], [DOB], [Country], [TownOrCity], [Nationality], [CustAddress], [PostalCd], [Username], [CustPassword], [CardType], [CardNo], [CardExpirationDate], [CardHolderName], [CCV], [Membership], [ExpiryDate], [Subsidy]) VALUES (N'Jacky', N'Chan', N'hello@gmail.com', 98127306, CAST(N'1998-02-12' AS Date), N'Afghanistan', N'Asd', N'Afghanistan', N'12 fk st', N'123879', N'admin1', N'password1', N'Visa', N'12398173912313', N'12/2019', N'vicsd csdj', N'123', N'Free', N'8/8/2018', NULL)
INSERT [dbo].[tblCustomer] ([FirstName], [LastName], [Email], [Phone], [DOB], [Country], [TownOrCity], [Nationality], [CustAddress], [PostalCd], [Username], [CustPassword], [CardType], [CardNo], [CardExpirationDate], [CardHolderName], [CCV], [Membership], [ExpiryDate], [Subsidy]) VALUES (N'Bruce', N'Lee', N'hi@gmail.com', 91298172, CAST(N'1998-12-12' AS Date), N'Brunei Darussalam', N'Asdasd', N'Bosnia and Herzegovina', N'12 asd st', N'12123', N'admin2', N'password1', N'Mastercard', N'192938721937123', N'12/2017', N'asdsad dasd asd', N'123', N'Premium', NULL, CAST(0.9 AS Decimal(2, 1)))
INSERT [dbo].[tblCustomer] ([FirstName], [LastName], [Email], [Phone], [DOB], [Country], [TownOrCity], [Nationality], [CustAddress], [PostalCd], [Username], [CustPassword], [CardType], [CardNo], [CardExpirationDate], [CardHolderName], [CCV], [Membership], [ExpiryDate], [Subsidy]) VALUES (N'Barack', N'Obama', N'Bman@gmail.com', 98712367, CAST(N'1998-02-23' AS Date), N'Afghanistan', N'Asdjh', N'Switzerland', N'23 ds st', N'918237', N'administrator', N'password1', N'American Express', N'12314214123123', N'02/2019', N'Victoria HCee', N'231', N'Premium', NULL, CAST(0.9 AS Decimal(2, 1)))
INSERT [dbo].[tblCustomer] ([FirstName], [LastName], [Email], [Phone], [DOB], [Country], [TownOrCity], [Nationality], [CustAddress], [PostalCd], [Username], [CustPassword], [CardType], [CardNo], [CardExpirationDate], [CardHolderName], [CCV], [Membership], [ExpiryDate], [Subsidy]) VALUES (N'Salted', N'Fish', N'saltedfish@fish.com', 91919191, CAST(N'2011-01-01' AS Date), N'Singapore', N'Singapore', N'Singapore', N'11 fish st', N'11111111', N'fish', N'saltedfish1', N'Visa', N'1234567890123', N'11/2021', N'fish', N'111', N'Premium', NULL, CAST(0.9 AS Decimal(2, 1)))
INSERT [dbo].[tblCustomer] ([FirstName], [LastName], [Email], [Phone], [DOB], [Country], [TownOrCity], [Nationality], [CustAddress], [PostalCd], [Username], [CustPassword], [CardType], [CardNo], [CardExpirationDate], [CardHolderName], [CCV], [Membership], [ExpiryDate], [Subsidy]) VALUES (N'John', N'Cena', N'johncena1@gmail.com', 98236473, CAST(N'1970-06-12' AS Date), N'Korea', N'England', N'Bolivia', N'11 John St', N'981273', N'johncena', N'password1', N'Visa', N'1232534134123', N'12/2019', N'John Cena', N'3024', N'Premium', NULL, CAST(0.9 AS Decimal(2, 1)))
SET IDENTITY_INSERT [dbo].[tblReviews] ON 

INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (1, N'CHN001', N'Claire Claire', N'I really enjoyed the trip, all our accomodations were cosy and comfortable, and the scenery was amazing! I especially enjoyed day 3 as I saw a duck and was very happy. Would recommend!', CAST(N'2017-12-27 12:35:32.000' AS DateTime))
INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (2, N'CHN001', N'Xuan Yi', N'It was very good, the tour guide Ash was very knowledgable and professional and would go out of his way to ensure our satisfaction. The food was surprisingly salty, but I enjoyed it very much as it reminded me of my mother''s cooking. My only complaint is that I wish it lasted longer. Would recommend!', CAST(N'2017-12-28 10:20:12.000' AS DateTime))
INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (3, N'CHN001', N'Anne', N'It was very good, Anne Anne-joyed it, Anne would go for Anne-nother one from this travel agency! I saw many Anne-imals and that left Anne impactful mark in my memories. Anne is not a kindergartener.', CAST(N'2017-12-29 12:38:46.000' AS DateTime))
INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (4, N'JPN001', N'Watashiwa Joshu Desu', N'Watashiwa Joshu Desu! Korewa Nihon no Tour wa subarashi! Hontoni sugoi desu. Watashi ga Weeaboo ja NAI! Watashi wa Joshu. Sore de owaridesu.', CAST(N'2017-12-29 01:02:23.000' AS DateTime))
INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (5, N'CMB001', N'John Cena', N'It was a good trip. John Cena approved. This s the official account of Cena. Yes this is me. Behold.', CAST(N'2017-12-29 08:15:16.000' AS DateTime))
INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (6, N'THL001', N'Kami', N'Kami went to thailand tour. Kami tasted thailand food. Kami met people that look like Cha***.  Kami is happy.', CAST(N'2017-12-29 11:08:02.000' AS DateTime))
INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (7, N'THL001', N'Chanon Kuchaboasd', N'This tour made me appreciate my hometown on a whole new level! Who knew that it had so much history behind it! Not this guy!', CAST(N'2017-12-30 07:24:32.000' AS DateTime))
INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (8, N'TWN002', N'Lin Zhai', N'This tour is very nice amirite?', CAST(N'2018-08-01 14:04:56.000' AS DateTime))
INSERT [dbo].[tblReviews] ([ReviewID], [TourID], [ReviewName], [ReviewMessage], [ReviewDateTime]) VALUES (9, N'IND001', N'Chanon', N'ANything la', CAST(N'2018-09-01 12:05:40.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblReviews] OFF
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'CHN001', N'CHINA TOUR', N'8D7N WONDERS OF BEIJING AND XI''AN', CAST(2000.00 AS Decimal(10, 2)), CAST(N'2017-10-01' AS Date), CAST(N'2018-12-01' AS Date), 8, N'pack://application:,,,/Resources/Images/Tour3.jpg
', N'China', N'Northeast', N'Immerse yourself into the rich history of China. 

Highlights Include: Beijing Great Wall, Forbidden City, Summer Palace , Terracotta Warriors, Famen Temple

Cozy accommodation: Stay at 5* hotel throughout

Delicacy cuisine: Peking Roast Duck at Quanjude, Dumpling Feast and Steamboat meal', N'8D7N WONDERS OF BEIJING AND XI''AN 


DAY 1 SINGAPORE - BEIJING 

6pm: Assemble at Singapore Changi Airport for your flight to Beijing.  Upon arrival, we will view the external façade of the New CCTV building and National Centre for the Performing Arts (NCPA) that is colloquially described as The Bird''s Egg and look like a water drop. Thereafter, we will visit historical Qianmen Shopping District.



DAY 2 BEIJING - JUYONGGGUAN GREAT WALL/XIUSHUI STREET 

8am: After breakfast, we will visit the Great Wall which stretches 6100 kilometers across Northern China, along the way we will visit the Baoshutang.  The Juyongguan is the most well-preserved part and the most symbolic of the Ming’s Great Wall.  It is listed as the UNESCO Heritage Culture in 1987. 

7pm: Sit back and enjoy the large-scale Golden Mask Dynasty performance about an ancient romantic legend.



DAY 3 BEIJING - TIANANMEN SQUARE/FORBIDDEN CITY/BEIJING NATIONAL STADIUM (EXTERNAL)/NATIONAL AQUATICS CENTRE (EXTERNAL)/TONGRENTANG 

8am: After breakfast, we will see the Tiananmen Square by coach and visit the solemn Forbidden City which it is the largest and most complete palace existing in the world, filled with magnificent buildings, pavilions that are classical and oriental styles.

3pm: Thereafter, we will see the exterior façade of the National Stadium – The Bird Nest and the National Aquatics Centre – The Water Cube.  



DAY 4 BEIJING - THE SUMMER PALACE/ JADE SHOP/ THE PLACE(THE LARGEST LED SCREEN IN ASIA) 

9am: After breakfast, we will visit the Summer Palace which was once the royal palace and royal garden during the Qing Dynasty.  It is also China’s most well kept and largest ancient garden and the top among the 4 famous garden of China. 

2pm: After lunch, we will visit the Baoshutang.

5pm: Next, we will see The Place – the largest LED screen in Asia (at your own expense).



DAY 5 BEIJING (TEMPLE OF HEAVEN) - XI’AN 

8am: After breakfast, we will visit the Temple of Heaven, China''s largest temple architecture where the Emperor of the Ming and Qing dynasties prayed to heaven for good weather and harvest.  It is also an ancient wooden architectural without using any nails and hammer. 

11am: Next, we will take a domestic flight to Xi’an.

1pm: Visit the Big Wild Goose Pagoda which was designed and presided over the construction by the renowned Monk Xuan Zang to house the Buddhist Sutras that he retrieved from India.  

3pm: Visit the biggest musical fountain square in Asia – the Big Wild Goose Pagoda Musical Fountain Square.  

5pm: Tour the Xi''an Tang Garden where are able to learn more of the Tang Dynasty culture.  

7pm: Enjoy the Xi''an Dumpling Feast for dinner.  



DAY 6 XI''AN - QINSHIHUANG MAUSOLEUM/ TERRACOTTA WARRIORS 

8am: Today after breakfast, we will visit the Qinshihuang Mausoleum Museum.  This museum organization was set up for the idea of preserving the heritage site. 

10am: Visit Terracotta Army Museum, the Qinshihuang Mausoleum and the Qinshihuang Mausoleum Heritage Park. It is a major discovery in the history of China''s Archaeological that thousand pieces of those life-sized terracotta soldiers and horses are being found in this array.  It is also known as one of the great miracle of the World.  

12pm: Savor the Local Xi''an snacks while enjoying an interesting Ramen Performance for lunch.  

2pm: Visit the Xi''an Art Ceramics Factory for some souvenirs.



DAY 7 XI''AN - FAMEN TEMPLE 

9am: After breakfast, we will visit Famen Temple (include tram ride) which was built in the late Eastern Han dynasties, dating back some 1,700 years of history.  It is known as the ancestor temple where the only relic of Sakyamuni Buddha''s repository. According to legend, Buddha Sakyamuni passed away on the way Salo. In Indian custom, after the Buddha''s cremation, the relics divided into eight parts where the Famen Temple is one of the places to keep the phalanx relic of Buddha. 

11am: Next we will visit Jade Shop.  

2pm: After returning to Xi''an, we will visit Ancient City Walls which is built on the basis of the Tang’s Great Wall. It is the largest and best preserved castle architectural in China. 

5pm: Lastly, we will visit the Xi''an Bell and Drum Tower Square and Ancient Street to captivate the local folk culture and customs.



DAY 8 XI’AN- (BEIJING)-SINGAPORE 

8am: This morning, we will have some leisure time before transfer to the airport for your flight back to Singapore. ')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'CMB001', N'CAMBODIA TOUR', N'6D4N FLAVOURS OF CAMBODIA', CAST(2300.00 AS Decimal(10, 2)), CAST(N'2018-01-01' AS Date), CAST(N'2018-04-01' AS Date), 6, N'pack://application:,,,/Resources/Images/Tour1.jpg
', N'Cambodia', N'Southeast', N'Discover various aspects of Cambodia! Highlights include:

1) SIEM REAP: Old Market and Pub Street, South Gate of Angkor Thom, Ta Prohm Temple and Angkor Wat!

2) KAMPONG THOM: Visit to Isanborei Village and Sambor Prei Kuk
 
3) PHNOM PENH: Royal Palace, Tuol Sleng Museum and Central Market', N'6D4N FLAVOURS OF CAMBODIA


DAY 1 SINGAPORE - SIEM REAP 
Dinner

3pm: Assemble at Changi Airport for your flight to Siem Reap, a small town with French colonial architecture influences.  

5pm: Proceed to Old Market and Pub Street for a feel of the traditional market life. 

6pm: In the evening, proceed for an off-road 4WD tour to explore the rice fields. 

7pm: Thereafter, enjoy your dinner while viewing a traditional Khmer performance.

 

DAY 2 SIEM REAP 
Breakfast/ Light Snacks/Dinner

8am: After breakfast, transfer to a local school to engage with the local community. Get involved to interact with local school children. 

1pm: After lunch, enjoy a light workout while preparing necessity packs, which you will distribute to local households during the following home visit. Gain an insight into the local cultures as you exchange stories with local villagers. 

5pm: Thereafter, return to the city for dinner.
 


DAY 3 SIEM REAP 
Breakfast/Lunch/Dinner

8am: In the morning, transfer to visit the South Gate of Angkor Thom. The fortified city of Angkor Thom was built by Angkor’s legendary king, Jayavarman VII. Located at the heart of Angkor Thom, the smiling, colossal faces of Avalokiteshvara in Bayon have become one of the most recognisable images connected to quintessential Khmer art and architecture. 

1pm: After which, visit Ta Prohm, a temple that has been preserved in its natural state and surrounded by jungle. Its stone hallways are overgrown with the roots and limbs of massive banyan trees, which have enveloped the stone structures like tentacles. 

3pm: Next, visit one of the world’s most renowned UNESCO World Heritage Sites, Angkor Wat, which features the largest religious monument in the world built by King Suryarvarman II during the peak of the Khmer Empire. The temple is tremendously admired for the grandeur and harmony of its architecture, as well as extensive bas-reliefs and numerous devatas adorning its walls.


DAY 4 SIEM REAP – KAMPONG THOM 
Breakfast/Lunch/Dinner

9am: After breakfast, transfer to the province of Kampong Thom, known for its picturesque landscape. 

11am: You will be met and transferred to the community of Isanborei where you will be hosted by a Khmer family in their traditional Khmer house. 

1pm: Visit the temple ruins of Sambor Prei Kuk. The Sambor district is known for its beautiful rural countryside and traditional lifestyle. Here, you would have the opportunity to be part of the local daily life for a day. 

3pm: Get a bicycle and cycle along the rural roads through villages, enjoy authentic Cambodian food, DIY at various handicrafts and experience an oxcart rides in the village. 

7pm: After a simple dinner at the village, transfer to a local guesthouse in Kampong Thom town.

 

DAY 5 KAMPONG THOM – PHNOM PENH 
Breakfast /Lunch/Dinner

9am: Today, transfer by coach to Phnom Penh - the capital of Cambodia and home to a million of the country’s 15 million people. 

1pm: Upon arrival, transfer to visit Royal Palace and Silver Pagoda. The Royal Palace is the official residence of King Norodom Sihamoni. 

3pm: Next, proceed to Tuol Sleng Genocidal Museum which provides a grim reminder of the genocidal horrors from 1975 to 1979 by the notorious Khmer Rouge. 

5pm: Visit the Central Market, a covered market distinguished by its central dome to browse and shop. It is filled with shops selling fabrics and all kinds of souvenirs.

 

DAY 6 PHNOM PENH - SINGAPORE 
Breakfast

9am: Today, free at leisure before transfer to the airport for your flight home.')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'CMB002', N'CAMBODIA TOUR', N'5D4N CAMBODIA EXPERIENCE', CAST(2000.00 AS Decimal(10, 2)), CAST(N'2018-03-01' AS Date), CAST(N'2018-05-01' AS Date), 5, N'pack://application:,,,/Resources/Images/Tour2.jpg
', N'Cambodia', N'Southeast', N'Want to discover more about Cambodia but have limited time to travel? This tour is just for you!

Highlights include:

1)SIEM REAP: Chong Khneas, Tonle Sap with boat ride, Les Artisans d‘Angkor, Angkor Wat, Southern Gate of Angkor Thom with half day Tuk Tuk ride, Bayon Temple

2)PHNOM PENH: Independence Monument, National Museum, Royal Palace, Silver Pagoda, Choeung Ek Killing Fields, Toul Sleng Genocidal Museum, Central Market', N'5D4N CAMBODIA EXPERIENCE


DAY 1 SINGAPORE - SIEM REAP 
Dinner

Assemble at Singapore Changi Airport for your flight to Siem Reap. Upon arrival, visit the floating village of Chong Khneas. Then, enjoy a traditional wooden boat ride on the largest freshwater lake in Southeast Asia Tonle Sap, also known as the “Great Lake” of Cambodia. After lunch, visit Les Artisans d‘Angkor, renowned for its woodworking, stone carving and polychrome workshops. Thereafter, embark on an educational tour at Angkor Silk Farm where you can view an exhibition and observe the production process of silk



DAY 2 SIEM REAP 
Breakfast/Lunch/Dinner

After breakfast, explore the world renowned temples of the ancient city, Angkor, capital of the powerful Khmer Empire. Visit the Southern Gate of Angkor Thom to view its series of colossal human faces carved in stones (include half day Tuk Tuk ride). Then, view the enigmatic smiling faces of Bayon Temple along its narrow corridors and steep flight of stairs. Thereafter, proceed to The Royal Enclosure, Terrace of the Elephants, the mysterious site of the Terrace of Leper King and Phimeanakas. Travel to Ta Prohm Temple, also known as ‘Tomb Raider Temple’. See enormous fig trees and gigantic creepers embrace themselves in the stone foundations of the structure. In the afternoon, explore the Magnificent Angkor Wat, one of the 7 Wonders of the New World. View carvings on the walls which reveal the beliefs, practices and the way of life then. Stroll around the site of this massive monument to explore many of its galleries with columns, libraries, pavilions, courtyards and ponds. Next, visit to iewellery shop. Visit Pre Rup Temple at dusk, the beautiful rusty-red hue of the laterite and brick used to build Pre Rup is accentuated during sunset and stands in brilliant contrast to the lush green of the jungle in the distance. Climb the steep steps to view the spectacular sunset from the top of this Cambodian temple.

 

DAY 3 SIEM REAP - PHNOM PENH 
Breakfast/Lunch/Dinner

After breakfast, transfer to the bus station for your coach ride to Phnom Penh. After lunch, proceed to Central Market, a covered market distinguished by its central dome. It is filled with shops selling fabrics and all kinds of souvenirs. Explore one of the city’s most authentic and vibrant mall, Sorya Shopping Mall to shop for a wide array of local goods and handicrafts.



DAY 4 PHNOM PENH 
Breakfast/Lunch/Dinner

his morning, Visit Independence Monument to view its lotus–shaped stupa  form  which is a combination of Khmer and modern architectural style. Next, proceed to National Museum which showcases a stunning collection of Khmer art and sculptures from the Angkor period, ranging from the 4th to 15th century. Then, visit Royal Palace, an 18th-century French villa presented to Cambodia after the opening of Suez Canal by Empress Eugenia of France. Next, be enthralled by the jade Buddha in the Silver Pagoda floored with over 5,000 silver tiles. Next, proceed to Toul Sleng Genocidal Museum which illustrate a grim reminder of the genocidal horrors committed between 1975 to 1979. End the day as we proceed to the notorious Choeung Ek Killing Fields.

 

DAY 5 PHNOM PENH – SINGAPORE 
Breakfast

If time permits, you can do some last–minute shopping before you transfer to the airport for your flight home.')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'IND001', N'INDIA TOUR', N'8D GOLDEN TRIANGLE', CAST(2300.00 AS Decimal(10, 2)), CAST(N'2018-01-01' AS Date), CAST(N'2018-09-01' AS Date), 8, N'pack://application:,,,/Resources/Images/Tour4.jpg
', N'India', N'South', N'Visit India and follow the famous Golden Triangle. Enjoy the perfect introduction to India''s three most popular destinations - Delhi, Agra and Jaipur - as we explore the icons and discover the secrets of this fascinating region. Experience the history of massive forts, the opulence and splendour of Rajasthan''s palaces, the bustle and buzz of markets and bazaars, and the traditions of a heritage stay. Travel through a land full of contrasts on this compact India tour, jam-packed with unforgettable highlights.', N'8D GOLDEN TRIANGLE


Day 1: Delhi

Namaste. Welcome to India. Your adventure begins with a welcome meeting at 6 pm. Please look for a note in the hotel lobby or ask reception where it will take place. We''ll be collecting insurance details and next of kin information at this meeting, so ensure you bring these details to provide to your leader. If you''re going to be late, please inform hotel reception. Perhaps visit the World Heritage-listed Humayun''s Tomb, Qutub Minar or Red Fort of Delhi if you have any spare time.

Accommodation:
? Hotel ( 1 nt )



Day 2: Delhi

Join your group leader on an excursion through Old Delhi. Ride the city’s metro system, and then hop in a rickshaw to the once water-filled square of Chandni Chowk. Discover the Jama Masjid, Delhi’s oldest mosque, before learning about the history of the Sikh religion at the Sheeshganj Gurudwara.

Included Activites:
? Delhi - Old Delhi walking tour
? Delhi - Jama Masjid
? Delhi - Sheeshganj Gurudwara (Sikh Temple)

Accommodation:
? Hotel ( 1 nt )



Day 3: Jaipur

Travel by express train into Rajasthan and on to its capital, Jaipur (approximately five hours). A friendly, busy town crammed with palaces and bazaars full of jewellery, textiles and folk-based arts, Jaipur is a favourite for many travellers. Our suggestions are to stop by the Hawa Mahal (Palace of the Winds), then head over to Jaipur''s Royal City Palace and explore its extravagant rooms and apartments. Later, discover one of the five astronomical observatories built by Maharaja Jai Singh, the founder of Jaipur.

Included Activites:
? Jaipur - Walking tour

Accommodation:
? bookmundi



Day 4: Jaipur

Choose to take an early morning hot air balloon experience, often a highlight of visiting Jaipur. Ballooning can be done over Jaipur on the morning of day four between September and June. Mid afternoon visit the Amber Fort. Set on a hilltop overlooking Maota Lake, the fort is an authentic example of Rajput architecture and the Sheesh Mahal (Hall of Mirrors) is one of its more spectacular buildings.

Included Activites:
? Jaipur - Amber Fort

Accommodation:
? Hotel ( 1 nt )



Day 5: Karauli

Leave the ‘Pink City’ of Jaipur behind and drive to Karauli (approximately 5-6 hours). This delightful town was founded in 1348 and is packed with rural ambience and traditional temples. Take a guided walk around the Old Quarter, interacting with friendly locals and learning about rural Indian life off the tourist trail. Be sure to visit the eclectic market stalls along the way and sample some seasonal local sweets made from Indian ingredients, including petha (pumpkin), jiggery (organic sugar), peanut brittle and gazak (sesame seeds). Stay in a restored heritage property tonight where dinner is included.

Included Activites:
? Karauli - Village walk

Accommodation:
? Heritage Property ( 1 nt )

Day 6: Fatehpur Sikri - Agra

On the journey to Agra, stop en route at the one-time capital of the Mughal empire, Fatehpur Sikri (approximately 4 hours). Its stunning mosque displays both Persian and Hindu design and is secured by a 54-metre high entrance. Once in Agra, there’s the option of visiting the marble tomb that was saved for the greatest of the Mughal Emperors, Akbar''s Mausoleum. The day then culminates in a visit to the Taj Mahal, built in the 1640s as a memorial to the wife of Emperor Shah Jahan.

Included Activites:
? Fatehpur Sikri - Guided tour
? Agra - Taj Mahal
? bookmundi

Accommodation:
? Hotel ( 1 nt )



Day 7: Delhi

In the morning, take a guided tour along the banks of the Yamuna River to the iconic Agra Fort. Originally designed by Emperor Akbar in 1565 to be a military structure, it was converted into a palace during Emperor Shah Jahan''s reign and later became his prison. In the early afternoon, take the 3-4 hour journey back to Delhi by private bus. Arrive back at the hotel with enough time to freshen up and decide whether to enjoy one final dinner with the group.

Included Activites:
? Agra - Agra Fort

Accommodation:
? Hotel ( 1 nt )



Day 8: Delhi

There are no activities planned for the final day and you''re able to depart the accommodation at any time. If you decide to stay an extra couple of days, there are plenty of activities in and around the city to enjoy.
')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'JPN001', N'JAPAN TOUR', N'6D5N BLISSFUL OKINAWA', CAST(2400.00 AS Decimal(10, 2)), CAST(N'2017-09-01' AS Date), CAST(N'2018-04-01' AS Date), 6, N'pack://application:,,,/Resources/Images/Tour5.jpg
', N'Japan', N'Northeast', N'Minna-san, Konnichiwa! This tour is the perfect tour for you and your family to discover about Okinawa at Japan!

Highlights include:

1) NAHA: Shurijo Castle, Okinawa World, Naminoue Shrine, etc.

2) ONNA: Busena Marine Park, Orion Happy Park Beer Factory

3) YOMITA: Aeon Mall Okinawa Rycom, Cape Zanpa', N'6D5N BLISSFUL OKINAWA


DAY 1 SINGAPORE – NAHA – ONNA 
Meals on Board/Dinner

1pm: Assemble at Singapore Changi Airport for your flight to Okinawa, Naha. Okinawa is home to crystal blue seas, white sand beaches and colorful marine life. Consists of 160 islands of various size scattered across a vast area of ocean. The temperature in winter is about the same as that of springtime in Tokyo and Osaka, making it warm and comfortable throughout the year.

8pm: Upon arrival, you will be met by our local representative and transfer to oceanfront hotel in Onna



DAY 2 ONNA – NAGO – ONNA 
Breakfast/Lunch/Japanese set Dinner

9am: Experience and enjoy fascinating underwater world without getting wet at Busena Marine Park, home to myriad tropical fish and amazing coral reefs. Watch the underwater world four meters below sea level from the underwater observatory with 24 windows giving a 360-degree view. 

11am: Take a whale-shaped glass-bottom boat ride for up close-up encounter with wondrous aquatic life, the world of vividly colorful tropical fish and coral reefs are almost within reach from this boat. 

12pm: Learn how Okinawa’s No 1 local beer is brewed at Orion Happy Park Beer Factory and get to taste the fresh Orion beer. 

3pm: Thereafter, cross the 2km long Ohashi bridge to Kouri-jima island, renowned with it emerald green ocean and with high quality water transparency. Cheese your photo album up with some picture perfect shots that are sure to capture here. 

7pm: Bag home some local products at a small market to wrap up the day.



DAY 3 ONNA – NAGO – NAHA 
Breakfast/Lunch/Shabu Shabu Set Dinner

10am: Situated on the northwest Okinawa coast, not far from the picturesque beaches of Onna Village nested Cape Manzamo, an up heaved outcropping of fossilized coral that stands overlook the East China Sea. Resembles an elephant''s trunk, it is particularly known for a distinctive formation that results from wave erosion. 

12pm: Later, tuck into a delectable Okinawan Cuisine lunch showcasing the best of Okinanwan cuisine before visiting Okinawa Churaumi Aquarium. Located at the same site where the International Ocean Exposition was held in 1975, the park houses the world’s 2nd-largest aquarium and a dolphin theatre today where you can enjoy a dolphin show. 

2pm: Next stop: Nago Pineapple Park, an attraction dedicated to the tangy, thorny-crowned tropical fruit. Learn more about the history and cultivation process of this fruit and hop on board an adorable pineapple-shaped shuttle bus to tour its grounds, including lush tropical garden filled with semitropical plants. Get to understand the production and process of fruity pineapple wine too! Do not forget to pick up delicious confectionaries and more at its souvenir shop. Who would have thought that there are close to 100 varieties of pineapple? 

6pm: Thereafter, take a leisure drive back to Naha, the largest city in Okinawa Prefecture. Located in the southern part of Okinawa Main Island, it is the political, economic and transportation center of the prefecture.



DAY 4 NAHA – YOMITA – NAHA 
Breakfast/Lunch/Dinner

9am: Shopaholics rejoice as we kick-start the day at AEON Mall Okinawa Rycom. With over 200 speciality stores selling anything from fashion to sports, household and luxury goods, feel free to release the shopaholic in you and let those purse strings come loose!

1pm: Hands on making salt from natural seawater from the ocean in Gala Aoiumi. You can get to taste salt ice cream at own expenses. 

3pm: Thereafter, stop by Kadena Michi no Eki to witness the chivalry air base and fighter planes. 

6pm: Enjoy a breathtaking sunset view at Cape Zanpa before we wrap up the day.



DAY 5 NAHA 
Breakfast/ Buffet Lunch/Yakiniku Dinner

9am: This morning, proceed to Shurijo Castle. A UNESCO World Heritage Site, nested on a top hill. Pierced by several large gates and ornately decorated of vermilion colour. It was the official residence of Ryuku monarchs till 1879.

1pm: Next, step into Okinawa World, a theme park presenting the local history, culture and nature in one location. There are rows of shops and houses reproduced in traditional Okinawan style, also in the crafts village there are art museum and studios for making Bingata Dyed and woven textiles and a glass factory where you can experience DIY glass at your own expense. 

4pm: Within, take a stroll thru Gyokusendo Cave, the longest limestone cave in the Orient of which just 890m is open to the public, the actual length of the cave is about 5km. Proceed on to Awamori Chuko Factory to learn the distillation process of shochu and get to taste the fresh brew. 

8pm:End the day with some shopping time at Kokusai Street. Here, you will find souvenirs, fashion boutiques and restaurants



DAY 6 NAHA – SINGAPORE 
Breakfast/Buffet Lunch

8am: After breakfast, proceed to Naminoue Shrine that sits atop a high bluff, overlooking Naminoue Beach and the ocean. Make a stop at Tomari Iyumachi Fish Market where you can get to purchase same-day-fresh seafood and other marine products such as mozuku seaweed at a steal. 

11am: Next, go all out and embark on a last minute shopping spree at Ashibina outlet mall that boasts a plethora of domestic and imported brands at a steal. 

2pm: Thereafter, transfer to the airport for your flight back to Singapore.
')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'JPN002', N'JAPAN TOUR', N'7D5N HOKKAIDO ULTIMATE', CAST(3000.00 AS Decimal(10, 2)), CAST(N'2018-02-01' AS Date), CAST(N'2018-06-01' AS Date), 7, N'pack://application:,,,/Resources/Images/Tour6.jpg
', N'Japan', N'Northeast', N'View one of the best tourist spots in Japan, Hokkaido!

Hilights indclude:
1) HAKODATE: Hakodate morning market, Goryokaku Tower, Hakodate Factory, Mt Hakodate

2) NOBORIBETSU: Jigokudani, Shiraoi Ainu Museum

3) FURANO: Cheese Factory

4) OTARU: Otaru Canal, Otaru Music Box Museum, Kitachi Glass', N'7D5N HOKKAIDO ULTIMATE


DAY 1 SINGAPORE – NARITA/HANEDA - HAKODATE 
Meals On Board

9am: Assemble at Singapore Changi Airport for your flight to Hakodate via Narita/Haneda. 



DAY 2 HAKODATE 
Lunch/Japanese Set Dinner

11am: Start your day with a touch of history at the 150-year-old western-style Goryokaku Tower fort. From the Tower Observatory, you can see bird’s eye views of the city as well as the beautiful star-shaped fortress estate surrounded by lush greenery and cherry trees. 

2pm: Then, make your way to Hakodate Factory, where the red brick warehouses from the city’s trading past have been redeveloped into a chic waterfront dining, shopping and entertainment complex. 

7pm: For a perfect end to the day, proceed to the 334-metre high Mt Hakodate for spectacular panoramic views of the city.



DAY 3 HAKODATE – NOBORIBETSU 
Breakfast/Lunch/ Buffet Dinner

9am: Today, visit Hakodate morning market where the delectable array of fresh seafood and local produce are guaranteed to whet your appetite. Located next to the ocean, you can view the seasonal flowers blooming in the greenhouse, enjoy footbath and the famous Japanese Monkeys soaking in the hot spring water in the Hakodate Tropical Botanical Garden. 

1pm: Next, visit Konbukan (Kelp Shop and Museum) to learn about kelp production. Do stop by the kelp shop to stock up different kelp products such as kelp powder, kelp candies, kelp snacks, kelp soup, and kelp condiments. 

7pm: Your day will reach a boiling point as you traipse through the sulphurous valley to experience boiling ponds and steaming streams at the famous Jigokudani, also known as Hell Valley.

 

DAY 4 NOBORIBETSU – FURANO – JOZANKEI 
Breakfast/Lunch/Buffet Dinner

9am: This morning, visit Shiraoi Ainu Museum where you can meet the indigenous people of Northern Japan and understand the different aspects of Ainu culture and lifestyle. The design of the museum as an outdoor museum is divided into modern and village zone. Inside a house, explanations of Ainu history and culture are given and traditional dances are performed at all times for visitors. 

5pm: Experience these at their creamiest best with a visit to a Cheese Factory and participate in a DIY cheese making session. Stop by Furano Winery for wine tasting and shopping. 

8pm: Tonight, we will be staying in Jozankei.

 

DAY 5 JOZANKEI – OTARU – SAPPORO 
Breakfast/Lunch

10am: After breakfast, take a leisurely drive to the charming Otaru Canal which is lined with century-old stone warehouses on both sides. Then, get whimsical at Otaru Music Box Museum where displays of beautifully-crafted music boxes will delight even the grumpiest of cynics. Make a stop at Kitaichi Glass Factory to witness skilled artisans perfect their craft followed by the Ishiya Chocolate Factory to see how quality confectionary and Japan’s finest sweets and chocolates are made. Don’t feel shy to indulge in those tasty samples and buy some home for your loved ones! 

8pm: Tonight, explore the city''s main entertainment area, Susukino area that is packed with bars, restaurants, cafes, cinemas, shops. You may try the famous ramen at own expense



DAY 6 SAPPORO 
Breakfast

10am: Start the day with a visit to the popular fish market among locals and tourists – Nijo Market. Next, proceed to Odori Park, located in the heart of Sapporo. This beautifully manicured green space is a charming assembly of monumental fountains, sculptures and flowerbeds. Each winter, its verdant grounds play host to the famed Sapporo Ice Festival. 

1pm: Make a stop at a local beer factory where you will learn more about the production process of one of Japan’s finest beers. Head to Mitsui Outlet Chitose for some retail therapy thereafter, and take your pick from the wide range of domestic and imported brand items available. 

6pm: End the day with a stroll along famed Tanukikoji Shopping Arcade, the longest shopping street in Hokkaido



DAY 7 CHITOSE - SINGAPORE 
Breakfast

9am: If time permits, you can do some last-minute shopping you transfer to the airport for your flight home via Haneda/Narita. 
')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'SKR001', N'SOUTH KOREA TOUR', N'7D5N INDULGENCE IN JEJU AND SEOUL', CAST(2700.00 AS Decimal(10, 2)), CAST(N'2018-02-01' AS Date), CAST(N'2018-07-01' AS Date), 7, N'pack://application:,,,/Resources/Images/Tour7.jpg', N'South Korea', N'Northeast', N'Prepare for the ultimate tour of Korea!

Highlights include:

1) Icheon: Songwol-dong fairy tale village, Songdo G Tower
 
2) Gyeonggi-do: Gwangmyeong Cave
 
3) Yongin: Yongin Everland
 
4) Seoul: Changdukgung Palace, Myeongdong, Lotte World Adventure Themepark, Gwanghwamun Square', N'7D5N INDULGENCE IN JEJU AND SEOUL


DAY 1 SINGAPORE - INCHEON 
Meals On Board

5pm: Assemble at Singapore Changi Airport for your flight to Incheon.



DAY 2 INCHEON - SEOUL - JEJU 
Dumpling Steamboat Lunch/ Korean Stir-fried Squid With Pork Dinner

11pm: Upon arrival in Seoul, start your sightseeing tour at majestic Gyeongbok Palace, built in 1395 and the largest palace during the Joseon dynasty. Roam its stately grounds, delve into its storied past and imagine what it might have been like centuries ago. 

2pm: Next, drive past Cheong Wa Dae, the Korean president’s residence. Thereafter, proceed for a Korean culinary lesson and enjoy a DIY seafood pancake session. Thereafter, head to bustling Dongdaemun Market for some serious shopping. Dotted with stalls offering the latest fashion togs and accessories, this is the spot for assembling that achingly-hip Korean-style ensemble that you have always coveted. 

4pm: Later, transfer to the airport for your domestic flight to Jeju. This volcanic island is Korea’s largest and draws both international and domestic travellers alike. With its mild weather, plethora of spellbinding natural sights and relaxed vibe, it is not difficult to see why.



DAY 3 JEJU 
Korean Minced Abalone Porridge Breakfast/ Black Pork Bulgogi Lunch/Clay Pot Abalone Soup With Korean Pancake Dinner

9am: Start your adventure in Jeju with a visit to Seongsan Ilchulbong Peak, a UNESCO World Heritage Site. Formed more than 100,000 years ago, this peak features a crater surrounded by sharp, jagged rocks — the crowning glory, if you will. 

11am: Later, hold on tight and surrender to the thrills of an all-terrain vehicle ride. Then, giddy up and proceed for a horse-riding experience. 

3pm: Next, make a stop at Jeju Folk Village Museum and learn more about folk practices, traditions and customs through the museum’s enviable collection of artefacts. It was also one of the filming sites of a Korean drama “Dae Jang Geum”. 

5pm: Wrap up the day with a visit to Manjanggul Cave, another must-visit UNESCO World Heritage Site. It is one of the finest lava tunnels in the world with a variety of interesting structures such as lava stalagmites, stalactites and tube tunnels. 

7pm: Later, visit Topdong underground street to browse and shop for unique mementoes to take home.



DAY 4 JEJU 
Dumpling Soup Breakfast/ Hot Stone Pot Bibimbap and Shabu Shabu Lunch/ Korean Ginseng Chicken Soup Dinner

8am: This morning, explore beautiful Cheonjiyeon Falls, one of the 3 most famous waterfalls in Jeju. 

10am: Later, visit magnificent Jusangjeolli Cliff, which was formed when the lava from Hallasan erupted into the sea of Jungmun. 

12pm: Thereafter, head for the newly opened PLAY K-POP music experience, where a K-pop hologram performance hall invites you to a world of Hallyu fantasy. 

1pm: Next, proceed to O’sulloc Museum. Learn about Korea’s traditional tea culture and enjoy views of the surrounding green tea fields. 

3pm: After which, savour the museum’s green tea ice cream, said to be the best in Jeju. Thereafter, proceed to Sumokwon Theme Park, an indoor theme park that houses the popular Ice Museum. View mesmerising ice sculptures that have been artfully crafted by Japanese artisans and visit the illusion art gallery. If being surrounded by ice, albeit beautifully sculpted ones, have got you feeling a little cold, you will be glad to know that a stomach-warming restorative Korean ginseng chicken soup dinner awaits.

7pm: After dinner, enjoy a magical art performance, “The Painters: HERO” which suggests a new type of performance, creating works of art on stage with dynamic 3D video display, dance and comedy.

Note!
“The Painters: HERO” may be replaced with an alternative performance.



DAY 5 JEJU – SEOUL 
Breakfast/Everland Set Lunch/ 3-colour BBQ Dinner

9am: Transfer to the airport for your domestic flight to Seoul. 

12pm: Upon arrival, proceed to a ski resort where you can indulge in a host of fun snow activities and receive a complimentary pair of Chan Brothers Travel ski gloves. 

3pm: Next, stop at a local fruit farm where you can enjoy picking and tasting strawberries. Nothing is like going straight to the source to enjoy the best of nature’s bounty.

Seasonal Bonus
Enjoy picking and tasting 250 grammes of strawberries per traveller.



DAY 6 SEOUL 
Breakfast/Pan-fried Chicken Lunch

9am: This morning, visit Ginseng Monopoly Showroom before proceeding to a beauty academy where you can give your skin some much-needed tender loving care with a DIY facial. 

1pm: Thereafter, stock up on skincare basics at an Odbo cosmetic shop before proceeding to the futuristic N Seoul Tower. This iconic structure marks the highest point in Seoul and you will be able to take in mesmerising views of the city from here. 

4pm: Next, continue to busy Myeongdong, one of the city’s main retail and commercial districts, for a spot of shopping. 

7pm: Thereafter, proceed to Lotte World, Korea’s largest indoor theme park.



DAY 7 SEOUL - INCHEON - SINGAPORE 
Breakfast/Meals On Board

8am: In the morning, visit Healthy Liver Centre where you can shop for health products. If time permits, you can do some last-minute shopping before you transfer to the airport for your flight home.

')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'SKR002', N'SOUTH KOREA TOUR', N'8D6N KOREA ULTIMATE', CAST(3000.00 AS Decimal(10, 2)), CAST(N'2018-02-01' AS Date), CAST(N'2018-05-01' AS Date), 8, N'pack://application:,,,/Resources/Images/Tour8.jpg', N'South Korea', N'Northeast', N'The long wait has ended! Time to visit the country that started the K-POP wave, Korea!

Highlights include:
1) Seoul: Gyeongbok Palace, Cheong Wa Dae, Dongdaemun Market, Seoul Sky Tower, Myeongdong, Lotte World

2) Jeju: Seongsan Ilchulbong Peak: All-terrain vehicle ride, Jeju Folk Village Museum, Manjanggul Cave, Top-dong underground street, Cheonjiyeon Falls, Jusangjeolli Cliff, PLAY K-POP music experience, Sumokwon Theme Park', N'8D6N KOREA ULTIMATE


DAY 1 SINGAPORE - INCHEON 
Meals On Board

Assemble  at  Singapore  Changi  Airport  for your flight to Incheon.



DAY 2 INCHEON – GYEONGGI-DO – SUWON 
Budaejjigae Lunch / Korean Set Dinner

Annyeonghaseyo! Upon arrival proceed to Songwol-dong Fairy Tale Village which is filled with painted alleys of various characters from fairy tales. After which, a photo stop at the Songdo G-Tower one of the landmark buildings in Songdo, known for its unique architecture. After which, visit Gwangmyeong Cave, an abandoned mine spanning approximately eight kilometres in length and reaching 275 metres in depth. This cave is different from other caves due to its unique location in the centre of the metropolitan area of Seoul, thus becoming a top natural attraction for visitors not only from surrounding suburbs, but from the big city as well. The cave was founded for industrial mining mainly to excavate gold used for war supplies but despite its heartbreaking history, it has now been turned successfully into a living museum, exhibiting exotic and mysterious geological materials. This cave is also particularly popular as it was one of the filming sites for the well-known television show “Running Man”. After which, we will proceed to the impressive Suwon Hwaseong fortress. The fortress (constructed from 1794 to 1796) was built as a display of the King’s filial piety towards his father Jangheonseja and to build a new pioneer city with its own economic power. The fortress was designated a UNESCO World Cultural Heritage Site in 1963.



DAY 3 SUWON – YONGIN - SKI RESORT 
Breakfast/ Everland meals coupon Lunch/ 3-colour BBQ Dinner

This morning, gear up for a fulfilled day  at the  Yongin Everland, with thrilling rides and a galore of lively entertainment. Visit Safari World and enjoy the bus tour or even the special jeep tour to see the animals. After which, visit a Fruit Farm where you will get a chance to experience first hand picking of Korea Strawberries.



DAY 4 SKI RESORT – SEOUL 
Breakfast/ Korean Style stir-fried squid with pork Dinner

This morning, spend the rest of the day at the ski resort where you can experience the fun and thrilling skiing activity. The ski resort offer a wide range of snow sports such as snowboarding and snow sledding. Skiing in Korea can be a loud experience – heavy disco music will accompany you on your way down the slopes.



DAY 5 SEOUL 
Breakfast/ Ginseng Chicken Dinner

Morning after breakfast, proceed to Lotte World Adventure Themepark, Korea’s largest indoor theme park. Besides the excitement of these rides, Lotte World also contains a variety of parades and laser shows. The 200 performers sing and dance to music in the World Carnival Parade, which adds excitement to the theme park. 

Later in the afternoon visit the newly opened pop-up store Common Ground, 1st of its kind in Korea. The unique shopping complex is built with 200 large shipping containers.



DAY 6 SEOUL 
Breakfast / Hot stone pot bibimbap and shabu shabu Lunch

In the morning, visit the Ginseng Monopoly Showroom before enjoying shopping at Odbo cosmetic shop where you can get skin care products. After which, drive past the Presidential Blue House, the Korean President’s residence and start your sightseeing tour at the majestic Changdukgung Palace designated as an UNESCO World Heritage Site. It is well known for its secret garden which shows Korea’s distinct natural beauty through its exquisite pavilions, where they stand in harmony with the surrounding ponds and 1,000-year-old trees. Afterwhich, enjoy a relaxing stroll along Gwanghwamun Square, located at the centre of the 600-years-old historic city of Seoul. The beautiful transformed square boasts an enviable backdrop of Gyeongbokgung Palace and Bugaksan Mountain. Thereafter, it is time for more shopping: begin with a stop at upscale and ritzy Myeongdong district.



DAY 7 SEOUL 
Hotel Breakfast

After breakfast, spend the day at leisure.



DAY 8 SEOUL - INCHEON - SINGAPORE 
Breakfast/ Meals On Board

This morning, proceed to Healthy Liver Centre to browse for health products. If time permits, you may do some last-minute shopping at a local provision shop before you transfer to the airport for your flight home.
')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'THL001', N'THAILAND TOUR', N'7D CHIANGMAI AND CHIANGRAI FT. BANGKOK', CAST(2500.00 AS Decimal(10, 2)), CAST(N'2017-12-01' AS Date), CAST(N'2018-05-01' AS Date), 7, N'pack://application:,,,/Resources/Images/Tour11.jpg

', N'Thailand', N'Southeast', N'Discover the various culture of Bangkok through this tour!

Highlights include:

1) Chiang Mai: Wat Phra That Doi Suthep with 1-way tram ride, Maetaeng Elephant Camp with elephant, bamboo raft & oxcart ride, Wat Phra Singh, Local Fresh Market, Namor Night Market
 
2) Chiang Rai: Mae Kajan Hot Spring, Mae Sai, Golden Triangle, Long Neck Hill Tribe village, Wat Rong Khun , Singha Park', N'7D CHIANGMAI AND CHIANGRAI FT. BANGKOK


DAY 1 SINGAPORE – CHIANG MAI 
Meals On Board/Khum Khantoke Dinner

10AM: Assemble at Changi Airport for your flight to Chiang Mai, also known as “Rose of the North” in Thailand. 

6PM: Upon arrival, proceed for a Khum Khantoke dinner, a distinctive cuisine of the ancient Lanna kingdom. You will also watch a traditional and entertaining Lanna dance performance while you enjoy your dinner. 

10PM: Next, transfer and check in to your hotel for a good rest.



DAY 2 CHIANG MAI – CHIANG RAI 
Breakfast/Lunch/Dinner

8AM: After breakfast, commence your journey to Chiang Rai. En route, visit Mae Kajan Hot Spring. 

11AM: Next, proceed to Mae Sai, the northernmost town of Thailand, and one of the major border crossings between Thailand and Myanmar. 

1PM: If time permits, you may wish to join an optional Myanmar tour at your own expense and explore the wonders of Thailand’s neighbouring country. 

2PM: Thereafter, set off for the legendary Golden Triangle, the area formed by the borders of Thailand, Laos and Myanmar. Go on a Mekong River boat ride and take in the stunning views along the river. 

4PM: Thereafter, proceed to a Long Neck Hill Tribe village and understand more about the lifestyle and culture of this intriguing tribe. 

7PM: Tonight, you may wish to arrange your own transport to visit one of Chiang Rai’s night markets for some local snacks and shopping.



DAY 3 CHIANG RAI – CHIANG MAI 
Breakfast/Lunch/Dinner

9AM: After breakfast, depart Chiang Rai for Chiang Mai. En route, visit Wat Rong Khun, also known as the “The White Temple”, and feast your eyes on the ornate architecture. 

11AM: Next, visit some traditional craft stores to see how local handicrafts are made and understand more about locally-produced leather, gems, bird nest and honey. 

12PM: Next, proceed to Singha Park which is situated 450 metres above sea level and spans over 12.8 kilometres. It is home to a vast area of beautiful lakes, blooming flora and animals such as giraffes and zebras. Enjoy splendid panoramic views overlooking the park while you savour your lunch. 

2PM: Thereafter, visit Wat Phra That Doi Suthep and enjoy a 1-way tram ride to take in the surroundings. Here, you can marvel at the panoramic views of Chiang Mai and Ping River.



DAY 4 CHIANG MAI 
Breakfast/Lunch/Dinner

9AM: After breakfast, visit Maetang Elephant Camp and get to understand these giant creatures which have a long shared history with the Thai people and has been a cultural icon and national symbol since ancient days. Today, you will get up close and personal with elephants at the camp with an elephant show and an exciting elephant ride around the open plains. 

2PM: Next, continue your tour of the rustic surrounds with a bamboo raft and oxcart ride. 

4PM: After a close encounter with elephants, it is time to go back in time and explore Chiang Mai old city with an exclusive tuk tuk ride. One of the rare cities in Thailand that still has its ancient walls intact, the old city’s intertwining network of lanes and alleys beckons with plenty of streetside stalls, fresh markets, old temples and charming architecture. 

5PM: En route, visit Wat Phra Singh, regarded by many as Chiang Mai’s most revered temple with its lavish architecture, immaculate grounds and the exalted image known as Lion Buddha. 

6PM: Thereafter, visit a local fresh market to experience how locals go about their daily lives. 

7PM: After dinner, experience the simple joy of lighting and releasing water lanterns with your fellow travellers. 

9PM: End off the night at the bustling Namor night market and have a glimpse of Thai street life at night. This is also the place where you can shop and snack to your heart’s content, and find beautiful handicrafts and souvenirs for your friends and family back home.



DAY 5 CHIANG MAI – BANGKOK 
Breakfast

9AM: This morning, if time permits, enjoy some time at leisure before you transfer to the airport for your domestic flight to Bangkok. 

12PM: Upon arrival, transfer and check in to your hotel. Enjoy the rest of the day at leisure.



DAY 6 BANGKOK 
Breakfast

9AM: Spend the free day at leisure to explore the dynamic city of Bangkok. You can choose to visit CentralWorld, Platinum Fashion Mall and Pratunam wholesale market for shopping sprees. Alternatively, you may wish to join an optional tour at your own expense to explore this bustling city.



DAY 7 BANGKOK – SINGAPORE 
Breakfast/Meals On Board

8AM: If time permits, you can do some last-minute shopping before you transfer to the airport for your flight home.')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'TWN001', N'TAIWAN TOUR', N'7D6N WEST TAIWAN SERIES', CAST(2200.00 AS Decimal(10, 2)), CAST(N'2018-01-01' AS Date), CAST(N'2018-04-01' AS Date), 7, N'pack://application:,,,/Resources/Images/Tour9.jpg
', N'Taiwan', N'Northeast', N'Discovery more about Taiwan through this tour!

Highlights include:

1) Taichung: Rainbow Village, Gaomei Wetland, Fengjia Night Market
 
2) Chiayi: Fenchihu Old Street, Fenchihu Railway Station
 
3) Alishan: Alishan National Scenic Area with sunrise and sea of clouds viewing experience, Sister Lakes, Shouzhen Temple', N'7D6N WEST TAIWAN ENGLISH GUIDED SERIES


DAY 1 SINGAPORE – TAOYUAN – TAICHUNG 
Meals On Board/Dinner

3pm: Assemble at Singapore Changi Airport for your flight to Taipei. Upon arrival, make your way to Taiwan’s 3rd largest city, Taichung. After dinner, check in hotel and have a well rest.



DAY 2 TAICHUNG – CHIAYI – ALISHAN +
Breakfast/ Lunch/ Alishan Specialty Dinner

9am: Get set to continue on with the theme of heritage today. 

10am: After breakfast, visit the whimsical Rainbow Village, which is given a new lease of life by an over 90-year-old Grandpa Huang, who is a war veteran. Grandpa Huang had spent about 10 months painting the colourful graffiti on the alley walls and dilapidated houses which becomes an overnight sensation and popular subject of photography.

1pm: Next, visit Fenchihu Old Street. Endowed with over 100 years of history, Fenchihu Railway Station was the largest and most important station of the Alishan Forest Railway, which transported commuters to Alishan. 

3pm: You may like to taste the Fenchihu Railway Bento at your own expense to feel the old moment.  Beloved by both locals and tourists alike, Alishan National Scenic Area is one of Taiwan’s most famous and visited nature parks, as attested to by the folk songs devoted to it. 

5pm: Visit attractions such as Sister Lakes, an ancient 1,000-year-old cypress tree and Shouzhen Temple. Take a leisure walk through forest trails and admire beautiful heritage trees and mountain peaks shrouded in misty clouds. It is quite likely that you might break into song at this juncture.



DAY 3 ALISHAN – KAOHSIUNG +
Breakfast/Lunch

7am: The sunrise, sea of clouds, forest, sunset glow and railway are known as the “Five Wonders of Alishan”. This early morning, take the Alishan sunrise viewing train, also known as ‘Alishan Mini Train’ to Zhushan Station, where the sunrise viewing platform is located. It is also the highest railway station in Taiwan. 

8am: Taking a deep breath of fresh air, admire the beauty of nature, thankful for the chance to witness the grand sight. The rising sun and sea of clouds in Alishan is a sight not be missed, as its rays filter through the clouds, lighting the sky and warming the land. 

1pm: Thereafter, proceed to Kaohsiung and make a visit to Pier-2 Art Centre, transformed from a warehouse in Kaohsiung Harbour. Divided into 4 zones, it is a cultural and creative hotspot that focuses on avant-garde and experimental works. 

7pm: Next, stopover at Xiziwan Scneic Area for the romantic sunset view. This evening, make your way to Liuhe Night Market to sample a wide variety of traditional local snacks.



DAY 4 KAOHSIUNG – NANTOU - TAICHUNG +
Breakfast/Aboriginal Culture Cuisine Lunch

8am: This morning, adjourning to gorgeous Sun Moon Lake, one of Taiwan’s most popular scenic spots and the country’s largest body of water, for a leisure cruise. Its poetic name is derived from the unique shape that resembles the sun and the moon. 

10am: Thereafter, proceed to Gaomei Wetland, an ecologically diverse wetland. If luck permits, you can catch a glimpse of some of the small species that form the communities of the wetland and capture the beautiful view of windmills against the romantic sunset. 

7pm: This evening, head to Fengjia Night Market, the largest night market in central Taiwan, to savour a variety of delicious local snacks. You can find many original and unique snacks from this bustling night market. As the night market is located near to Fengjia University, you can also shop for many fashionable yet affordable clothing and accessories. You will definitely spend an unforgettable evening at this night market!     

 

DAY 5 TAICHUNG – HSINCHU - TAIPEI +
Breakfast/ Neiwan Theater Lunch/Dinner

9am: Today, visit Neiwan Old Street and the suspension bridge. A site of traditional wooden heritage architecture, Neiwen is a town inhabited predominantly by the Hakka community and its old street bears stamps of this distinctive culture, from cuisine to craft. 

12pm: Tuck into a speciality lunch at Neiwan Theatre before making your way to a Taipei. Get ready for a contrast and change of scene as you make your way to Taipei 101, one of the city’s main landmarks and site of annual New Year’s Eve countdown. Today, spend the night at Jinshan hot spring resort to experience one of the world’s rare sea-bed hot spring water at the outdoor pool. You may also enjoy your personal hotspring bath in your room with the private hot spring facilities.



DAY 6 TAIPEI +
Breakfast/ Takao 1972 Mini Hotpot Dinner

8am: After breakfast, transfer to Jiufen, a small tow n that was founded during the Qing dynasty. Today, it maintains its quaint village vibe with its cluster of traditional teahouses and speciality shops offering famous local dishes, snacks and crafts. 

11am: Next, visit charming Jingtong railway station, one of the oldest wooden train stations in Taiwan, giving off bouts of nostalgia. Here, you can experience the simple joy of lighting and releasing heavenly lanterns with your fellow travellers. 

1pm: Thereafter, immerse yourself in the vibrant ambience at Ximending, Taipei’s famed shopping area and epicentre of the city’s youth culture to shop and people watch.



DAY 7 TAIPEI – SINGAPORE +
Breakfast/Meals on Board

8am: If time permits, you can do some last-minute shopping before you transfer to the airport for your flight home.

')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'TWN002', N'TAIWAN TOUR', N'7D6N CAPTIVATING SOUTH TAIWAN ', CAST(2100.00 AS Decimal(10, 2)), CAST(N'2017-10-01' AS Date), CAST(N'2018-04-28' AS Date), 7, N'pack://application:,,,/Resources/Images/Tour10.jpg', N'Taiwan', N'Northeast', N'Get captivated by the wonders of Taiwan!

Highlights include:

1) Pingtung: Paradise of Deer, Eluanbi Lighthouse Park, Longpan Park, Donggang Fish Market

2) Tainan: Jingzaijiao Tile-paved Salt Field, Tainan Night Market, Sicau Green Tunnel, Ten-Drum Cultural Creative Group, Chimei Museum, Jingliao Old Street ', N'7D6N CAPTIVATING SOUTH TAIWAN 


DAY 1 SINGAPORE – TAOYUAN - KAOHSIUNG - PINGTUNG 
Meals On Board/Breakfast/ Wanluan Pig’s Knuckle Lunch/ Exquisite Hotel Dinner

Assemble at Singapore Changi Airport for your flight to Taoyuan. Upon arrival, have a simple breakfast at Taoyuan. Next, enjoy a High Speed Rail Ride from Taoyuan to Kaohsiung. Upon arrival, continue to Pingtung, the southernmost province of Taiwan. Start your day by visiting Paradise of Deer, also known as Taiwan’s Nara where you can get up close to these near extinction deer. Thereafter, head to Kenting, the southernmost city in Taiwan to Eluanbi Lighthouse, an over 100-year-old lighthouse located on Cape Eluanbi. Next, proceed to Longpan Park to admire the remarkable picturesque scenery of the cape. This evening, check in to YOHO Beach Resort and Club for your 1-night stay.



DAY 2 PINGTUNG – TAINAN 
Breakfast/Seafood Lunch

This morning, head to the famous harbour in Pingtung to visit Donggang Fish Market where you may buy and enjoy fresh seafood and seasonal catch at your own expense.  Thereafter, proceed to Tainan. Along the way, stop by at  Tian Liao Moon World to view its spectacular scenery. This queer terrain is considered barren geologically, a result of the strong erosion of rain and streams over the years. However, this tract of barren land possesses the dreary and desolate beauty of deserts and its landscape is infamous for its similarity with the Moon’s surface. Next, proceed to Tainan to visit Jingzaijiao Tile-paved Salt Field, the 1st salt field in northern Tainan. With over 180 years of history, it is the only remaining ancient salt field in Taiwan. You will learn the traditional way of drying, mining and collecting salt as well as witness the unique and colourful mosaic art formed by the tile-paved salt fields under your feet. This evening, visit the popular Tainan Night Market for delicious local snacks. Snacks in Tainan are well known in Taiwan, and no-to-be-missed are charcoal grilled chicken fillet, braised snacks of yesteryear and pickled quava. You can also shop for fashion and accessories at the night market.



DAY 3 TAINAN 
Breakfast / Tainan Danzai Noondle Lunch/Tainan Specialty Snacks Dinner at Fucheng “Traditional Tainan Feast” Restaurant

After breakfast, proceed to Taijiang National Park where you will go on a boat ride to explore the mangroves forest at Sicau Green Tunnel, popularly known as Taiwan’s miniature version of Amazon River. Known as a green tunnel on the water, the creek is shaded on both sides by over 100-year-old mangrove trees growing at a 45 degrees angle in the wetland. Thereafter, continue to Ten-Drum Cultural Creative Group to view an invigorating drumming performance which has been nominated in the Grammy Awards. You will also get to learn and experience the joy of drumming.

Thereafter, proceed to visit Chimei Museum, the newest landmark attraction in Tainan. It is a comprehensive museum with wide collections of Western art, sculptures, musical instruments, weaponry and natural history.



DAY 4 TAINAN - KAOHSIUNG 
Breakfast/ “A Taste of Nostalgia” Gedaofan Lunch/ Dongpozuiyue A la carte Buffet Dinner

This morning, proceed to Houbi in Tainan, home to gorgeous terraces of rice paddy fields. Explore Jingliao Old Street, which became renowned after being featured in the documentary film, “Wu Mi Le”. Besides being able to see the rustic and simple daily lives of Taiwan’s small town, you will also savour Gedaofan, a traditional local farm style dish, served in a large ceramic rice bowl for one to experience how the early local dwellers might have enjoyed this simple yet joyful lunch. Enjoy a special unique wedding ceremony with your fellow traveller members to fully understand the old and traditional Taiwanese Festival. Next, head to a traditional tea cultural centre before proceeding to Kaohsiung’s latest amusement parks, Taroko Park and Suzuka Circuit Park. Get to enjoy a complimentary Ferris wheel ride and have fun trying other rides at your own expense.  



DAY 5 KAOHSIUNG 
Breakfast/ Dashu Pineapple Set Lunch/Chien Yen Steamboat Buffet Dinner

Today, visit a lingzhi specialty centre before heading to Dashu District in Kaohsiung to learn about the lifestyle of the locals and the process of growing pineapples. You will be able to hand-pick locally produced pineapples and savour a simple Dashu pineapple set lunch. Next, make your way to Fo Guang Shan Buddha Museum, the largest Buddhist complex in Taiwan.  Thereafter, head to Meinong Hakka Village to experience Taiwan Hakka culture and learn to make Hakka Lei Cha, a healthy tea-based beverage which the Hakka nobles used to serve as tea to their important guests. This evening, explore immerse yourself in the Shinkuchan Commercial District, also known as Newjuejiang Shopping Area, Kaohsiung’s famed shopping area and epicentre of the city’s youth culture to shop and people watch.



DAY 6 KAOHSIUNG - TAIPEI 
Breakfast/Lunch

After breakfast, departs to Taipei, the vibrant city. Upon arrival, make a stop at a Pixiu Exhibition Center. Next, explore Ximending, the most popular shopping spot for you to shop till drop! You can also purchase Pineapple cookies here as a gift souvenir for your family and friends.



DAY 7 TAIPEI – SINGAPORE 
Breakfast/Meals On Board

Today, get a free One Day Unlimited MRT Pass to explore the Taipei city. With a rich tapestry of cultural sites, charming suburbs, bustling streetlife and hospitable inhabitants, Taipei has well earned its reputation of one of Asia’s most liveable cities. Spend your day at leisure exploring all that it has to offer. Visit Tamsui at your own expense, taking a leisurely jaunt down historic Tamsui Old Street to sample its famous iron eggs and browse for curious. Alternatively, immerse yourself in the vibrant ambience at East Taipei. If time permits, you can do some last-minute shopping before you transfer to the airport for your flight home. 
')
INSERT [dbo].[tblTour] ([TourID], [TourName], [TourDesc], [TourPrice], [TourStartDate], [TourEndDate], [TourDuration], [TourImageSource], [TourCountry], [TourRegion], [TourSummary], [TourItinerary]) VALUES (N'VTN001', N'VIETNAM TOUR', N'6D5N NORTHERN VIETNAM AND SAPA', CAST(2600.00 AS Decimal(10, 2)), CAST(N'2017-11-01' AS Date), CAST(N'2018-06-01' AS Date), 6, N'pack://application:,,,/Resources/Images/Tour12.jpg
', N'Vietnam', N'Southeast', N'Want to know more about Vietnam? This tour is just for you!

Highlights include:

1) Hanoi: Ho Chi Minh Mausoleum (photostop), One Pillar Pagoda, Hoan Kiem Lake, Ngoc Son Temple ,Temple of Literature, Old Quarter, Overnight train ride to Lao Cai

2) Sapa: Fansipan, Local market, Moung Hoa Valley, Lao Cai and Cat Cat minority villages, Silver Waterfall', N'6D5N NORTHERN VIETNAM AND SAPA


DAY 1 SINGAPORE - HANOI 
Meals On Board/Dinner

3pm: Assemble at Singapore Changi Airport for your flight to Vietnam’s capital, Hanoi. 

7pm: Upon arrival, check in to your hotel.



DAY 2 HANOI - LAO CAI 
Breakfast/Vietnamese Buffet Lunch/Dinner

9am: This morning, embark on a city tour of Hanoi, including Ho Chi Minh Mausoleum, One Pillar Pagoda, Hoan Kiem Lake, Ngoc Son Temple and Temple of Literature. 

1pm: Next, proceed to the Old Quarter for some shopping before enjoying a traditional Vietnamese  water  puppet  show.   

6pm: After dinner, transfer to Hanoi train station for your overnight train ride to Lao Cai, the border town between China and Vietnam.

 

DAY 3 LAO CAI - SAPA 
Breakfast/Lunch/Dinner

7am: Arrive in Lao Cai in the early morning and take a short connecting coach to Sapa. If weather permits, you can view Vietnam’s tallest mountain Fansipan, which rises 3,143 metres above the sea. 

9am: After breakfast, take a stroll to the local  market to  shop for fresh local produce and handicrafts. 

1pm: Next, visit Moung Hoa Valley, Lao Cai and Cat Cat minority villages and explore the villagers’ lifestyles, housing structures and simple way of life. Continue to trek across wooden bridges tucked away in the valley. If weather permits, marvel at the hidden Silver Waterfall and its magnificent rapids.



DAY 4 SAPA - LAO CAI - HANOI 
Breakfast/Sapa Speciality Lunch/Dinner

9am: After breakfast, continue your trek to another minority village where you can witness the entire rice–growing process in the vast fields. See the various minority groups and their different costumes. You can even purchase small pieces of handmade silver jewellery or handicrafts for keepsakes. 

1pm: After lunch, coach back to Lao Cai where you can walk right to the border of Vietnam and Yunnan to take some photographs.

6pm: After dinner, proceed to Lao Cai train station for your overnight train ride back to Hanoi.



DAY 5 HANOI - HALONG BAY - HANOI 
Breakfast/Halong Bay Cruise Seafood Lunch/ Vietnamese Buffet Dinner

7am: Arrive in Hanoi in the early morning and proceed with your breakfast before continuing to UNESCO World Heritage Site, Halong Bay. 

8am: Upon arrival, take a leisure cruise to tour Halong Bay and see more than 3,000 limestone grottos rising out of the bay. Explore the impressive stalactites and stalagmites in Thien Cung and Dau Go limestone grottos. 

1pm: Enjoy a Halong Bay cruise seafood lunch before returning to Hanoi.



DAY 6 HANOI - SINGAPORE 
Breakfast/Meals On Board

9am: If time permits, you can do some last-minute shopping before you transfer to the airport for your flight home.')
USE [master]
GO
ALTER DATABASE [APPD_CA2] SET  READ_WRITE 
GO
