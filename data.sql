
insert into Employees ( EMP_ID,F_NAME , L_NAME ,SSN,  B_DATE, SEX ,  ADDRESS , JOB_ID,  SALARY , MANAGER_ID,DEPT_ID )
values 
(  "E1001" , "john" , "Thomas" , "123456"  ,  "1976-01-09", "M"  ,  "5631 Rice" ,100,100000 ,3001 ,2  ),
(   "E1002" , "Alice" ,   "James", "123457", "1972-07-31" ,  "F"  ,   "980 Berryin",200 ,80000,3002 , 5       ),
(   "E1003",   "Steve",  "Wells",  "123458" ,  "1980-08-10" , "M"  ,"291 Springs",  300,50000,3003 ,  5  );

insert into JOB_HISTORY ( EMP_ID,START_DATE, JOB_ID , DEPT_ID  )
values 
(  "E1001",  "2000-01-30" , 100    ,2           ),
(   "E1002",   "2010-08-16",   200,  5          ),
(  "E1003",       "2016-08-10",     300,  5     );

insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY)
values 
(  100 , "Sr.Architech" , 60000 ,100000     ),
(   200,   "Sr.SoftwareDeveloper" ,    60000,     80000  ),
(   300 ,    "Jr.SoftwareDevelope",   40000   ,60000    );

insert into  DEPARTMENTS ( DEPT_ID_DEP, DEP_NAME,  MANAGER_ID,  LOC_ID  )
values 
(  2 ,"Architec Group" ,3001 , "L0001"  ),
(   5 ,"Software Development", 3002  ,"L0002" ),
(   7 ,"Design Team",3003  ,"L0003"       );

insert into LOCATIONS ( LOCT_ID,DEP_ID_LOC)
values
( "L0001",2 ),
( "L0002",5 ),
( "L0003",7   ) ;
