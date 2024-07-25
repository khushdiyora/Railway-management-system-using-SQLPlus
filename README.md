# Railway Management System

## Overview

The Railway Management System is a comprehensive SQL database solution designed to manage railway operations efficiently. This system encompasses various aspects of railway management, including user information, train details, station data, ticketing, and payment transactions. The provided SQL script (`railwaymanagement.sql`) sets up the database schema and initial data. 

This repository includes SQL queries for managing and querying the database, allowing users to interact with and extract valuable insights from the data. This project was created by Khush.

## Features

- **Database Schema**: Includes tables for users, trains, stations, tickets, ticket status, and payments.
- **Data Import**: Instructions for importing the SQL schema and data into a MySQL database.
- **Data Queries**: A comprehensive set of SQL queries for retrieving and analyzing data, including:
  - Describing table structures.
  - Retrieving all records from key tables.
  - Ordering and filtering data based on specific criteria.
  - Calculating ticket-related statistics and income.
  - Analyzing train capacities and counts.

## ER(Entity-Relationship) Diagram : 

![Screenshot 2023-12-21 011818](https://github.com/user-attachments/assets/c086c9b3-a42d-4c46-93e2-5cbd648a7b82)


## Prerequisites

- MySQL database server installed and running.
- A MySQL client tool (e.g., MySQL Workbench or command line client).

## Import the Database

Before executing the queries, import the `railwaymanagement.sql` file into your MySQL database.

### Using MySQL Command Line Client


**1. Open the terminal.**

**2. Log in to MySQL with the following command:**
   ```bash
   mysql -u your_username -p
   ```
#### Replace your_username with your MySQL username. Enter your password when prompted.

**3. Create a new database if you haven't already:**
   ```bash
   CREATE DATABASE railway_management;
    USE railway_management;
   ```

**4. Import the SQL file:**
  ```bash
mysql -u your_username -p railway_management < railwaymanagement.sql
```

## Using MySQL Workbench

**1. Open MySQL Workbench and connect to your database server.**
**2. Create a new database if needed.**
**3. Go to the "File" menu and select "Open SQL Script".**
**4. Open the railwaymanagement.sql file.**
**5. Execute the script by clicking the lightning bolt icon or pressing Ctrl + Shift + Enter.**


## Some SQL Queries :

```bash
# Describe tables
DESC USER_USE;
```
![Screenshot 2024-07-22 234538](https://github.com/user-attachments/assets/edb60076-1341-4cb5-801d-b6b880ac3c94)

```bash
DESC TRAIN;
```
![Screenshot 2024-07-22 234545](https://github.com/user-attachments/assets/cd31bba3-847a-4e0f-8a88-9441369999ad)

```bash
DESC STATION;
```
![Screenshot 2024-07-22 234552](https://github.com/user-attachments/assets/a647b2d3-8048-4f52-a69b-4757dee04be9)


```bash
DESC TICKET;
```
![Screenshot 2024-07-22 234600](https://github.com/user-attachments/assets/ec0c6f73-019c-44cf-ae63-09604e17d2e7)


```bash
DESC TICKET_STATUS;
```
![Screenshot 2024-07-22 234604](https://github.com/user-attachments/assets/68a80e99-2085-4d55-992c-d2c78333312e)


```bash
DESC PAYMENT;
```
![Screenshot 2024-07-22 234613](https://github.com/user-attachments/assets/9b820dbf-0260-46df-a01a-54f606402212)


```bash

SELECT * FROM USER_USE;
SELECT * FROM TRAIN;
SELECT * FROM STATION;
SELECT * FROM TICKET;
SELECT * FROM TICKET_STATUS;
SELECT * FROM PAYMENT;
```

```bash
-- Select TRAIN_NO from STATION ordered by DEPARTURE_TIME
SELECT TRAIN_NO FROM STATION ORDER BY DEPARTURE_TIME;

-- Select USER_ID from USER_USE ordered by AGE
SELECT USER_ID FROM USER_USE ORDER BY AGE;

-- Select all records from USERS table
SELECT * FROM USERS;

-- Select all records from TRAIN_DETAIL table
SELECT * FROM TRAIN_DETAIL;
```

```bash
-- Select PNR_NO where status is waiting
SELECT * FROM TICKET WHERE PNR_NO IN (SELECT PNR_NO FROM TICKET_STATUS WHERE WAITING = 'Y');
```

```bash
-- Count of booked tickets per PNR_NO
SELECT PNR_NO, COUNT(PNR_NO) AS "TOTAL BOOKED TICKET" FROM PAYMENT GROUP BY PNR_NO;
```

```bash
-- Total income from booked tickets per PNR_NO
SELECT PNR_NO, SUM(TICKET_PRICE) AS "TOTAL INCOME FROM BOOKED TICKET" FROM TICKET GROUP BY PNR_NO;
```

```bash
-- Total number of trains with a specific capacity
SELECT TRAIN_NO, TRAIN_NAME, CAPACITY, TRAIN_DESC, DESTINATION, ARRIVAL_TIME, COUNT(TRAIN_NO) AS "TOTAL TRAIN" FROM TRAIN GROUP BY TRAIN_NO, TRAIN_NAME, CAPACITY, TRAIN_DESC, DESTINATION, ARRIVAL_TIME HAVING CAPACITY='1008';
```

```bash
SELECT TRAIN_NO, TRAIN_NAME, CAPACITY, TRAIN_DESC, DESTINATION, ARRIVAL_TIME, COUNT(TRAIN_NO) AS "TOTAL TRAIN" FROM TRAIN GROUP BY TRAIN_NO, TRAIN_NAME, CAPACITY, TRAIN_DESC, DESTINATION, ARRIVAL_TIME HAVING CAPACITY='1408';
```

```bash
-- Count, max, min, sum, and average ticket prices
SELECT COUNT(*) FROM TICKET;
SELECT COUNT(TICKET_PRICE) FROM TICKET;
SELECT MAX(TICKET_PRICE) FROM TICKET;
SELECT MIN(TICKET_PRICE) FROM TICKET;
SELECT SUM(TICKET_PRICE) FROM TICKET;
SELECT AVG(TICKET_PRICE) FROM TICKET;
```


### Snapshots of Performed above Queries :

1. ![Screenshot 2024-07-22 234625](https://github.com/user-attachments/assets/f40b942b-0256-4177-88d3-366f3245f007)
2. ![Screenshot 2024-07-22 234633](https://github.com/user-attachments/assets/29201350-34aa-43de-b91c-9024cab4e149)
3. ![Screenshot 2024-07-22 234640](https://github.com/user-attachments/assets/73258d23-9fac-4f16-adbf-a0661e46edf8)
4. ![Screenshot 2024-07-22 234647](https://github.com/user-attachments/assets/fbae15a1-34db-4eaa-860f-35968ae56f99)
5. ![Screenshot 2024-07-22 234653](https://github.com/user-attachments/assets/6ce17a1b-ca9a-4ef0-bd91-bb73ccb98307)
6. ![Screenshot 2024-07-22 234700](https://github.com/user-attachments/assets/6cc4d523-f233-46e4-a4d1-6713a148e406)
7. ![Screenshot 2024-07-22 234706](https://github.com/user-attachments/assets/e526b99c-9ed7-4b23-a526-f4f01f655a5a)
8. ![Screenshot 2024-07-22 234711](https://github.com/user-attachments/assets/907ea421-a552-4fef-814b-fee8c65e0b4d)
9. ![Screenshot 2024-07-22 234719](https://github.com/user-attachments/assets/1e6e1b56-929e-4ae7-906a-cd791f3f6dce)
10. ![Screenshot 2024-07-22 234725](https://github.com/user-attachments/assets/8a5e55f7-714c-4755-9a28-7fae95bfb2f9)
11. ![Screenshot 2024-07-22 234734](https://github.com/user-attachments/assets/17294156-0c8d-4911-bb8e-6be11c9ee929)
12. ![Screenshot 2024-07-22 234740](https://github.com/user-attachments/assets/f6f0471c-6309-47eb-a2bb-fab1a7b7b78a)
13. ![Screenshot 2024-07-22 234752](https://github.com/user-attachments/assets/859bdddc-faa7-4d21-a53e-fc11c991d143)
14. ![Screenshot 2024-07-22 234810](https://github.com/user-attachments/assets/eecfed11-510c-4b3f-9aa0-cd326b66b840)
15. ![Screenshot 2024-07-22 234817](https://github.com/user-attachments/assets/23224bcc-7c69-4c3d-a1a7-88a7fd68c9b7)
16. ![Screenshot 2024-07-22 234826](https://github.com/user-attachments/assets/f178067d-f5fe-4809-a59f-6c2007c4d5b9)
17. ![Screenshot 2024-07-22 234831](https://github.com/user-attachments/assets/d3b81d8c-5ecf-49d3-9eb9-ced1295cd033)
18. ![Screenshot 2024-07-22 234837](https://github.com/user-attachments/assets/2264f776-00fe-4d0e-bdc3-472cde3ceaee)
19. ![Screenshot 2024-07-22 234846](https://github.com/user-attachments/assets/35f8ab9e-a2dd-42f3-b4ae-456e96827d0e)
20. ![Screenshot 2024-07-22 234851](https://github.com/user-attachments/assets/a5f95f6c-3ea6-4d1e-a9ad-ef820345ddd7)
21. ![Screenshot 2024-07-22 234856](https://github.com/user-attachments/assets/b2b3f823-519a-473d-b95e-5ece9cb503a1)
22. ![Screenshot 2024-07-22 234900](https://github.com/user-attachments/assets/54e7fab3-ddd3-4018-b81c-0fda3735048b)
23. ![Screenshot 2024-07-22 234905](https://github.com/user-attachments/assets/b3b5b85b-2a72-4490-859a-8667edb69d01)



## License

This project is licensed under the MIT License - see the LICENSE file for details.

## If we find that this can be used for personal use, it must be illegal under the Copyright Law of India 2000 (Section 43 of the Information Technology Act, 2000). This project is not allowed to be changed in any way because it may contain copyright offenses. Instead, it is for Educational purposes.

### Section 43 of the Information Technology Act, 2000 contains:

## provides for compensation to the aggrieved party up to One Crore of Rupees from a person, who without the permission of the owner or the person who is in charge of computer, computer system or computer net-work secures, access to the system or down-loads data or down-loads ...

![Khush diyora](https://github.com/user-attachments/assets/2cceda39-3a1a-44ff-aa96-556057017ee9)


