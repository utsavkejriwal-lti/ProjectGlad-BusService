create database TraWellDummy

use TraWellDummy

CREATE TABLE Admin (
    Id int Identity(1,1) primary key,
    Username varchar(20)  NOT NULL unique,
    Password varchar(20)  NOT NULL,
	isActive int check (isActive in (0,1)) default 1
)

CREATE TABLE Users (
    Id int  Identity(1,1) primary key,
    FirstName varchar(30)  NOT NULL,
    LastName varchar(30)  NOT NULL,
    Email varchar(50)  NOT NULL unique,
    Password varchar(30)  NOT NULL,
    Contact varchar(30)  NOT NULL unique,
    Wallet int  NOT NULL,
    DOB datetime,
    Address varchar(100),
    Gender varchar(6)
)

CREATE TABLE GuestUsers (
    Id int  Identity(1,1) primary key,
    Email varchar(50)  NOT NULL,
    Contact varchar(30)  NOT NULL
)

CREATE TABLE Places (
    Code varchar(5) primary key,
    Name varchar(100)  NOT NULL,
    City varchar(50)  NOT NULL
)

CREATE TABLE Routes (
    Id integer  Identity(101,1) primary key,
    Source varchar(5)  NOT NULL foreign key references Places(Code),
    Destination varchar(5)  NOT NULL foreign key references Places(Code),
    Admin int  NOT NULL foreign key references Admin(Id)
)

CREATE TABLE Stops (
    RouteID integer  foreign key references Routes(Id),
    Stop varchar(5)  foreign key references Places(Code),
    DistanceFromOrigin float  NOT NULL
    CONSTRAINT PK_STOPS PRIMARY KEY (RouteID,Stop)
)

CREATE TABLE Buses (
    Id int  Identity(101,1) primary key,
    Number varchar(10)  NOT NULL unique,
	Name varchar(20) NOT NULL,
    Seats int  NOT NULL,
    Admin int  NOT NULL foreign key references Admin(Id),
	hasAc int NOT NULL,
	hasWifi int NOT NULL,
	isRecliner int NOT NULL
)



CREATE TABLE Trips (
    Id integer  Identity(1,1) primary key,
    BusID integer  NOT NULL foreign key references Buses(Id),
    RouteID integer  NOT NULL foreign key references Routes(Id),
    Admin integer  NOT NULL foreign key references Admin(Id),
	CostPerKm float not null check (CostPerkm > 0),
	Status varchar(20) not null
)



CREATE TABLE TripStops (
    TripId int  foreign key references Trips(Id) ,
    Stop varchar(5)  NOT NULL foreign key references Places(Code),
    ArrivalTime datetime  NOT NULL,
    DepartureTime datetime  NOT NULL
	CONSTRAINT PK_TRIPSTOPS PRIMARY KEY (TripId,Stop)
)

CREATE TABLE Bookings (
    BookingID int Identity(101,1) primary key,
    UserRegistered int  NOT NULL check(UserRegistered in (1,0)) default 1,
    UserId int  foreign key references Users(Id),
    GuestId int foreign key references GuestUsers(Id),
    BookingDate datetime  NOT NULL,
    Status integer  NOT NULL,
    TripId int  NOT NULL foreign key references Trips(Id),
    Boarding varchar  NOT NULL,
    Arrival varchar  NOT NULL,
    Feedback varchar  NOT NULL
)

Alter table Bookings
add Amount float not null

CREATE TABLE PassengerDetails (
    BookingID integer  NOT NULL foreign key references Bookings(BookingID),
    Seat int  NOT NULL,
    Name varchar(30)  NOT NULL,
    Age int  NOT NULL,
    Gender varchar(5)  NOT NULL,
    CONSTRAINT PassengerDetails_pk PRIMARY KEY (BookingID,Seat)
)

CREATE TABLE Transactions (
    id integer  Identity(1001,1) primary key,
    amount decimal  NOT NULL,
    BookingID integer  NOT NULL foreign key references Bookings(BookingID),
    Mode varchar(10)  NOT NULL,
	TransType varchar(6) NOT NULL check(TransType in ('Debit','Credit'))
)




/* Admin */
select * from Admin


/* Users */
select * from Users

INSERT INTO Users(FirstName, LastName, Gender, Email, Password,DOB,Contact,Address,Wallet)
VALUES ('Saraswati', 'Desai', 'Female','saras@gmail.com', 'Newuser@123', '10-11-1998',987766554, 'Kalighat,WardNo.7 new jalpaiguri,West Bengal',0.00),
('Rahul', 'Mennon', 'male','raMen@gmail.com', 'Raser@123', '06-09-1996',9876342234,'C255,Sector 63 Noida, UttarPradesh',1500.00),
('Nitesh', 'Agarwal', 'male','nits@yahoo.com', 'Nittu@13', '10-01-1982',9768554563,'149,Kalachowki Cotten Gress,Tank Road,Mumbai,Maharashtra',1250),
('Dristi', 'Das', 'Female','sird@gmail.com', '123#dris', '03-08-1989',9687567533,'485,Shwetamansion,mumcircle,Bangalore,Karnataka',0.00),
('Shitala', 'Sharma', 'Female','shital@gmail.com', 'shi@1234', '10-06-1977',9987612345,'B-24,Dhanlaxmi Chambers,Thane,Mumbai,Maharahtra',150.00)

/* Guest Users */
select * from GuestUsers

insert into GuestUsers
values
('ritesh123@gmail.com','9638527410'),
('dineshk889@xyz.com','6874598520'),
('radhika1997@yahoo.com','7747889878')

/*Places*/
select * from Places

insert into Places 
values 
('ADNR','Adarsh Nagar','Ghaziabad'),
('AMBC','Ambala City Bus Stand','Ambala'),
('AMRV','Amravati Isbt','Amravati'),
('ANDV','Anand Vihar Isbt','Delhi'),
('ARBD','Aurangabad Bus Stand','Aurangabad'),
('BHIM','Bhim Nagar Bus Stand','Surat'),
('BNDR','Bandra Bus Stand','Mumbai'),
('DDNB','Dehradun Isbt','Dehradun'),
('DHRM','Dharam Nagar Bus Stand','Surat'),
('GRGN','Gurgaon Isbt','Gurgaon'),
('GZBD','Ghaziabad Isbt','Ghaziabad'),
('HUDA','Huda Bus Stand','Panipat'),
('JAPR','Jaipur Isbt','Jaipur'),
('KASH','Kashmere Gate Isbt','Delhi'),
('KCAM','Kalka Chowk Bus Stop','Ambala'),
('KRNL','Karnal Bus Stand','Karnal'),
('MNNR','Mani Nagar Bus Stand','Ahmedabad'),
('MNPA','Manapa Bus Stand','Pune'),
('MRTL','Maratoli Bus Stand','Nagpur'),
('MSRT','Msrtc','Pune'),
('MZFN','Muzaffar Nagar Bus Stand','Muzzaffarnagar'),
('NGPR','Nagpur Isbt','Nagpur'),
('NVMB','Navi Mumbai Bus Stand','Navi Mumbai'),
('PMNR','Prem Nagar','Dehradun'),
('PNPT','Panipat Bus Stand','Panipat'),
('RRKE','Roorkee Bus Stand','Roorkee'),
('RWRI','Rewari Isbt','Rewari'),
('SFTC','Sector 43 Isbt','Chandigarh'),
('SHVJ','Shivaji Bus Terminal','Mumbai'),
('SRNG','Sarangpur Isbt','Ahmedabad'),
('SSVC','Sector 17 Isbt','Chandigarh'),
('TLKN','Tilak Nagar Bus Stand','Mumbai'),
('VDDR','Vadodara Bus Stand','Vadodara')


/* Routes */
select * from Routes

insert into Routes 
values
('ANDV','SFTC',1),
('SFTC','ANDV',1),
('PMNR','JAPR',2),
('JAPR','PMNR',2),
('BNDR','NGPR',3),
('NGPR','BNDR',3),
('SHVJ','SRNG',4),
('SRNG','SHVJ',4)

/* Stops */
select s.RouteID, s.Stop, p.Name, p.City, s.DistanceFromOrigin 
from Stops s, Places p 
where p.Code = s.Stop and s.RouteID = 102 
order by s.DistanceFromOrigin

insert into Stops
values
(101,'ANDV',0),
(101,'KASH',10),
(101,'PNPT',70),
(101,'HUDA',73),
(101,'KRNL',146),
(101,'AMBC',199),
(101,'KCAM',203),
(101,'SSVC',240),
(101,'SFTC',244),
(102,'ANDV',244),
(102,'KASH',234),
(102,'PNPT',174),
(102,'HUDA',171),
(102,'KRNL',98),
(102,'AMBC',45),
(102,'KCAM',41),
(102,'SSVC',4),
(102,'SFTC',0),
(103,'PMNR',0),
(103,'DDNB',5),
(103,'RRKE',70),
(103,'MZFN',147),
(103,'GZBD',212),
(103,'ADNR',215),
(103,'KASH',247),
(103,'ANDV',257),
(103,'GRGN',300),
(103,'RWRI',410),
(103,'JAPR',519),
(104,'PMNR',519),
(104,'DDNB',514),
(104,'RRKE',449),
(104,'MZFN',372),
(104,'GZBD',307),
(104,'ADNR',304),
(104,'KASH',272),
(104,'ANDV',262),
(104,'GRGN',219),
(104,'RWRI',109),
(104,'JAPR',0),
(105,'BNDR',0),
(105,'SHVJ',21),
(105,'TLKN',34),
(105,'NVMB',63),
(105,'MSRT',146),
(105,'MNPA',155),
(105,'ARBD',391),
(105,'AMRV',709),
(105,'MRTL',840),
(105,'NGPR',847),
(106,'BNDR',847),
(106,'SHVJ',826),
(106,'TLKN',813),
(106,'NVMB',784),
(106,'MSRT',701),
(106,'MNPA',692),
(106,'ARBD',456),
(106,'AMRV',138),
(106,'MRTL',7),
(106,'NGPR',0),
(107,'SHVJ',0),
(107,'TLKN',13),
(107,'BHIM',230),
(107,'DHRM',235),
(107,'VDDR',386),
(107,'MNNR',530),
(107,'SRNG',538),
(108,'SHVJ',538),
(108,'TLKN',525),
(108,'BHIM',308),
(108,'DHRM',303),
(108,'VDDR',152),
(108,'MNNR',8),
(108,'SRNG',0)

/* Trips */
select * from Trips

select * from Buses
