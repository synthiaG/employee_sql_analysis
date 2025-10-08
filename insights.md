# Employees SQL Analysis- Insights Report
The report summarises key insights  discovered through SQL analysis on the Employees Data set.
The queries were designed to answer common HR questions about workforces, salary and departmental performaces.

## 1 Data Verification
**Question** Show all the columns in the  table departments,employees,job_history,jobs,locations
**Purpose**To confirm all the required data is available and in the correct format.
**Insight** All tables contained complete and consistent records

## 2 Workforce Overview
**Question** How many Employees work in each department?
**Insight** Department headcount helps HR  identify  which teams are expanding or under-resourced

Used:'group by DEPT_ID'
Result:Software Development had the highest Employee Count

## 3 Salary Analysis by Department
**Question** What is the average salary in each department?
**Insight** This helps the company to allign pay scales with the market rates.

Used : 'group by DEPT_ID'
Result:Arichitec group has the the highest Average Salary

## 4 High Earners
**Question** Who are the highest paid Employees overall and within each department?
**Insight** Identify potential retention risks

Used : Window Function 'rank() over() Partition by department '
Result: Highest paid employee overall earns approximately 100,000,, located in the Architec Department and 80,000 located in Software Development Department.

## 5 Salary Vs Department Average
**Question**Which Employee earn more than their department Average?
**Insight** Reveal Top Performance or cases where salary adjustment may be  needed.

Used: Subquery comparing individual salaries and departmental avg(Salary)
Result: As per my data, It's only one individual Senior Software Developes

## 6 Key Takeaways
Salary distribution varies widely by department, Suggesting potental room for standardization.
Employess have no job history changes Indicating strong retention or lack of Internal Mobility.

 


## Recommendation
Conduct a salary structure review to ensure equity across departments.

Encourage internal mobility programs to retain and develop top talent.

Introduce periodic workforce analytics to monitor salary trends and departmental growth.


