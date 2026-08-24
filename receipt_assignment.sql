\q
CREATE database collegedb
\c collegedb
CREATE database collegedb;
\c collegedb
CREATE TABLE students (
student_id INT PRIMARY KEY,
roll_no VARCHAR(20),
name VARCHAR(50),
department VARCHAR(20),
marks INT
);
INSERT INTO students VALUES
(1, 'CSE101', 'Riya', 'CSE', 85),
(2, 'CSE102', 'Arjun', 'CSE', 72),
(3, 'ECE101', 'Fatima', 'ECE', 90),
(4, 'CSE103', 'Karan', 'CSE', 78);
CREATE TABLE subjects (
subject_id INT PRIMARY KEY,
subject_code VARCHAR(20),
subject_name VARCHAR(100)
);
INSERT INTO subjects VALUES
(101, 'DBMS', 'Database Management System'),
(102, 'CN', 'Computer Networks'),
(103, 'OS', 'Operating Systems');
CREATE TABLE student_subject (
student_id INT,
subject_id INT,
marks INT,
PRIMARY KEY (student_id, subject_id),
FOREIGN KEY (student_id)
REFERENCES students(student_id),
FOREIGN KEY (subject_id)
REFERENCES subjects(subject_id)
);
INSERT INTO student_subject VALUES
(1, 101, 85);
\dt subjects
select * from student;
select * from students;
select * from subjects;
select * from student_subject;
CREATE DATABASE receipt_assignment;
\c receipt_assignment
CREATE TABLE store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    gstin VARCHAR(15) UNIQUE NOT NULL,
    cin VARCHAR(21),
    fssai_no VARCHAR(20),
    address TEXT,
    phone VARCHAR(15)
);
CREATE TABLE receipt (
    receipt_id SERIAL PRIMARY KEY,
    bill_no VARCHAR(30) UNIQUE NOT NULL,
    voucher_no VARCHAR(30) UNIQUE NOT NULL,
    store_id INT NOT NULL REFERENCES store(store_id),
    bill_datetime TIMESTAMP NOT NULL,
    cashier VARCHAR(30),
    payment_method VARCHAR(30),
    total_amount NUMERIC(10,2)
);
CREATE TABLE receipt_item (
    receipt_item_id SERIAL PRIMARY KEY,
    receipt_id INT NOT NULL REFERENCES receipt(receipt_id),
    line_no INT NOT NULL,
    hsn VARCHAR(10),
    particular VARCHAR(100),
    quantity INT,
    rate NUMERIC(10,2),
    value NUMERIC(10,2),
    UNIQUE(receipt_id, line_no)
);
\dt
\d store
\d receipt
\d receipt_item
INSERT INTO store
(store_name, gstin, cin, fssai_no, address, phone)
VALUES
(
    'DMART BELAPUR',
    '27AACCA8432H1ZO',
    'L51900MH2000PLC126473',
    '11519017090888',
    'PLOT NO. 18, SECTOR 15, CBD BELAPUR, NAVI MUMBAI - 400614',
    '8655429200'
);
INSERT INTO receipt
(bill_no, voucher_no, store_id, bill_datetime, cashier, payment_method, total_amount)
VALUES
(
    '404608003-006113',
    '5183003-0217',
    1,
    '2026-08-22 21:45:00',
    'VC/183346',
    'Card Payment',
    969.50
);
INSERT INTO receipt_item
(receipt_id, line_no, hsn, particular, quantity, rate, value)
VALUES
(1, 1, '081090', 'DRAGON FRUIT-nos', 1, 59.00, 59.00),
(1, 2, '090932', 'JEERA-100g', 1, 35.00, 35.00),
(1, 3, '610910', 'TOP GIRL SATNEM-nos', 1, 149.00, 149.00),
(1, 4, '620690', 'FRML SHY LT T-399lt', 1, 399.00, 399.00),
(1, 5, '732390', 'SH. HEAVY WIRE-nos', 1, 45.00, 45.00),
(1, 6, '330749', 'FRESHZAP PNK SUN-8g', 1, 49.50, 49.50),
(1, 7, '420222', 'GIRLS WALLET PRINT', 1, 129.00, 129.00),
(1, 8, '732410', 'SS SINK STRAINER-nos', 1, 69.00, 69.00),
(1, 9, '220210', 'LIMCA BOTTLE-750ml', 1, 35.00, 35.00);
SELECT * FROM store;
SELECT * FROM receipt;
SELECT * FROM receipt_item;
SELECT * FROM <table>;
SELECT
    r.bill_no,
    s.store_name,
    ri.line_no,
    ri.particular,
    ri.quantity,
    ri.rate,
    ri.value
FROM receipt r
JOIN store s
    ON r.store_id = s.store_id
JOIN receipt_item ri
    ON r.receipt_id = ri.receipt_id
ORDER BY ri.line_no;
\o receipt_assignment_output.txt
\s receipt_assignment.sql
