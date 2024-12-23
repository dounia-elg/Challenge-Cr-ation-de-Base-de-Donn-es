create database SaleOrderQuiz;

use SaleOrderQuiz;

create table Customer(
	CustomerId int not null primary key,
	CustomerFirstName varchar(50) not null,
	CustomerLastName varchar(50) not null,
	CustomerAddress varchar(50) not null,
	CustomerCity varchar(50) not null,
	CustomerPostCode char(4) null,
	CustomerPhoneNumber char(12) null
);

create table Inventory(
	InventoryID tinyint not null primary key,
	InventoryName varchar(50) not null,
	InventoryDescription varchar(255) null
);

create table Employee(
	EmployeeID tinyint not null primary key,
	EmployeeFirstName varchar(50) not null,
	EmployeeLastName varchar(50) not null,
	EmployeeExtension char(4) null
);

create table Sale(
	SaleID tinyint not null primary key,
	SaleDate date not null,
	SaleQuantity int not null,
	SalePrice decimal not null,
	CustomerID int not null,
	InventoryID tinyint not null,
	EmployeeID tinyint not null,
	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (InventoryID) references Inventory(InventoryID),
	foreign key (EmployeeID) references Employee(EmployeeID)
);

insert into Customer (CustomerId, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerPhoneNumber )
values
(1, 'Dounia', 'Elgarrai', 'Safi, Maroc', 'Safi', '4600', '0706404245'),
(2, 'Ahmed', 'Elmarjani', 'Rabat, Maroc', 'Rabat', '5700', '0987654321'),
(3, 'Amal', 'Jamili', 'Casablanca, Maroc', 'Casablanca', '8300', '045796823');

insert into Inventory (InventoryID, InventoryName, InventoryDescription)
values
(1, 'Laptop', 'A high-performance laptop for professionals'),
(2, 'Smartphone', 'A cutting-edge smartphone with many features'),
(3, 'Headphones', 'Wireless noise-canceling headphones');

insert into Employee (EmployeeID, EmployeeFirstName, EmployeeLastName, EmployeeExtension )
values
(1, 'Sara', 'Sahtani', '1234'),
(2, 'mohammed', 'Talbi', '5678'),
(3, 'Majd', 'Aalami', NULL);

insert into Sale (SaleID, SaleDate, SaleQuantity, SalePrice, CustomerID, InventoryID, EmployeeID)
values
(1, '2024-12-20', 1, 999.99, 1, 1, 1),
(2, '2024-12-21', 2, 1599.98, 2, 2, 2),
(3, '2024-12-22', 3, 599.85, 3, 3, 3);

select * from Customer;

select SaleQuantity * SalePrice from Sale order by SaleQuantity * SalePrice desc;

select 
    SaleID,
    SaleDate,
    SaleQuantity,
    SalePrice,
    (SaleQuantity * SalePrice) as TotalAmount
from 
    Sale
order by 
    TotalAmount desc;
   
alter table Customer add CustomerEmail varchar(100) null;

update Customer
set CustomerEmail = 'dounia@gmail.com'
where CustomerID = 1;

delete from Customer where CustomerCity = 'New York';









