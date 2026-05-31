--1) Create a simple view Bank_View which contains only Bank_ID and Bank_Name. (A) 
CREATE OR ALTER VIEW Bank_View
AS
SELECT BANK_ID,BANK_NAME
FROM BANK_MASTER

SELECT * FROM Bank_View
--2) Create a simple view Customer_View which contains Cust_FullName, Cust_MobileNo, Cust_EmailID. (A) 
CREATE OR ALTER VIEW Customer_View
AS 
SELECT CUST_FULLNAME, CUST_MOBILENO, CUST_EMAILID
FROM CUSTOMER_MASTER

SELECT * FROM Customer_View
--3) Create a complex view that contains Acc_No, Cust_ID, Branch_Name, Bank_Name. (A) 
CREATE OR ALTER VIEW ACC_CUST_BANK
AS
SELECT ACC_NO,ACCOUNT_MASTER.CUST_ID,BRANCH_NAME,BANK_NAME
FROM BANK_MASTER JOIN BRANCH_MASTER
ON BANK_MASTER.BANK_ID=BRANCH_MASTER.BANK_ID
JOIN ACCOUNT_MASTER
ON ACCOUNT_MASTER.BRANCH_IFSC = BRANCH_MASTER.BRANCH_IFSC

SELECT * FROM ACC_CUST_BANK
--4) Create a simple view with Check Option Cust_View which contains Cust_FullName, Cust_City. (A) 
CREATE OR ALTER VIEW Cust_View
AS
SELECT CUST_FULLNAME, CUST_CITY
FROM CUSTOMER_MASTER

SELECT * FROM Cust_View
--5) Create a sequence on the following table’s listed columns: Bank_Master -> Bank_ID, Branch_Master -> Branch_ID, 
--Employee_Master -> Emp_No. (A) 
CREATE SEQUENCE Seq_Bank_ID
START WITH 11
INCREMENT BY 1;

CREATE SEQUENCE Seq_Branch_ID
START WITH 111
INCREMENT BY 1;

CREATE SEQUENCE Seq_Emp_No
START WITH 1011
INCREMENT BY 1;

SELECT NEXT VALUE FOR Seq_Branch_ID
--6) Create Synonym T_Master for Transaction_Master. (A) 
CREATE SYNONYM T_Master
FOR TRANSACTION_MASTER;

SELECT * FROM T_Master
--7) Create a simple view Tr_View which contains Tran_ID, Tras_Acc_No those whose Tran_Type is Online. (B) 
CREATE OR ALTER VIEW Tr_View
AS
SELECT TRAN_ID,TRAN_ACC_NO
FROM TRANSACTION_MASTER
WHERE TRAN_TYPE='OL'

SELECT * FROM Tr_View
--8) Create whole view of the Custome_Master table with check option for customer city = ‘Rajkot’ and insert data using view. 
--(B) 
CREATE OR ALTER VIEW Rajkot_Customer_View
AS
SELECT *
FROM CUSTOMER_MASTER
WHERE CUST_CITY = 'Rajkot'

INSERT INTO Rajkot_Customer_View
VALUES
(211,'Jay Patel','2001-05-10',
 'Kalawad Road',9876543220,
 'jay@gmail.com','Rajkot');
--9) Create a one Table and create sequence for which contain start from 101 increment by 5 and maximum value is 120, 
--minimum value is 100 and restart cycle after reach on maximum value. (B) 
CREATE SEQUENCE Seq_Test
START WITH 101
INCREMENT BY 5
MINVALUE 100
MAXVALUE 120
CYCLE;

SELECT NEXT VALUE FOR Seq_Test;
--10) Insert one value into the Employee_Master table fetch next id from using sequence. (B) 
INSERT INTO EMPLOYEE_MASTER
VALUES
(
 NEXT VALUE FOR Seq_Emp_No,
 'SBI0001',
 'Ramesh Patel',
 'Officer',
 1001,
 40000
);
--11) Alter Tr_View that also contains Tran_Amount column. (C) 
CREATE OR ALTER VIEW Tr_View
AS
SELECT TRAN_ID,
       TRAN_ACC_NO,
       TRAN_AMOUNT
FROM TRANSACTION_MASTER
WHERE TRAN_TYPE='OL';
--12) Drop the Customer_View. (C) 
DROP VIEW Customer_View
--13) Drop the Employee_Master table sequence and try to insert data using sequence. (C) 
DROP SEQUENCE Seq_Emp_No;

INSERT INTO EMPLOYEE_MASTER
VALUES
(
 NEXT VALUE FOR Seq_Emp_No,
 'SBI0001',
 'Test Employee',
 'Clerk',
 1001,
 25000
);