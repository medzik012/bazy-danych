-- Tworzenie bazy danych
CREATE DATABASE GamePlatformDB;
GO

USE GamePlatformDB;
GO

-- Tworzenie tabeli U¿ytkowników
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    JoinDate DATETIMEOFFSET NOT NULL,
    LastLogin DATETIMEOFFSET NULL
);
GO

-- Tworzenie tabeli Gier
CREATE TABLE Games (
    GameID INT PRIMARY KEY IDENTITY,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255) NULL,
    Genre NVARCHAR(50) NULL,
    ReleaseDate DATE NOT NULL,
    GameData TEXT NULL  -- JSON data
);
GO

-- Tworzenie tabeli Platform
CREATE TABLE Platforms (
    PlatformID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255) NULL,
    ReleaseDate DATE NOT NULL
);
GO

-- Tworzenie tabeli Transakcji
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY,
    UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    GameID INT NOT NULL FOREIGN KEY REFERENCES Games(GameID),
    Amount MONEY NOT NULL,
    TransactionDate DATETIMEOFFSET NOT NULL,
    PaymentMethod NVARCHAR(50) NOT NULL,
    Status NVARCHAR(50) NOT NULL
);
GO

-- Tworzenie tabeli Czasu Gry
CREATE TABLE GameplayTime (
    GameplayTimeID INT PRIMARY KEY IDENTITY,
    UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    GameID INT NOT NULL FOREIGN KEY REFERENCES Games(GameID),
    StartTime DATETIMEOFFSET NOT NULL,
    EndTime DATETIMEOFFSET NOT NULL
);
GO

-- Tworzenie tabeli Osi¹gniêæ
CREATE TABLE Achievements (
    AchievementID INT PRIMARY KEY IDENTITY,
    GameID INT NOT NULL FOREIGN KEY REFERENCES Games(GameID),
    Description TEXT NOT NULL,
    Points INT NOT NULL,
    AchievementJson TEXT NULL  -- JSON data
);
GO

-- Uwagi:
-- 1. Typ danych TEXT u¿yty dla danych JSON w tabelach Games i Achievements.
-- 2. Wszystkie daty i godziny u¿ywaj¹ typu DATETIMEOFFSET dla obs³ugi stref czasowych.
