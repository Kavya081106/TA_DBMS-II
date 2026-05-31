--1) Write a T - SQL block to check whether the given number is a positive number or a negative number using a simple if 
--statement. (A) 
DECLARE @N INT
SET @N = -5
IF @N > 0
    PRINT 'NUMBER IS POSITIVE'
ELSE
    PRINT 'NUMBER IS NEGATIVE'
--2) Write a T - SQL block to find the maximum number from the given two numbers. (A) 
DECLARE @N1 VARCHAR(2)
DECLARE @N2 VARCHAR(2)

SET @N1 = 4
SET @N2 = 3

IF @N1>@N2
	PRINT @N1+ ' IS LARGER'
ELSE 
	PRINT @N2+ ' IS LARGER'
--3) Write a T - SQL block to find the maximum number from the given three numbers. (A) 
DECLARE @A VARCHAR(2)
DECLARE @B VARCHAR(2)
DECLARE @C VARCHAR(2)

SET @A=2
SET @B=1
SET @C=5

IF @A>@B
	IF @A>@C
		PRINT @A+' IS LARGEST'
	ELSE 
		PRINT @C+' IS LARGEST'
ELSE
	IF @B>@C
		PRINT @B+' IS LARGEST'
	ELSE 
		PRINT @C+' IS LARGEST'
--4) Write a T - SQL block to print the first 25 natural numbers using a loop. (A) 
DECLARE @NUM INT
DECLARE @MSG VARCHAR(100)

SET @NUM = 1
SET @MSG = ''

WHILE @NUM <= 25
BEGIN
	SET @MSG = CONCAT(@MSG, @NUM, ' ')
	SET @NUM = @NUM + 1
END

PRINT @MSG
	
--5) Write a T - SQL Program to Print Odd Numbers From 1 to 100. (A) 
DECLARE @NUM1 INT
DECLARE @MSG1 VARCHAR(200)

SET @NUM1=1
SET @MSG1=''

WHILE @NUM1<=100
BEGIN
IF @NUM1%2!=0
	SET @MSG1 = CONCAT(@MSG1,@NUM1,' ')
	SET @NUM1 = @NUM1+1
END

PRINT @MSG1
--6) Write a T - SQL block to find the sum of the first 100 natural nos. (B) 
DECLARE @NUM2 INT
DECLARE @TOTAL INT
SET @NUM2 = 1
SET @TOTAL = 0
WHILE @NUM2<=100
BEGIN
SET @TOTAL = @TOTAL+@NUM2
SET @NUM2=@NUM2+1
END

PRINT @TOTAL

--7) Write a T - SQL block to find whether the number is even or odd. (B) 
DECLARE @NUM3 INT
SET @NUM3 = 0

IF @NUM3%2=0
	PRINT 'NUMBER IS EVEN'
ELSE
	PRINT 'NUMBER IS ODD'
--8) Write a T - SQL block to print the first 25 Odd numbers using a loop in Reverse order. (C) 
DECLARE @NUM5 INT
DECLARE @COUNT INT
DECLARE @MSG5 VARCHAR(200)

SET @NUM5 = 49
SET @COUNT = 1
SET @MSG5 = ''

WHILE @COUNT <= 25
BEGIN
	SET @MSG5 = CONCAT(@MSG5, @NUM5, ' ')
	SET @NUM5 = @NUM5 - 2
	SET @COUNT = @COUNT + 1
END

PRINT @MSG5
--9) Write a T-SQL block for given conditions: marks > 70 then Print '1st Class', marks>50 and marks<=70 then print '2nd Class', 
--marks>=35 and marks<=50 then print '3rd Class', marks<35 then print 'Fail !!'. (C) 
DECLARE @MARKS INT
SET @MARKS = 89

IF @MARKS>70
	PRINT '1ST CLASS'
ELSE IF @MARKS<=70 AND @MARKS>50
	PRINT '2ND CLASS'
ELSE IF @MARKS>=50 AND @MARKS<=35
	PRINT '3RD CLASS'
ELSE
	PRINT 'FAIL!!'