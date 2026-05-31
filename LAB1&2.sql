CREATE TABLE BANK_MASTER(
	BANK_ID INT PRIMARY KEY,
	BANK_NAME VARCHAR(50),
	BANK_SHORTNAME VARCHAR(30)
)

CREATE TABLE BRANCH_MASTER(
	BRANCH_ID INT PRIMARY KEY,
	BRANCH_NAME VARCHAR(50),
	BRANCH_IFSC VARCHAR(30) UNIQUE,
	BANK_ID INT FOREIGN KEY REFERENCES BANK_MASTER(BANK_ID)
)

CREATE TABLE EMPLOYEE_MASTER(
	EMP_NO INT PRIMARY KEY,
	BRANCH_IFSC VARCHAR(30) FOREIGN KEY REFERENCES BRANCH_MASTER(BRANCH_IFSC),
	EMP_FULLNAME VARCHAR(50),
	EMP_DESIGNATION VARCHAR(30),
	EMP_MANAGER_NO INT,
	EMPLOYEE_SALARY DECIMAL(8,2)
)

CREATE TABLE CUSTOMER_MASTER (
	CUST_ID INT PRIMARY KEY,
	CUST_FULLNAME VARCHAR(30),
	CUST_DOB DATE,
	CUST_ADDRESS VARCHAR(50),
	CUST_MOBILENO BIGINT,
	CUST_EMAILID VARCHAR(30),
	CUST_CITY VARCHAR(30)
)

CREATE TABLE ACCOUNT_MASTER(
	ACC_NO INT PRIMARY KEY,
	CUST_ID INT FOREIGN KEY REFERENCES CUSTOMER_MASTER(CUST_ID),
	ACC_TYPE VARCHAR(30) CHECK (ACC_TYPE='SB' OR ACC_TYPE='CR'),
	BRANCH_IFSC VARCHAR(30) FOREIGN KEY REFERENCES BRANCH_MASTER(BRANCH_IFSC)
)

CREATE TABLE TRANSACTION_MASTER(
	TRAN_ID INT PRIMARY KEY,
	TRAN_ACC_NO INT FOREIGN KEY REFERENCES ACCOUNT_MASTER(ACC_NO),
	TRAN_DATE DATE,
	TRAN_TYPE VARCHAR(10) CHECK (TRAN_TYPE='CH' OR TRAN_TYPE='CQ' OR TRAN_TYPE='OL' OR TRAN_TYPE='RG'),
	TRAN_AMOUNT_DEBIT_CREDIT VARCHAR(10) CHECK(TRAN_AMOUNT_DEBIT_CREDIT='D' OR TRAN_AMOUNT_DEBIT_CREDIT='C'),
	TRAN_AMOUNT DECIMAL(8,2)
)

INSERT INTO BANK_MASTER VALUES
(1, 'State Bank of India', 'SBI'),
(2, 'HDFC Bank', 'HDFC'),
(3, 'ICICI Bank', 'ICICI'),
(4, 'Axis Bank', 'AXIS'),
(5, 'Bank of Baroda', 'BOB'),
(6, 'Punjab National Bank', 'PNB'),
(7, 'Canara Bank', 'CAN'),
(8, 'Kotak Mahindra Bank', 'KOTAK'),
(9, 'Union Bank of India', 'UBI'),
(10, 'IDBI Bank', 'IDBI');

INSERT INTO BRANCH_MASTER VALUES
(101, 'Rajkot Main Branch', 'SBI0001', 1),
(102, 'Ahmedabad Branch', 'HDFC0001', 2),
(103, 'Surat Branch', 'ICICI0001', 3),
(104, 'Baroda Branch', 'AXIS0001', 4),
(105, 'Jamnagar Branch', 'BOB0001', 5),
(106, 'Bhavnagar Branch', 'PNB0001', 6),
(107, 'Morbi Branch', 'CAN0001', 7),
(108, 'Junagadh Branch', 'KOTAK0001', 8),
(109, 'Gandhinagar Branch', 'UBI0001', 9),
(110, 'Vadodara Branch', 'IDBI0001', 10);

INSERT INTO EMPLOYEE_MASTER VALUES
(1001, 'SBI0001', 'Rahul Sharma', 'Manager', NULL, 75000.00),
(1002, 'HDFC0001', 'Priya Patel', 'Cashier', 1001, 35000.00),
(1003, 'ICICI0001', 'Amit Verma', 'Clerk', 1001, 30000.00),
(1004, 'AXIS0001', 'Sneha Joshi', 'Officer', 1001, 42000.00),
(1005, 'BOB0001', 'Karan Mehta', 'Manager', NULL, 72000.00),
(1006, 'PNB0001', 'Neha Shah', 'Cashier', 1005, 34000.00),
(1007, 'CAN0001', 'Rohit Kumar', 'Clerk', 1005, 28000.00),
(1008, 'KOTAK0001', 'Anjali Desai', 'Officer', 1005, 45000.00),
(1009, 'UBI0001', 'Vikas Singh', 'Manager', NULL, 70000.00),
(1010, 'IDBI0001', 'Pooja Trivedi', 'Cashier', 1009, 33000.00);

INSERT INTO CUSTOMER_MASTER VALUES
(201, 'Arjun Patel', '1998-05-10', 'Rajkot', 9876543210, 'arjun@gmail.com', 'Rajkot'),
(202, 'Meera Shah', '1995-08-15', 'Ahmedabad', 9876543211, 'meera@gmail.com', 'Ahmedabad'),
(203, 'Ravi Mehta', '2000-02-20', 'Surat', 9876543212, 'ravi@gmail.com', 'Surat'),
(204, 'Kajal Joshi', '1999-11-12', 'Baroda', 9876543213, 'kajal@gmail.com', 'Baroda'),
(205, 'Nikhil Jain', '1997-07-25', 'Jamnagar', 9876543214, 'nikhil@gmail.com', 'Jamnagar'),
(206, 'Simran Kaur', '1996-09-30', 'Bhavnagar', 9876543215, 'simran@gmail.com', 'Bhavnagar'),
(207, 'Yash Patel', '2001-03-18', 'Morbi', 9876543216, 'yash@gmail.com', 'Morbi'),
(208, 'Riya Desai', '1998-12-01', 'Junagadh', 9876543217, 'riya@gmail.com', 'Junagadh'),
(209, 'Manish Verma', '1994-04-14', 'Gandhinagar', 9876543218, 'manish@gmail.com', 'Gandhinagar'),
(210, 'Komal Shah', '2002-01-05', 'Vadodara', 9876543219, 'komal@gmail.com', 'Vadodara');

INSERT INTO ACCOUNT_MASTER VALUES
(5001, 201, 'SB', 'SBI0001'),
(5002, 202, 'CR', 'HDFC0001'),
(5003, 203, 'SB', 'ICICI0001'),
(5004, 204, 'SB', 'AXIS0001'),
(5005, 205, 'CR', 'BOB0001'),
(5006, 206, 'SB', 'PNB0001'),
(5007, 207, 'SB', 'CAN0001'),
(5008, 208, 'CR', 'KOTAK0001'),
(5009, 209, 'SB', 'UBI0001'),
(5010, 210, 'CR', 'IDBI0001');

INSERT INTO TRANSACTION_MASTER VALUES
(9001, 5001, '2026-01-10', 'CH', 'D', 5000.00),
(9002, 5002, '2026-01-11', 'CQ', 'C', 12000.00),
(9003, 5003, '2026-01-12', 'OL', 'D', 2500.00),
(9004, 5004, '2026-01-13', 'RG', 'C', 15000.00),
(9005, 5005, '2026-01-14', 'CH', 'D', 3000.00),
(9006, 5006, '2026-01-15', 'CQ', 'C', 7000.00),
(9007, 5007, '2026-01-16', 'OL', 'D', 1000.00),
(9008, 5008, '2026-01-17', 'RG', 'C', 20000.00),
(9009, 5009, '2026-01-18', 'CH', 'D', 4500.00),
(9010, 5010, '2026-01-19', 'OL', 'C', 9000.00);