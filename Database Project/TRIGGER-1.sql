--Trigger1
DROP TRIGGER validate_emp;


CREATE TRIGGER validate_emp
BEFORE INSERT ON Employee
FOR EACH ROW 
DECLARE Employee_Error EXCEPTION;
PRAGMA EXCEPTION_INIT(Employee_Error, -20001);
BEGIN 
    IF :NEW.Employee_ID NOT LIKE 'E___%' THEN 
        raise_application_error(-20001, 'Invalid Format for Employee_ID' || chr(13));
    END IF;
END;
