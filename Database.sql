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
	PhoneNumber int(13)
);

CREATE TABLE PaymentInfo(
	PaymentID int not null auto_increment primary key,
	CardNumber int,
	NameOnCard varchar(50),
	ExpirationDate DATE,
	PaymentType varchar(20)
);

CREATE TABLE Product(
	PrdID int not null auto_increment primary key,
	PrdName varchar(100),
	PrdDescription TEXT,
	PrdCost decimal(10,2)	
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
    FOREIGN KEY BuildingID(BuildingID) REFERENCES Hotel(BuildingID) ON DELETE RESTRICT
);

create table RoomAmenities(
    AmenityID int not null auto_increment primary key,
    AmenityName VARCHAR(50),
    foreign key RoomID(RoomID) references Room(RoomID) on delete restrict
);

create table Reservation(
	RestID int not null auto_increment primary key,
    DateStart date,
    DateEnd Date,
    BuildingLocation VARCHAR(100),
    BuildingZip int(5),
    foreign key BuildingID(BuildingID) references Hotel(BuildingID)
);

create table RoomsReserved(
	foreign key RestID(RestID) references Reservation(RestID) on delete restrict,
    foreign key RoomID(RoomID) references Room(RoomID) on delete restrict,
    primary key (RoomID, RestID)
);

create table Orders(
	OrderID int not null auto_increment primary key,
    OrdCost decimal(10,2),
    OrdTax decimal(10,2),
    foreign key PaymentID(PaymentID) references PaymentInfo(PaymentID),
    foreign key CustID(CustID) references CustID(CustID),
    foreign key RestID(RestID) references RestID(RestID)
);

create table ProdcutsForOrder(
	foreign key OrderID(OrderID) references Orders(orderID) on delete restrict,
    foreign key PrdID(PrdID) references Product(PrdID) on delete restrict,
    primary key (PrdID, OrderID)
);
