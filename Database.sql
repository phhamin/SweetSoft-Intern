﻿--CREATE DATABASE BookstoreSellingManagement
--GO
--USE BookstoreSellingManagement


------< User-Related Tables >------
CREATE TABLE TblUser(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
	FirstName NVARCHAR(50) NOT NULL DEFAULT(''),
	LastName NVARCHAR(100) NOT NULL DEFAULT(''),
	Birthday DATE NOT NULL DEFAULT(GETDATE()),
	Gender BIT NOT NULL DEFAULT(0),
	[Address] NVARCHAR(256) NOT NULL DEFAULT(''),
	Phone VARCHAR(20) NOT NULL DEFAULT(''),
	Email VARCHAR(256) NOT NULL DEFAULT(''),
	Avatar NVARCHAR(256) NOT NULL DEFAULT(''),

	[Username] VARCHAR(256) NOT NULL DEFAULT(''),
	[Password] VARCHAR(256) NOT NULL DEFAULT(''),

	IsActivated	BIT	NOT NULL DEFAULT(1),
	IsDeleted BIT NOT NULL DEFAULT(0),

	CreatedBy VARCHAR(256) NOT NULL DEFAULT(''),
	CreatedAt DATETIME NOT NULL DEFAULT(GETDATE()),
	UpdatedBy VARCHAR(256) NOT NULL DEFAULT(''),
	UpdatedAt DATETIME NOT NULL DEFAULT(GETDATE()),
);

CREATE TABLE TblRole(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
	[Name] NVARCHAR(256) NOT NULL DEFAULT(''),
);

CREATE TABLE TblUserRole(
	UserId UNIQUEIDENTIFIER NOT NULL,
	RoleId UNIQUEIDENTIFIER NOT NULL,

	PRIMARY KEY (UserId, RoleId),
	FOREIGN KEY (UserId) REFERENCES TblUser(Id),
	FOREIGN KEY (RoleId) REFERENCES TblRole(Id),
);


------< Book-Related Tables >------
CREATE TABLE TblCategory(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
	[Name] VARCHAR(50) NOT NULL DEFAULT(''),
	[Description] NVARCHAR(256) NOT NULL DEFAULT(''),
);

CREATE TABLE TblPublisher(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
	[Name] VARCHAR(50) NOT NULL DEFAULT(''),
	[Address] NVARCHAR(256) NOT NULL DEFAULT(''),
);

CREATE TABLE TblAuthor(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
	[Name] NVARCHAR(50) NOT NULL DEFAULT(''),
	Biography NVARCHAR(256) NOT NULL DEFAULT(''),
);

CREATE TABLE TblBook(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
	ISBN VARCHAR(15) NOT NULL DEFAULT(''),
	Title NVARCHAR(256) NOT NULL DEFAULT(''),
	Price DECIMAL(18, 2) NOT NULL DEFAULT(0),
	[Description] NVARCHAR(256) NOT NULL DEFAULT(''),
	[Image] NVARCHAR(256) NOT NULL DEFAULT(''),
	Quantity INT NOT NULL DEFAULT(0),

	IsActivated	BIT	NOT NULL DEFAULT(1),
	IsDeleted BIT NOT NULL DEFAULT(0),

	CreatedBy VARCHAR(256) NOT NULL DEFAULT(''),
	CreatedAt DATETIME NOT NULL DEFAULT(GETDATE()),
	UpdatedBy VARCHAR(256) NOT NULL DEFAULT(''),
	UpdatedAt DATETIME NOT NULL DEFAULT(GETDATE()),
);

CREATE TABLE TblBookAuthor(
	BookId UNIQUEIDENTIFIER NOT NULL,
	AuthorId UNIQUEIDENTIFIER NOT NULL,

	PRIMARY KEY (BookId, AuthorId),
	FOREIGN KEY (BookId) REFERENCES TblBook(Id),
	FOREIGN KEY (AuthorId) REFERENCES TblAuthor(Id),
);

CREATE TABLE TblBookCategory(
	BookId UNIQUEIDENTIFIER NOT NULL,
	CategoryId UNIQUEIDENTIFIER NOT NULL,

	PRIMARY KEY (BookId, CategoryId),
	FOREIGN KEY (BookId) REFERENCES TblBook(Id),
	FOREIGN KEY (CategoryId) REFERENCES TblCategory(Id),
);

CREATE TABLE TblBookPricing(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
	FromHour TIME NOT NULL DEFAULT('00:00:00'),
	ToHour TIME NOT NULL DEFAULT('00:00:00'),

	IsActivated	BIT	NOT NULL DEFAULT(1),
	IsDeleted BIT NOT NULL DEFAULT(0),

	CreatedBy VARCHAR(256) NOT NULL DEFAULT(''),
	CreatedAt DATETIME NOT NULL DEFAULT(GETDATE()),
	UpdatedBy VARCHAR(256) NOT NULL DEFAULT(''),
	UpdatedAt DATETIME NOT NULL DEFAULT(GETDATE()),
);


------< Order-Related Tables >------
CREATE TABLE TblOrder(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
	DueDate DATETIME NOT NULL DEFAULT(GETDATE()),
	[Status] NVARCHAR(20) NOT NULL DEFAULT(''),

	Subtotal DECIMAL(18, 2) NOT NULL DEFAULT(0),
	TotalDiscount DECIMAL(18, 2) NOT NULL DEFAULT(0),
	Total DECIMAL(18, 2) NOT NULL DEFAULT(0),

	IsDeleted BIT NOT NULL DEFAULT(0),

	CreatedBy VARCHAR(256) NOT NULL DEFAULT(''),
	CreatedAt DATETIME NOT NULL DEFAULT(GETDATE()),
	UpdatedBy VARCHAR(256) NOT NULL DEFAULT(''),
	UpdatedAt DATETIME NOT NULL DEFAULT(GETDATE()),

	UserId UNIQUEIDENTIFIER NOT NULL,
	FOREIGN KEY (UserId) REFERENCES TblUser(Id),
);

CREATE TABLE TblOrderDetail(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
);

--DROP TABLE TblUserRole
--DROP TABLE TblBookAuthor;
--DROP TABLE TblBookCategory;

--DROP TABLE TblBook;
--DROP TABLE TblPublisher;
--DROP TABLE TblCategory;
--DROP TABLE TblRole;
--DROP TABLE TblUser;