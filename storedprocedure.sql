ALTER PROCEDURE GetCustomerSummary 
    @Country NVARCHAR(50) = 'USA'
AS
BEGIN
    BEGIN TRY

        IF EXISTS (
            SELECT 1 
            FROM Sales.Customers 
            WHERE Score IS NULL AND Country = @Country
        )
        BEGIN
            PRINT ('Update Null Scores to 0');

            UPDATE Sales.Customers
            SET Score = 0
            WHERE Score IS NULL AND Country = @Country
        END
        ELSE
        BEGIN
            PRINT ('No Null Scores found')
        END;

        DECLARE @TotalCustomers INT, 
                @AvgScore FLOAT;

        SELECT  
            @TotalCustomers = COUNT(*),
            @AvgScore = AVG(Score),
            1/0
        FROM Sales.Customers
        WHERE Country = @Country;

        PRINT 'Total customer in ' + @Country + ':' + CAST(@TotalCustomers AS NVARCHAR);
        PRINT 'Avg Score in ' + @Country + ':' + CAST(@AvgScore AS NVARCHAR);

    END TRY

    BEGIN CATCH
        PRINT ('An Error Occured');
        PRINT ('Error message: ' + ERROR_MESSAGE());
        PRINT ('Error number: ' + CAST(ERROR_NUMBER() AS NVARCHAR));
        PRINT ('Error line: ' + CAST(ERROR_LINE() AS NVARCHAR));
        PRINT ('Error Procedure: ' + ERROR_PROCEDURE());
    END CATCH
END


-- Execute the stored procedure

EXEC GetCustomerSummary @Country='USA'

SELECT * FROM Sales.Customers
--- if we wanna change then use ALTER IN place of CREATE

-- we can also drop use 
DROP PROCEDURE GetCustomerSummary