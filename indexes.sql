USE GamePlatformDB;
GO

-- Tworzenie indeksu na Username w tabeli Users
CREATE INDEX idx_username ON Users (Username);
GO

-- Tworzenie indeksu na Email w tabeli Users
CREATE INDEX idx_email ON Users (Email);
GO

-- Tworzenie indeksu na Title w tabeli Games
CREATE INDEX idx_game_title ON Games (Title);
GO

-- Tworzenie indeksu na Genre w tabeli Games
CREATE INDEX idx_game_genre ON Games (Genre);
GO

-- Tworzenie indeksu na ReleaseDate w tabeli Games
CREATE INDEX idx_game_release_date ON Games (ReleaseDate);
GO

-- Tworzenie indeksu na TransactionDate w tabeli Transactions
CREATE INDEX idx_transaction_date ON Transactions (TransactionDate);
GO

-- Tworzenie indeksu na UserID w tabeli Transactions (dla szybszego wyszukiwania transakcji u¿ytkownika)
CREATE INDEX idx_transaction_user ON Transactions (UserID);
GO

-- Tworzenie indeksu na GameID w tabeli GameplayTime (dla szybszego wyszukiwania czasu gry dla konkretnej gry)
CREATE INDEX idx_gameplay_game ON GameplayTime (GameID);
GO

-- Tworzenie indeksu na UserID w tabeli GameplayTime (dla szybszego wyszukiwania czasu gry dla konkretnego u¿ytkownika)
CREATE INDEX idx_gameplay_user ON GameplayTime (UserID);
GO
