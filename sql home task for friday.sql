create database kontakthome
use kontakthome

Create table Category(
Id int primary key identity,
Name varchar(255)
)

insert into Category
values ('Smartphones'),('Tablet'),('Headphones')


Create table Products(
Id int primary key identity,
Name varchar(255),
CostPrice int,
SalesPrice int,
CategoryId int foreign key references Category (Id)
)

insert into Products
values ('samsung', 1450, 2100, 1),('Huawei', 2000, 2350, 1),('Xiaomi', 400, 1500, 1),('Motorolla', 00, 100, 1),('Xiaomi', 1000, 1500, 2),
('FirehD', 1300, 1700, 2),('qcy', 100, 700, 2),('Binq', 200, 500, 2),('Xiaomi', 15, 40, 3),('airpods', 100, 425, 3),('Razer', 40, 75, 3)

create table Card (
Id int primary key identity,
ProductId int foreign key references Products (Id)
)

insert into Card 
values (1),(3),(5),(6),(8)


Create Procedure CardPricesSum
As
Select Products.Name, Products.CostPrice, Category.Name as 'Category Name' from Card
Join Products on Card.ProductId = Products.Id
Join Category on Category.Id = Products.CategoryId

Exec CardPricesSum

Create Procedure CardSumPrices
As
Select Sum (Products.SalesPrice) from Card
Join Products on Card.ProductId = Products.Id


Exec CardSumPrices


Create Procedure FinallSum
As 

Exec CardSumPrices



--exec FinallySum




 CREATE VIEW AllTableinfo 
 AS
Select Products.Id,Products.Name, Products.SalesPrice, 
Products.CostPrice, Products.CategoryId, Category.Name as 'Category Name', Category.Id as 'catagory id', Card.ProductId as 'Card Products Id', Card.Id as 'Card ID' from Card
Join Products on Card.ProductId = Products.Id
Join Category on Category.Id = Products.CategoryId


Select * from AllTableinfo
go





Create Procedure InputCard @Product int
As
insert into Card
values(@Product)
go

exec InputCard @Products=4
Select * from Card


 --Create Procedure DeleteProductFromCard @Product int
--As
--Delete from Card
--where Card.ProductId = @Product


exec DeleteProductFromCard @Product = 4
Select * from Card

create Trigger AddDeleteWiewCards
On Card
After Insert, Delete
As
select * from Card