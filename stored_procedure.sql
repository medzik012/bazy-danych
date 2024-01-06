USE GamePlatformDB;
GO

CREATE PROCEDURE GetPurchasedGamesByUser
    @UserID INT
AS
BEGIN
    SELECT g.GameID, g.Title, g.Genre, g.ReleaseDate
    FROM Games g
    INNER JOIN Transactions t ON g.GameID = t.GameID
    WHERE t.UserID = @UserID AND t.Status = 'Completed';
END;
GO


-- wywo³anie --

EXEC GetPurchasedGamesByUser @UserID = 1;
