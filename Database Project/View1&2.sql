/* New Updated View 1 */
CREATE VIEW Employee_Is_New AS 
SELECT Employee_ID, Employee_Fname|| '  ' ||Employee_Initial||'. ' ||Employee_Lname AS Employee_Name, Hire_Date
FROM Employee
WHERE Employee.Hire_Date > '2019-01-01 00:00:00.000';

SELECT * FROM Employee_Is_New;

/* New Updatedd View 2 */

CREATE VIEW Employee_LongestTime AS
SELECT Employee_ID, MAX(Hours_Worked)
FROM Work_Logs;

SELECT * FROM Employee_LongestTime;

/* May inayos akong onti sa Snytax. Also I think dapat we need to improve our code dito kasi need maging practical not just
na pinapakita lang natin yung buong employee - Vlad*/
