--Second Stored Procedure

CREATE PROCEDURE NoOfEmployees
(
    E_EMPID OUT VARCHAR2,
    E_EMPFNAME OUT VARCHAR2,
    E_EMPIN OUT VARCHAR2,
    E_EMPLNAME OUT VARCHAR2,
    A_PID OUT VARCHAR2
)
IS
BEGIN 
SELECT Employee.Employee_ID, Employee.Employee_Fname, Employee.Employee_Initial, Employee.Employee_Lname, Assignment.Project_ID
INTO  E_EMPID, E_EMPFNAME, E_EMPIN, E_EMPLNAME, A_PID
FROM Employee, Assignment
WHERE Employee.Employee_ID = A_PID;

DBMS_OUTPUT.PUT_LINE ('Data Retrieved');
END;
