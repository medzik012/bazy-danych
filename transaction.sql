USE GamePlatformDB;
GO

BEGIN TRANSACTION;

    -- Aktualizacja ostatniego logowania dla u¿ytkownika o UserID = 1
    UPDATE Users
    SET LastLogin = SYSDATETIMEOFFSET()
    WHERE UserID = 1;

    -- Dodanie nowej transakcji dla u¿ytkownika o UserID = 1
    INSERT INTO Transactions (UserID, GameID, Amount, TransactionDate, PaymentMethod, Status)
    VALUES (1, 3, 24.99, SYSDATETIMEOFFSET(), 'Credit Card', 'Completed');

    -- Sprawdzenie, czy liczba transakcji dla u¿ytkownika nie przekroczy³a okreœlonego limitu
    -- Za³ó¿my, ¿e limit wynosi 5
    DECLARE @TransactionCount INT;
    SELECT @TransactionCount = COUNT(*) FROM Transactions WHERE UserID = 1;

    IF @TransactionCount > 5
    BEGIN
        -- Jeœli liczba transakcji przekroczy³a limit, wycofujemy transakcjê
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- W przeciwnym razie potwierdzamy transakcjê
        COMMIT TRANSACTION;
    END;
