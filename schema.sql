create table Employees
(
EMP_ID   CHAR(20) primary key ,
F_NAME   VARCHAR(50) not null ,       
L_NAME  VARCHAR(50) not null,
SSN  char (20),
B_DATE DATE,
SEX CHAR (1) ,
ADDRESS  varchar(20),
JOB_ID INT ,
SALARY  decimal  (10),
MANAGER_ID INT ,
DEPT_ID INT
);

create table JOB_HISTORY
(
EMP_ID CHAR (20) not null,
START_DATE DATE ,
JOB_ID   INT ,
DEPT_ID INT 

);

create table JOBS
(
JOB_ID  INT  primary key,
JOB_TITLE  VARCHAR (50),
MIN_SALARY decimal (10),
MAX_SALARY decimal (10)
);

create table DEPARTMENTS
(
DEPT_ID_DEP INT (9)  primary key,
DEP_NAME VARCHAR (50),
MANAGER_ID INT ,
LOC_ID CHAR (10)
);

create table LOCATIONS 
(
LOCT_ID   CHAR(10)  primary key,
DEP_ID_LOC INT 
);
