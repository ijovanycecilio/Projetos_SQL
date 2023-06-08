-- Create a database for the e-commerce scenario.

create database ecommerce;
use ecommerce;

-- create a table client

create table client(
	IdClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Adress varchar(30),
    constraint unique_cpf_client unique(CPF),
    
);
    
-- create a table product 

create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10),
    classification_kids bool default false,
    category enum('Eletronic','Dress','Play','foods','utensils'), not null,
    avaliation float,
    size varchar(10),
    constraint unique_cpf_client unique(CPF),
);

-- create a table payment

create table payment(
	idClient int,
    idPayment int,
    typePayment enum('Cash','Card','two cards'),
    limitAvailable float,
    primary key(idclient,idPayment)

);


-- create a table orders

create table orders(
	idOrders int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelled','Confirmed','In Process'), default ' In process',
    orderDescription varchar(255),
    sendValue float default 10,
    idPayment
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)

);

-- create a table Storage

create table productStorage(
	idProdStorage int auto_increment primary key,
	storageLocation varchar(255),
	quantify int default 0

);

-- create a table supplier

create table supplier(
	idSupplier int auto_increment primary key,
	SocialName varchar(255) not null,
	CNPJ char(15) not null,
	constraint unique_supplier unique (CNPJ)

);
-- create a table Seller

create table seller (
	idseller int auto_increment primary key,
	SocialName Vaarchar(255) not null,
	AbsName varchar(255),
	CNPJ char(15),
	CPF char(9),
	location varchar(255),
	contact char(11) not null,
	constraint unique_cpf_seller unique (CPF)

);

-- create a table productSeller

create table productSeller(
	idSeller int,
	idProduct int,
	prodQuantity int default 1,
	primary key (idPseller, idProduct),
	constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
	constraint fk_product_product foreign key (idProduct) references product(idProduct)

);

