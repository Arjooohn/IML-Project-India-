--VIEW 1
CREATE VIEW Employee_Is_New AS 
SELECT Employee_ID, Employee_Fname|| '  ' ||Employee_Initial||'. ' ||Employee_Lname AS Employee_Name, Hire_Date
FROM Employee  
WHERE Employee.Hire_Date > '01-JAN-2019';

SELECT * FROM Employee_Is_New;
