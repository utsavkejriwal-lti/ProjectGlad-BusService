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
    Feedback varchar  NOT NULL,
)

Alter table Bookings
add Amount float not null

alter table bookings
alter column Boarding varchar(5) not null

alter table bookings
alter column Arrival varchar(5) not null
alter table bookings
alter column Feedback varchar(100) null
alter table bookings
alter column Status varchar(10) not null



CREATE TABLE PassengerDetails (
    BookingID integer  NOT NULL foreign key references Bookings(BookingID),
    Seat int  NOT NULL,
    Name varchar(30)  NOT NULL,
    Age int  NOT NULL,
    Gender varchar(5)  NOT NULL,
    CONSTRAINT PassengerDetails_pk PRIMARY KEY (BookingID,Seat)
)

alter table passengerdetails
alter column Gender varchar(6) not null

CREATE TABLE Transactions (
    id integer  Identity(1001,1) primary key,
    amount decimal  NOT NULL,
    BookingID integer  NOT NULL foreign key references Bookings(BookingID),
    Mode varchar(10)  NOT NULL,
	TransType varchar(6) NOT NULL check(TransType in ('Debit','Credit'))
)

alter table transactions
add TransactionDate datetime not null

alter table transactions
alter column Mode varchar(20) not null



/* Admin */
select * from Admin

insert into Admin values 
(1,'utsav',	'utsav1234',1),
(2,'pranav'	,'pranav1234',1),
(3,'vipashyana','vipashyana1234',1),
(4,	'bhanu',	'bhanu1234'	,1),
(5,'akash'	,'akash1234',0)

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

insert into Trips values (103,101,1,3,'Completed'),(101,102,2,2.5,'Scheduled')

/* Trip Stops */
select * from TripStops

insert into TripStops values (1,'ANDV','09-24-2020 10:00:00','09-24-2020 10:00:00'),(1,'KASH','09-24-2020 10:30:00','09-24-2020 10:45:00'),(1,'HUDA','09-24-2020 12:30:00','09-24-2020 12:35:00'),(1,'KRNL','09-24-2020 14:05:00','09-24-2020 14:15:00'),(1,'AMBC','09-24-2020 15:45:00','09-24-2020 15:55:00'),(1,'SSVC','09-24-2020 17:15:00','09-24-2020 17:20:00'),(1,'SFTC','09-24-2020 17:40:00','09-24-2020 17:40:00'),(2,'SSVC','09-26-2020 18:30:00','09-26-2020 18:30:00'),(2,'KCAM','09-26-2020 19:50:00','09-26-2020 20:00:00'),(2,'AMBC','09-26-2020 20:30:00','09-26-2020 21:30:00'),(2,'KRNL','09-26-2020 23:30:00','09-27-2020 00:00:00'),(2,'KASH','09-27-2020 01:30:00','09-27-2020 01:30:00')


/* Buses */
select * from Buses


INSERT INTO Buses (Number, Name, Seats,Admin, hasAc,hasWIFI,isRecliner)
values('MH-TR0045', 'Queen Ranger',25,4,1,1,1),
('KA-ZZ3004','Blue Coach',10,3,1,0,0),
('MH-TW0007','Thunder Bolt',25,2,1,1,1),
('PA-GO1010','SEA VIEW',30,1,1,0,1),
('AP-TW6446','Deccan Throne',20,5,0,0,1)

/* Bookings */
select * from Bookings

insert into Bookings values (1,1,null,'09-20-2020 12:00:00','booked',1,'ANDV','KRNL',null,438),(1,3,null,'09-20-2020 12:00:01','cancelled',2,'SSVC','KASH',null,575),(1,5,null,'09-20-2020 12:00:02','booked',2,'AMBC','KASH',null,472.5),(0,null,3,'09-20-2020 12:00:03','booked',1,'KRNL','SFTC',null,294)


/* Passengers */

select * from PassengerDetails

insert into PassengerDetails values (104,5,'Rohan Desai',26,'Male'),(104,6,'Saraswati Desai',50,'Female'),(105,3,'Rahul Raj',35,'Male'),(105,4,'Anshuman Kumar',40,'Male'),(106,5,'Prachi Agarwal',24,'Female'),(106,6,'Ruchi Agarwal',55,'Female'),(107,7,'Vaibhav Thakur',23,'Male'),(107,8,'Swapnil Singh',23,'Male')

/* Transactions */
select * from Transactions

insert into Transactions values (438,104,'Card','Credit','09-20-2020 12:00:00'),(575,105,'Card','Credit','09-20-2020 12:00:01'),(472.5,106,'Net Banking','Credit','09-20-2020 12:00:02'),(294,107,'Card','Credit','09-20-2020 12:00:03'),(575,105,'Wallet','Debit','09-21-2020 15:00:00')

