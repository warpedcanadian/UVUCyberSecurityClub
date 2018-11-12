CREATE TABLE Customer(
	CustID int not null auto_increment primary key,
	CustFName varchar(20),
	CustLName varchar(30),
	CustAddress varchar(100),
	CustCity varchar(50),
	CustState varchar(50),
	CustZip INT(5),
	Username varchar(50),
	Password varchar(100),
	Email varchar(100),
	PhoneNumber varchar(13),
	SocialSecurity varchar(9),
	PassHash varchar(40)
);

CREATE TABLE PaymentInfo(
	PaymentID int not null auto_increment primary key,
	CardNumber bigint(30),
	NameOnCard varchar(50),
	ExpirationDate DATE,
	PaymentType varchar(20)
);

CREATE TABLE Product(
	PrdID int not null auto_increment primary key,
	PrdName varchar(100),
	PrdDescription TEXT,
	PrdCost varchar(25)	
);

CREATE TABLE Hotel(
	BuildingID int not null auto_increment primary key,
	City varchar(50),
	Zip int(5)	
);

CREATE TABLE Room(
    RoomID int not null auto_increment primary key,
    RoomNum INT,
    RoomType VARCHAR(50),
    NumBeds int,
    BedType VARCHAR(50),
	BuildingID int,
    FOREIGN KEY (BuildingID) REFERENCES Hotel (BuildingID)
);

create table RoomAmenities(
    AmenityID int not null auto_increment primary key,
    AmenityName VARCHAR(50),
	RoomID int,
    foreign key (RoomID) references Room(RoomID)
);

create table Reservation(
	RestID int not null auto_increment primary key,
    DateStart date,
    DateEnd Date,
    BuildingLocation VARCHAR(100),
    BuildingZip int(5),
	BuildingID int,
    foreign key (BuildingID) references Hotel(BuildingID)
);

create table RoomsReserved(
	foreign key (RestID) references Reservation(RestID),
    foreign key (RoomID) references Room(RoomID),
    primary key (RoomID, RestID),
	RoomID int,
	RestID int
);

create table Orders(
	OrderID int not null auto_increment primary key,
    OrdCost varchar(20),
    OrdTax varchar(20),
	PaymentID int,
	CustID int,
	RestID int,
    foreign key (PaymentID) references PaymentInfo(PaymentID),
    foreign key (CustID) references Customer(CustID),
    foreign key (RestID) references Reservation(RestID)
);

create table ProdcutsForOrder(
	foreign key (OrderID) references Orders(orderID) on delete restrict,
    foreign key (PrdID) references Product(PrdID) on delete restrict,
    primary key (PrdID, OrderID),
	OrderID int,
	PrdID int
);
