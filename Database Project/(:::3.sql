

--Trigger - every time the user will make an INSERT statement into the Employee table, it will trigger this trigger to check if the 
-- format of the Employee_ID is correctly written.

CREATE TRIGGER validate_employee_id 
BEFORE INSERT 
ON Employee
BEGIN 
    WHEN NEW.Employee_ID NOT LIKE 'E____%' THEN
    RAISE (abort, 'INVALID Employee_ID')
    END;
END;



-- INSERT INTO Employee (Employee_ID, Employee_Fname, Employee_Lname, Employee_Initial, Region_ID, Hire_Date) VALUES ('Z8888', 'Dela Cruz', 'John', 'A', 'R6000', '2020-10-10');
-- INSERT INTO Employee (Employee_ID, Employee_Fname, Employee_Lname, Employee_Initial, Region_ID, Hire_Date) VALUES ('E1018', 'Dela Cruz', 'John', 'A', 'R6000', '2020-10-10');

--SELECT * FROM Employee;


--2 Stored Procedures

--This Stored Procedure will select all the customer in a particular region
CREATE PROCEDURE SelectAllCustomer @Region_ID VARCHAR(8)
AS SELECT * FROM Customer WHERE Region_ID = @Region_ID 
GO;

EXEC SelectAllCustomer @Region_ID = 'Region_ID'; --change Region_ID
 
--Get all the number of employess in the task skill table
CREATE PROCEDURE GetNoOfEmployees
AS BEGIN 
SELECT No_Of_Employees FROM Task_Skills
GO;

EXEC GetNoOfEmployees;


--2 Create Views
--view the new employees (working less than 2019)
CREATE VIEW Employee_Is_New AS 
SELECT Employee_ID, Employee_Fname|| '  ' ||Employee_Initial||'. ' ||Employee_Lname AS Employee_Name, Employee.HireDate
FROM Employee  
WHERE Employee.Hire_Date > '2019-01-01 00:00:00.000'

SELECT * FROM Employee_Is_New;

--view the employee ID working as the longest time
CREATE VIEW Employee_LongestTime AS
AS SELECT Employee_ID, MAX(Hours_Worked)
FROM Work_Logs

SELECT * FROM Employee_LongestTime;


--Hindi pa nafifinalize to kasi hindi pa ako ganon kasure kung gagana to 
