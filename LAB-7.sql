--1) Write a stored procedure to find the Factorial. (A) 
CREATE OR ALTER PROC PR_FACT
@N INT
AS
BEGIN
DECLARE @FACT INT
DECLARE @I INT
SET @FACT=1
SET @I = 1
WHILE @N>=1
BEGIN
SET @FACT = @FACT*@I
SET @I = @I+1
SET @N = @N-1
END
PRINT @FACT
END

EXEC PR_FACT 4
--2) Write a stored procedure to find maximum number out of two numbers. (A) 
CREATE OR ALTER PROC PR_MAX_TWO
@N1 VARCHAR(2),
@N2 VARCHAR(2)
AS
BEGIN
IF @N1>@N2
	PRINT @N1+' IS LARGEST'
ELSE 
	PRINT @N2+' IS LARGEST'
END

EXEC PR_MAX_TWO 20,10
--3) Write a stored procedure to find square of number. (B) 
CREATE OR ALTER PROC PR_SQUARE
@N INT
AS
BEGIN
DECLARE @SQ INT
SET @SQ = @N*@N
PRINT @SQ
END

EXEC PR_SQUARE 4
--4) Write a stored procedure to find the sum of first 50 even numbers. (B) 
CREATE OR ALTER PROC PR_SUM
AS
BEGIN
	DECLARE @SUM INT
	DECLARE @NUM INT
	DECLARE @COUNT INT

	SET @SUM = 0
	SET @NUM = 2
	SET @COUNT = 1

	WHILE @COUNT <= 50
	BEGIN
		SET @SUM = @SUM + @NUM
		SET @NUM = @NUM + 2
		SET @COUNT = @COUNT + 1
	END

	SELECT @SUM AS TOTAL_SUM
END

EXEC PR_SUM 
--5) Write a Stored Procedure that returns Total marks of 3 subjects using output parameter if marks of all 3 subject is >35 else 
--return a proper message. (C) 
CREATE OR ALTER PROC PR_TOTAL_MARKS
(
    @M1 INT,
    @M2 INT,
    @M3 INT,
    @TOTAL INT OUTPUT
)
AS
BEGIN
    IF @M1 > 35 AND @M2 > 35 AND @M3 > 35
    BEGIN
        SET @TOTAL = @M1 + @M2 + @M3
    END
    ELSE
    BEGIN
        PRINT 'Student has failed in one or more subjects'
    END
END

DECLARE @RESULT INT

EXEC PR_TOTAL_MARKS
    70, 80, 90,
    @RESULT OUTPUT

SELECT @RESULT AS TOTAL_MARKS