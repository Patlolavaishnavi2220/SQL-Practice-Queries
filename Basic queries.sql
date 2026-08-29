
--Basic SQL Queries
create database ass1

use ass1

/*1) Filter Records Excluding a specific pattern

A company stores customer email addresses and wants to identify users who are NOT using a particular email domain.
This helps the analytics team understand external user distribution.
Table: Userss
╔══════════╦══════════╗
║  Column  ║   Type   ║
╠══════════╬══════════╣
║ user_id  ║   int    ║
║──────────┼──────────║
║   name   ║ varchar  ║
║──────────┼──────────║
║  email   ║ varchar  ║
╚══════════╩══════════╝

user_id is the primary key.
Each row represents one user and their registered email.
Write an SQL query to return all users whose email does NOT end with @gmail.com.
Return: user_id | name | email
Result can be returned in any order.

Example 1
Input:
Userss:
╔══════════╦══════════╦═══════════════════╗
║ user_id  ║   name   ║       email       ║
╠══════════╬══════════╬═══════════════════╣
║    1     ║  Aarav   ║  aarav@gmail.com  ║
║──────────┼──────────┼───────────────────║
║    2     ║   Neha   ║  neha@yahoo.com   ║
║──────────┼──────────┼───────────────────║
║    3     ║  Rohan   ║  rohan@gmail.com  ║
║──────────┼──────────┼───────────────────║
║    4     ║  Meera   ║ meera@outlook.com ║
╚══════════╩══════════╩═══════════════════╝

Output:
╔══════════╦══════════╦═══════════════════╗
║ user_id  ║   name   ║       email       ║
╠══════════╬══════════╬═══════════════════╣
║    2     ║   Neha   ║  neha@yahoo.com   ║
║──────────┼──────────┼───────────────────║
║    4     ║  Meera   ║ meera@outlook.com ║
╚══════════╩══════════╩═══════════════════╝

Explanation:
Emails ending with @gmail.com are excluded.
Only non-gmail users remain.*/

create table Userss(user_id int primary key,name varchar(50) not null,email varchar(50));

insert into Userss values(1,'Aarav','aarav@gmail.com'),(2,'Neha','neha@yahoo.com'),
(3,'Rohan','rohan@gmail.com'),(4,'Meera','meera@outlook.com');

select *from Userss

select *from Userss where email NOT LIKE '%@gmail.com'

/*2) Find Records Excluding a Given Set of Values

	An e-commerce platform tracks customer orders. Some orders are marked as cancelled or returned, and the business team wants to analyze only the valid orders.
Table: Orders
╔═════════════╦══════════╗
║   Column    ║   Type   ║
╠═════════════╬══════════╣
║  order_id   ║   int    ║
║─────────────┼──────────║
║ customer_id ║   int    ║
║─────────────┼──────────║
║   status    ║ varchar  ║
╚═════════════╩══════════╝

order_id is the primary key.
Each row represents one order.
status can be values like: 'Completed', 'Cancelled', 'Returned', 'Pending', 'Shipped', 'Processing'.
Write an SQL query to return all orders whose status is NOT:
'Cancelled'
'Returned'
Return: order_id | customer_id | status
Result can be returned in any order.

Example 1
Input:
Orders:
╔══════════╦═════════════╦═══════════╗
║ order_id ║ customer_id ║  status   ║
╠══════════╬═════════════╬═══════════╣
║    1     ║     101     ║ Completed ║
║──────────┼─────────────┼───────────║
║    2     ║     102     ║ Cancelled ║
║──────────┼─────────────┼───────────║
║    3     ║     103     ║ Returned  ║
║──────────┼─────────────┼───────────║
║    4     ║     104     ║  Pending  ║
╚══════════╩═════════════╩═══════════╝

Output:
╔══════════╦═════════════╦═══════════╗
║ order_id ║ customer_id ║  status   ║
╠══════════╬═════════════╬═══════════╣
║    1     ║     101     ║ Completed ║
║──────────┼─────────────┼───────────║
║    4     ║     104     ║  Pending  ║
╚══════════╩═════════════╩═══════════╝

Explanation:
Orders with status Cancelled and Returned are excluded.*/
create table orders(order_id int primary key,customer_id int,status varchar(50))

insert into orders values(1,101,'completed'),(2,102,'cancelled'),(3,103,'returned'),
(4,104,'pending');

select *from orders

select *from orders where status NOT IN('cancelled','returned')

/*3) Find Salaries Outside the Expected Range

	A company stores employee salary information to monitor compensation fairness. The HR team wants to identify employees whose salaries fall outside an acceptable range.
Table: Employees
╔══════════╦══════════╗
║  Column  ║   Type   ║
╠══════════╬══════════╣
║  emp_id  ║   int    ║
║──────────┼──────────║
║   name   ║ varchar  ║
║──────────┼──────────║
║  salary  ║   int    ║
╚══════════╩══════════╝

emp_id is the primary key.
Each row represents one employee and their salary.
Write an SQL query to return all employees whose salary is NOT between 30,000 and 80,000 (inclusive).
Return: emp_id | name | salary
The result can be returned in any order.

Example 1
Input:
Employees:
╔══════════╦══════════╦══════════╗
║  emp_id  ║   name   ║  salary  ║
╠══════════╬══════════╬══════════╣
║    1     ║  Aarav   ║  25000   ║
║──────────┼──────────┼──────────║
║    2     ║   Neha   ║  30000   ║
║──────────┼──────────┼──────────║
║    3     ║  Rohan   ║  50000   ║
║──────────┼──────────┼──────────║
║    4     ║  Meera   ║  85000   ║
╚══════════╩══════════╩══════════╝  
Output:
╔══════════╦══════════╦══════════╗
║  emp_id  ║   name   ║  salary  ║
╠══════════╬══════════╬══════════╣
║    1     ║  Aarav   ║  25000   ║
║──────────┼──────────┼──────────║
║    4     ║  Meera   ║  85000   ║
╚══════════╩══════════╩══════════╝

Explanation
30,000 and 80,000 are included in the valid range.
Aarav earns less than 30,000, included.
Meera earns more than 80,000, included.
Neha and Rohan are inside the range, excluded.*/
create table Employees(emp_id int primary key,name varchar(30),salary int)

insert into Employees values(1,'Aarav',25000),(2,'Neha',30000),(3,'Rohan',50000),(4,'Meera',85000)

select *from Employees

select *from Employees where salary NOT BETWEEN 30000 and 80000











