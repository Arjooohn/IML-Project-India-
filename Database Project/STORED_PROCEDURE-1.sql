--First Stored Procedure

CREATE PROCEDURE budgetcostdiff
(
    P_ID IN OUT VARCHAR2,
    P_D IN OUT VARCHAR2,
    A_B IN OUT NUMBER,
    A_C IN OUT NUMBER,
    BCD OUT NUMBER
)
IS
BEGIN
SELECT Project_ID, Project_Description, Approx_Budget, Actual_Cost, (Approx_Budget-Actual_Cost) AS "Budget and Cost Difference"
INTO P_ID, P_D, A_B, A_C, BCD
FROM Project;

DBMS_OUTPUT.PUT_LINE ('Budget and Cost Difference Report');


END;
