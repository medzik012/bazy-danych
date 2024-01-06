USE GamePlatformDB;
GO

-- Wstawianie danych do tabeli Users
INSERT INTO Users (Username, Email, Password, JoinDate, LastLogin)
VALUES
('user1', 'user1@example.com', 'password1', SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET()),
('user2', 'user2@example.com', 'password2', SYSDATETIMEOFFSET(), NULL),
('user3', 'user3@example.com', 'password3', SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET()),
('user4', 'user4@example.com', 'password4', SYSDATETIMEOFFSET(), NULL),
('user5', 'user5@example.com', 'password5', SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET()),
('user6', 'user6@example.com', 'password6', SYSDATETIMEOFFSET(), NULL),
('user7', 'user7@example.com', 'password7', SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET());
GO

-- Wstawianie danych do tabeli Games
INSERT INTO Games (Title, Description, Genre, ReleaseDate, GameData)
VALUES
('Game 1', 'Description 1', 'Adventure', '2021-01-01', '{"levels": 10, "difficulty": "easy"}'),
('Game 2', 'Description 2', 'Action', '2021-05-15', '{"levels": 20, "difficulty": "medium"}'),
('Game 3', 'Description 3', 'Puzzle', '2020-12-01', '{"levels": 5, "difficulty": "hard"}'),
('Game 4', 'Description 4', 'RPG', '2019-08-23', '{"levels": 15, "difficulty": "medium"}'),
('Game 5', 'Description 5', 'Strategy', '2022-03-10', '{"levels": 8, "difficulty": "easy"}');
GO

-- Wstawianie danych do tabeli Platforms
INSERT INTO Platforms (Name, Description, ReleaseDate)
VALUES
('PC', 'Personal Computer', '2000-01-01'),
('Xbox', 'Microsoft Gaming Console', '2001-11-15'),
('PlayStation', 'Sony Gaming Console', '1994-12-03'),
('Nintendo Switch', 'Nintendo Hybrid Console', '2017-03-03'),
('Mobile', 'Mobile Gaming Platform', '2007-06-29');
GO

-- Wstawianie danych do tabeli Transactions
INSERT INTO Transactions (UserID, GameID, Amount, TransactionDate, PaymentMethod, Status)
VALUES
(1, 1, 59.99, SYSDATETIMEOFFSET(), 'Credit Card', 'Completed'),
(2, 2, 49.99, SYSDATETIMEOFFSET(), 'PayPal', 'Pending'),
(3, 3, 39.99, SYSDATETIMEOFFSET(), 'Debit Card', 'Completed'),
(4, 4, 29.99, SYSDATETIMEOFFSET(), 'Credit Card', 'Refunded'),
(5, 5, 19.99, SYSDATETIMEOFFSET(), 'PayPal', 'Completed');
GO

-- Wstawianie danych do tabeli GameplayTime
INSERT INTO GameplayTime (UserID, GameID, StartTime, EndTime)
VALUES
(1, 1, SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET()),
(2, 2, SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET()),
(3, 3, SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET()),
(4, 4, SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET()),
(5, 5, SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET());
GO

-- Wstawianie danych do tabeli Achievements
INSERT INTO Achievements (GameID, Description, Points, AchievementJson)
VALUES
(1, 'First Achievement', 10, '{"goal": "Complete Level 1"}'),
(2, 'Speed Runner', 20, '{"goal": "Complete Game in 2 Hours"}'),
(3, 'Puzzle Master', 30, '{"goal": "Solve All Puzzles"}'),
(4, 'Ultimate Player', 40, '{"goal": "Reach Max Level"}'),
(5, 'Strategist', 50, '{"goal": "Win without losing a unit"}');
GO
