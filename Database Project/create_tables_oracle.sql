DROP TABLE Region CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Project CASCADE CONSTRAINTS;
DROP TABLE Project_Schedule CASCADE CONSTRAINTS;
DROP TABLE Assignment CASCADE CONSTRAINTS;
DROP TABLE Skill CASCADE CONSTRAINTS;
DROP TABLE Task_Skills CASCADE CONSTRAINTS;
DROP TABLE Skill_Employee CASCADE CONSTRAINTS;
DROP TABLE Bill CASCADE CONSTRAINTS;
DROP TABLE Work_Logs CASCADE CONSTRAINTS;

CREATE TABLE Region (
  Region_ID VARCHAR2(8) NOT NULL,
  Region_Name VARCHAR2(255) NOT NULL,
  CONSTRAINT PK_Region PRIMARY KEY (Region_ID),
  CHECK(Region_Name IN ('NW', 'SW', 'MN', 'MS', 'NE', 'SE'))
);

CREATE TABLE Customer (
  Customer_ID VARCHAR2(10) NOT NULL,
  Region_ID VARCHAR2(8) NOT NULL,
  Customer_Name VARCHAR2(255) NOT NULL,
  Phone_Number VARCHAR2(12) NOT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY (Customer_ID),
  CONSTRAINT FK_Customer_Region_ID
    FOREIGN KEY (Region_ID)
      REFERENCES Region(Region_ID)
);

CREATE TABLE Employee (
  Employee_ID VARCHAR2(10) NOT NULL,
  Employee_Fname VARCHAR2(30) NOT NULL,
  Employee_Lname VARCHAR2(30) NOT NULL,
  Employee_Initial VARCHAR2(3),
  Region_ID VARCHAR2(8) NOT NULL,
  Hire_Date DATE NOT NULL,
  CONSTRAINT PK_Employee PRIMARY KEY (Employee_ID),
  CONSTRAINT FK_Employee_Region_ID
    FOREIGN KEY (Region_ID)
      REFERENCES Region(Region_ID)
);

CREATE TABLE Project (
  Project_ID VARCHAR2(8) NOT NULL,
  Customer_ID VARCHAR2(10) NOT NULL,
  Project_Description VARCHAR2(255) NOT NULL,
  Project_Date DATE NOT NULL,
  Scheduled_StartDate DATE NOT NULL,
  Scheduled_EndDate DATE NOT NULL,
  Approx_Budget NUMBER(8, 2),
  Actual_StartDate DATE NOT NULL,
  Actual_EndDate DATE NOT NULL,
  Actual_Cost NUMBER(8, 2) NOT NULL,
  Manager_ID VARCHAR2(8) NOT NULL,
  CONSTRAINT PK_Project PRIMARY KEY (Project_ID),
  CONSTRAINT FK_Project_Customer_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID),
  CONSTRAINT FK_Project_Manager_ID
    FOREIGN KEY (Manager_ID)
    REFERENCES Employee(Employee_ID)
);

CREATE TABLE Project_Schedule (
  Task_ID VARCHAR2(8) NOT NULL,
  Project_ID VARCHAR2(8) NOT NULL,
  Task_Description VARCHAR2(255) NOT NULL,
  Start_Date DATE NOT NULL,
  End_Date DATE NOT NULL,
  CONSTRAINT PK_Project_Schedule PRIMARY KEY (Task_ID),
  CONSTRAINT FK_Project_Schedule_Project_ID
    FOREIGN KEY (Project_ID)
      REFERENCES Project(Project_ID)
);

CREATE TABLE Assignment (
  ProjAssignment_ID VARCHAR2(8) NOT NULL,
  Employee_ID VARCHAR2(10) NOT NULL,
  Project_ID VARCHAR2(8) NOT NULL,
  Task_ID VARCHAR2(8) NOT NULL,
  ProjAssignment_StartDate DATE NOT NULL,
  ProjAssignment_EndDate DATE NOT NULL,
  CONSTRAINT PK_Assignment PRIMARY KEY (ProjAssignment_ID),
  CONSTRAINT FK_Assignment_Employee_ID
    FOREIGN KEY (Employee_ID)
    REFERENCES Employee(Employee_ID),
  CONSTRAINT FK_Assignment_Project_ID
    FOREIGN KEY (Project_ID)
    REFERENCES Project(Project_ID),
  CONSTRAINT FK_Assignment_Task_ID
    FOREIGN KEY (Task_ID)
    REFERENCES Project_Schedule(Task_ID)
);

CREATE TABLE Skill (
  Skill_ID VARCHAR2(8) NOT NULL,
  Skill_Description VARCHAR2(255) NOT NULL,
  Skill_PayRate NUMBER(8, 2) NOT NULL,
  CHECK(Skill_Description IN ('Data Entry I', 'Data Entry II',
    'Systems Analyst I', 'Systems Analyst II', 'Database Designer I', 'Database Designer II', 'Java I', 'Java II', 'C++ I', 
    'C++ II', 'Python I', 'Python II', 'ColdFusion I', 'ColdFusion II', 'ASP I', 'ASP II', 'Oracle DBA', 'MS SQL Server DBA', 
    'Network Engineer I', 'Network Engineer II', 'Web Administrator', 'Technical Writer', 'Project Manager')),
  CONSTRAINT PK_Skill PRIMARY KEY (Skill_ID)
);

CREATE TABLE Task_Skills (
  Task_ID VARCHAR2(8) NOT NULL,
  Skill_ID VARCHAR2(8) NOT NULL,
  Project_ID VARCHAR2(8) NOT NULL,
  No_Of_Employees INTEGER NOT NULL,
  CONSTRAINT PK_Task_Skills PRIMARY KEY (Task_ID, Skill_ID, Project_ID),
  CONSTRAINT FK_Task_Skills_Task_ID
    FOREIGN KEY (Task_ID)
      REFERENCES Project_Schedule(Task_ID),
  CONSTRAINT FK_Task_Skills_Skill_ID
    FOREIGN KEY (Skill_ID)
      REFERENCES Skill(Skill_ID),
  CONSTRAINT FK_Task_Skills_Project_ID
    FOREIGN KEY (Project_ID)
      REFERENCES Project(Project_ID)
);

CREATE TABLE Skill_Employee (
  Employee_ID VARCHAR2(10) NOT NULL,
  Skill_ID VARCHAR2(8) NOT NULL,
  CONSTRAINT PK_Skill_Employee PRIMARY KEY (Employee_ID, Skill_ID),
  CONSTRAINT FK_Skill_Employee_Employee_ID
    FOREIGN KEY (Employee_ID)
      REFERENCES Employee(Employee_ID),
  CONSTRAINT FK_Skill_Employee_Skill_ID
    FOREIGN KEY (Skill_ID)
      REFERENCES Skill(Skill_ID)
);

CREATE TABLE Bill (
  Bill_Number VARCHAR2(10) NOT NULL,
  Bill_Date DATE NOT NULL,
  Total_Amount NUMBER(8, 2) NOT NULL,
  CONSTRAINT PK_Bill PRIMARY KEY (Bill_Number)
);

CREATE TABLE Work_Logs (
  WorkLog_ID VARCHAR2(8) NOT NULL,
  Employee_ID VARCHAR2(10) NOT NULL,
  Assignment_ID VARCHAR2(8) NOT NULL,
  Bill_Number VARCHAR2(10) NOT NULL,
  Hours_Worked NUMBER(3) NOT NULL,
  WL_Date DATE NOT NULL,
  CONSTRAINT PK_Work_Logs PRIMARY KEY (WorkLog_ID),
  CONSTRAINT FK_Work_Logs_Employee_ID
    FOREIGN KEY (Employee_ID)
      REFERENCES Employee(Employee_ID),
  CONSTRAINT FK_Work_Logs_Assignment_ID
    FOREIGN KEY (Assignment_ID)
      REFERENCES Assignment(ProjAssignment_ID),
  CONSTRAINT FK_Work_Logs_Bill_Number
    FOREIGN KEY (Bill_Number)
      REFERENCES Bill(Bill_Number)
);
