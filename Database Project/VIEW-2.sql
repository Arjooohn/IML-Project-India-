--View 2
CREATE VIEW Employee_LongestTime AS
SELECT Employee_ID, Hours_Worked FROM Work_Logs WHERE (Employee_ID, Hours_Worked) IN ( SELECT Employee_ID, MAX(Hours_Worked)
FROM Work_Logs GROUP BY Employee_ID) ORDER BY Hours_Worked DESC, Employee_ID ASC;

SELECT * FROM Employee_LongestTime;


