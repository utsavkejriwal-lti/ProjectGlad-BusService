

Create Database TraWellDummy
Go
USE [TraWellDummy]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[isActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(101,1) NOT NULL,
	[UserRegistered] [int] NOT NULL,
	[UserId] [int] NULL,
	[GuestId] [int] NULL,
	[BookingDate] [datetime] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[TripId] [int] NOT NULL,
	[Boarding] [varchar](5) NOT NULL,
	[Arrival] [varchar](5) NOT NULL,
	[Feedback] [varchar](100) NULL,
	[Amount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[Id] [int] IDENTITY(101,1) NOT NULL,
	[Number] [varchar](10) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Seats] [int] NOT NULL,
	[Admin] [int] NOT NULL,
	[hasAc] [int] NOT NULL,
	[hasWifi] [int] NOT NULL,
	[isRecliner] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestUsers]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contact] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassengerDetails]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassengerDetails](
	[BookingID] [int] NOT NULL,
	[Seat] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](6) NOT NULL,
 CONSTRAINT [PassengerDetails_pk] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[Seat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[Code] [varchar](5) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[Id] [int] IDENTITY(101,1) NOT NULL,
	[Source] [varchar](5) NOT NULL,
	[Destination] [varchar](5) NOT NULL,
	[Admin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stops]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stops](
	[RouteID] [int] NOT NULL,
	[Stop] [varchar](5) NOT NULL,
	[DistanceFromOrigin] [float] NOT NULL,
 CONSTRAINT [PK_STOPS] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC,
	[Stop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [int] IDENTITY(1001,1) NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[BookingID] [int] NOT NULL,
	[Mode] [varchar](20) NOT NULL,
	[TransType] [varchar](6) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusID] [int] NOT NULL,
	[RouteID] [int] NOT NULL,
	[Admin] [int] NOT NULL,
	[CostPerKm] [float] NOT NULL,
	[Status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripStops]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripStops](
	[TripId] [int] NOT NULL,
	[Stop] [varchar](5) NOT NULL,
	[ArrivalTime] [datetime] NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TRIPSTOPS] PRIMARY KEY CLUSTERED 
(
	[TripId] ASC,
	[Stop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25-09-2020 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Contact] [varchar](30) NOT NULL,
	[Wallet] [int] NOT NULL,
	[DOB] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Gender] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (1, N'utsav', N'utsav1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (2, N'pranav', N'pranav1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (3, N'vipashyana', N'vipashyana1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (4, N'bhanu', N'bhanu1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (5, N'akash', N'akash1234', 0)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (104, 1, 1, NULL, CAST(N'2020-09-20T12:00:00.000' AS DateTime), N'booked', 1, N'ANDV', N'KRNL', NULL, 438)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (105, 1, 3, NULL, CAST(N'2020-09-20T12:00:01.000' AS DateTime), N'cancelled', 2, N'SSVC', N'KASH', NULL, 575)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (106, 1, 5, NULL, CAST(N'2020-09-20T12:00:02.000' AS DateTime), N'booked', 2, N'AMBC', N'KASH', NULL, 472.5)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (107, 0, NULL, 3, CAST(N'2020-09-20T12:00:03.000' AS DateTime), N'booked', 1, N'KRNL', N'SFTC', NULL, 294)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (101, N'MH-TR0045', N'Queen Ranger', 25, 4, 1, 1, 1)
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (102, N'KA-ZZ3004', N'Blue Coach', 10, 3, 1, 0, 0)
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (103, N'MH-TW0007', N'Thunder Bolt', 25, 2, 1, 1, 1)
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (104, N'PA-GO1010', N'SEA VIEW', 30, 1, 1, 0, 1)
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (105, N'AP-TW6446', N'Deccan Throne', 20, 5, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Buses] OFF
GO
SET IDENTITY_INSERT [dbo].[GuestUsers] ON 

INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (1, N'ritesh123@gmail.com', N'9638527410')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (2, N'dineshk889@xyz.com', N'6874598520')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (3, N'radhika1997@yahoo.com', N'7747889878')
SET IDENTITY_INSERT [dbo].[GuestUsers] OFF
GO
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (104, 5, N'Rohan Desai', 26, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (104, 6, N'Saraswati Desai', 50, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (105, 3, N'Rahul Raj', 35, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (105, 4, N'Anshuman Kumar', 40, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (106, 5, N'Prachi Agarwal', 24, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (106, 6, N'Ruchi Agarwal', 55, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (107, 7, N'Vaibhav Thakur', 23, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (107, 8, N'Swapnil Singh', 23, N'Male')
GO
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'ADNR', N'Adarsh Nagar', N'Ghaziabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'AMBC', N'Ambala City Bus Stand', N'Ambala')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'AMRV', N'Amravati Isbt', N'Amravati')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'ANDV', N'Anand Vihar Isbt', N'Delhi')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'ARBD', N'Aurangabad Bus Stand', N'Aurangabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'BHIM', N'Bhim Nagar Bus Stand', N'Surat')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'BNDR', N'Bandra Bus Stand', N'Mumbai')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'DDNB', N'Dehradun Isbt', N'Dehradun')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'DHRM', N'Dharam Nagar Bus Stand', N'Surat')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'GRGN', N'Gurgaon Isbt', N'Gurgaon')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'GZBD', N'Ghaziabad Isbt', N'Ghaziabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'HUDA', N'Huda Bus Stand', N'Panipat')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'JAPR', N'Jaipur Isbt', N'Jaipur')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'KASH', N'Kashmere Gate Isbt', N'Delhi')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'KCAM', N'Kalka Chowk Bus Stop', N'Ambala')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'KRNL', N'Karnal Bus Stand', N'Karnal')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MNNR', N'Mani Nagar Bus Stand', N'Ahmedabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MNPA', N'Manapa Bus Stand', N'Pune')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MRTL', N'Maratoli Bus Stand', N'Nagpur')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MSRT', N'Msrtc', N'Pune')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MZFN', N'Muzaffar Nagar Bus Stand', N'Muzzaffarnagar')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'NGPR', N'Nagpur Isbt', N'Nagpur')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'NVMB', N'Navi Mumbai Bus Stand', N'Navi Mumbai')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'PMNR', N'Prem Nagar', N'Dehradun')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'PNPT', N'Panipat Bus Stand', N'Panipat')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'RRKE', N'Roorkee Bus Stand', N'Roorkee')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'RWRI', N'Rewari Isbt', N'Rewari')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'SFTC', N'Sector 43 Isbt', N'Chandigarh')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'SHVJ', N'Shivaji Bus Terminal', N'Mumbai')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'SRNG', N'Sarangpur Isbt', N'Ahmedabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'SSVC', N'Sector 17 Isbt', N'Chandigarh')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'TLKN', N'Tilak Nagar Bus Stand', N'Mumbai')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'VDDR', N'Vadodara Bus Stand', N'Vadodara')
GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (101, N'ANDV', N'SFTC', 1)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (102, N'SFTC', N'ANDV', 1)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (103, N'PMNR', N'JAPR', 2)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (104, N'JAPR', N'PMNR', 2)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (105, N'BNDR', N'NGPR', 3)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (106, N'NGPR', N'BNDR', 3)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (107, N'SHVJ', N'SRNG', 4)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (108, N'SRNG', N'SHVJ', 4)
SET IDENTITY_INSERT [dbo].[Routes] OFF
GO
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'AMBC', 199)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'ANDV', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'HUDA', 73)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KASH', 10)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KCAM', 203)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KRNL', 146)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'PNPT', 70)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'SFTC', 244)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'SSVC', 240)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'AMBC', 45)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'ANDV', 244)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'HUDA', 171)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KASH', 234)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KCAM', 41)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KRNL', 98)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'PNPT', 174)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'SFTC', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'SSVC', 4)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'ADNR', 215)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'ANDV', 257)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'DDNB', 5)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'GRGN', 300)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'GZBD', 212)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'JAPR', 519)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'KASH', 247)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'MZFN', 147)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'PMNR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'RRKE', 70)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'RWRI', 410)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'ADNR', 304)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'ANDV', 262)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'DDNB', 514)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'GRGN', 219)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'GZBD', 307)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'JAPR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'KASH', 272)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'MZFN', 372)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'PMNR', 519)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'RRKE', 449)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'RWRI', 109)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'AMRV', 709)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'ARBD', 391)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'BNDR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MNPA', 155)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MRTL', 840)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MSRT', 146)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'NGPR', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'NVMB', 63)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'SHVJ', 21)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'TLKN', 34)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'AMRV', 138)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'ARBD', 456)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'BNDR', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MNPA', 692)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MRTL', 7)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MSRT', 701)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'NGPR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'NVMB', 784)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'SHVJ', 826)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'TLKN', 813)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'BHIM', 230)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'DHRM', 235)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'MNNR', 530)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'SHVJ', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'SRNG', 538)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'TLKN', 13)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'VDDR', 386)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'BHIM', 308)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'DHRM', 303)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'MNNR', 8)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'SHVJ', 538)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'SRNG', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'TLKN', 525)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'VDDR', 152)
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1004, CAST(438 AS Decimal(18, 0)), 104, N'Card', N'Credit', CAST(N'2020-09-20T12:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1005, CAST(575 AS Decimal(18, 0)), 105, N'Card', N'Credit', CAST(N'2020-09-20T12:00:01.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1006, CAST(473 AS Decimal(18, 0)), 106, N'Net Banking', N'Credit', CAST(N'2020-09-20T12:00:02.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1007, CAST(294 AS Decimal(18, 0)), 107, N'Card', N'Credit', CAST(N'2020-09-20T12:00:03.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1008, CAST(575 AS Decimal(18, 0)), 105, N'Wallet', N'Debit', CAST(N'2020-09-21T15:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (1, 103, 101, 1, 3, N'Completed')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (2, 101, 102, 2, 2.5, N'Scheduled')
SET IDENTITY_INSERT [dbo].[Trips] OFF
GO
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'AMBC', CAST(N'2020-09-24T15:45:00.000' AS DateTime), CAST(N'2020-09-24T15:55:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'ANDV', CAST(N'2020-09-24T10:00:00.000' AS DateTime), CAST(N'2020-09-24T10:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'HUDA', CAST(N'2020-09-24T12:30:00.000' AS DateTime), CAST(N'2020-09-24T12:35:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'KASH', CAST(N'2020-09-24T10:30:00.000' AS DateTime), CAST(N'2020-09-24T10:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'KRNL', CAST(N'2020-09-24T14:05:00.000' AS DateTime), CAST(N'2020-09-24T14:15:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'SFTC', CAST(N'2020-09-24T17:40:00.000' AS DateTime), CAST(N'2020-09-24T17:40:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'SSVC', CAST(N'2020-09-24T17:15:00.000' AS DateTime), CAST(N'2020-09-24T17:20:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'AMBC', CAST(N'2020-09-26T20:30:00.000' AS DateTime), CAST(N'2020-09-26T21:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'KASH', CAST(N'2020-09-27T01:30:00.000' AS DateTime), CAST(N'2020-09-27T01:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'KCAM', CAST(N'2020-09-26T19:50:00.000' AS DateTime), CAST(N'2020-09-26T20:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'KRNL', CAST(N'2020-09-26T23:30:00.000' AS DateTime), CAST(N'2020-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'SSVC', CAST(N'2020-09-26T18:30:00.000' AS DateTime), CAST(N'2020-09-26T18:30:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (1, N'Saraswati', N'Desai', N'saras@gmail.com', N'Newuser@123', N'9877665543', 0, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (2, N'Rahul', N'Mennon', N'raMen@gmail.com', N'Raser@123', N'9876342234', 1500, CAST(N'1996-06-09T00:00:00.000' AS DateTime), N'C255,Sector 63 Noida, UttarPradesh', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (3, N'Nitesh', N'Agarwal', N'nits@yahoo.com', N'Nittu@13', N'9768554563', 1250, NULL, N'149,Kalachowki Cotten Gress,Tank Road,Mumbai,Maharashtra', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (4, N'Dristi', N'Das', N'sird@gmail.com', N'123#dris', N'9687567533', 0, CAST(N'1989-03-08T00:00:00.000' AS DateTime), N'485,Shwetamansion,mumcircle,Bangalore,Karnataka', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (5, N'Shitala', N'Sharma', N'shital@gmail.com', N'shi@1234', N'9987612345', 150, CAST(N'1977-10-06T00:00:00.000' AS DateTime), NULL, N'Female')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__536C85E46DD94802]    Script Date: 25-09-2020 14:21:30 ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Buses__78A1A19D930069BA]    Script Date: 25-09-2020 14:21:30 ******/
ALTER TABLE [dbo].[Buses] ADD UNIQUE NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053472DA0AE2]    Script Date: 25-09-2020 14:21:30 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F7C046655804FCD2]    Script Date: 25-09-2020 14:21:30 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((1)) FOR [UserRegistered]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([GuestId])
REFERENCES [dbo].[GuestUsers] ([Id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD FOREIGN KEY([Admin])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[PassengerDetails]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD FOREIGN KEY([Admin])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD FOREIGN KEY([Destination])
REFERENCES [dbo].[Places] ([Code])
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD FOREIGN KEY([Source])
REFERENCES [dbo].[Places] ([Code])
GO
ALTER TABLE [dbo].[Stops]  WITH CHECK ADD FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[Stops]  WITH CHECK ADD FOREIGN KEY([Stop])
REFERENCES [dbo].[Places] ([Code])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD FOREIGN KEY([Admin])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD FOREIGN KEY([BusID])
REFERENCES [dbo].[Buses] ([Id])
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[TripStops]  WITH CHECK ADD FOREIGN KEY([Stop])
REFERENCES [dbo].[Places] ([Code])
GO
ALTER TABLE [dbo].[TripStops]  WITH CHECK ADD FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD CHECK  (([isActive]=(1) OR [isActive]=(0)))
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD CHECK  (([UserRegistered]=(0) OR [UserRegistered]=(1)))
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD CHECK  (([TransType]='Credit' OR [TransType]='Debit'))
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD CHECK  (([CostPerkm]>(0)))
GO
