USE GamePlatformDB;
GO

BEGIN TRANSACTION;

    -- Aktualizacja ostatniego logowania dla u�ytkownika o UserID = 1
    UPDATE Users
    SET LastLogin = SYSDATETIMEOFFSET()
    WHERE UserID = 1;

    -- Dodanie nowej transakcji dla u�ytkownika o UserID = 1
    INSERT INTO Transactions (UserID, GameID, Amount, TransactionDate, PaymentMethod, Status)
    VALUES (1, 3, 24.99, SYSDATETIMEOFFSET(), 'Credit Card', 'Completed');

    -- Sprawdzenie, czy liczba transakcji dla u�ytkownika nie przekroczy�a okre�lonego limitu
    -- Za��my, �e limit wynosi 5
    DECLARE @TransactionCount INT;
    SELECT @TransactionCount = COUNT(*) FROM Transactions WHERE UserID = 1;

    IF @TransactionCount > 5
    BEGIN
        -- Je�li liczba transakcji przekroczy�a limit, wycofujemy transakcj�
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- W przeciwnym razie potwierdzamy transakcj�
        COMMIT TRANSACTION;
    END;
