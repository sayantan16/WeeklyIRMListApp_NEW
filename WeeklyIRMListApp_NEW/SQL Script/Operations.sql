USE IRMDb;
GO


-- Create and Add Seed to Summary Table
CREATE Procedure spCreateSummaryWithSeed
AS
BEGIN

CREATE Table dbo.Summaries(
	SummaryId INT NOT NULL PRIMARY KEY,
	SummaryValue VARCHAR(50) NOT NULL
);

INSERT Into dbo.Summaries(SummaryId, SummaryValue)
VALUES	(1, 'Application Release'),
		(2, 'Application Testing'),
		(3, 'Application Development');

SELECT * From dbo.Summaries;
END;
GO


-- Create and Add Seed to Application Table
CREATE Procedure spCreateApplicationWithSeed
AS
BEGIN

CREATE Table dbo.Applications(
	AppId INT NOT NULL PRIMARY KEY,
	[Application] VARCHAR(50) NOT NULL,
	AppSummary INT, FOREIGN KEY(AppSummary) REFERENCES dbo.Summaries(SummaryId)
);

INSERT Into dbo.Applications(AppId, Application, AppSummary)
VALUES	(1, 'AppABC', 1),
		(2, 'AppDEF', 3),
		(3, 'AppGHI', 3),
		(4, 'AppJKL', 2),
		(5, 'AppXYZ', 2),
		(6, 'App123', 3),
		(7, 'App000', 1);

SELECT * From dbo.Applications;
END;
GO


-- Create and Add Seed to Issues Table
CREATE Procedure spCreateIssuesWithSeed
AS
BEGIN

CREATE Table dbo.Issues(
	IssueId INT NOT NULL PRIMARY KEY,
	IssueType VARCHAR(50) NOT NULL
);

INSERT Into dbo.Issues(IssueId, IssueType)
VALUES	(1, 'System Maintenance'),
		(2, 'HotFix'),
		(3, 'General Release'),
		(4, 'Interim Release');

SELECT * From dbo.Issues;
END;
GO



-- Create and Add Seed to Status Table
CREATE Procedure spCreateStatusWithSeed
AS
BEGIN

CREATE Table dbo.Status(
	StatusId INT NOT NULL PRIMARY KEY,
	StatusVal VARCHAR(50) NOT NULL
);

INSERT Into dbo.Status(StatusId, StatusVal)
VALUES	(1, 'RELEASE REQUEST OPENED'),
		(2, 'IN TAKEOFFS APPROVAL');

SELECT * From dbo.Status;
END;
GO



-- Create and Add Seed to Review Table
CREATE Procedure spCreateReviewWithSeed
AS
BEGIN

CREATE Table dbo.Reviews(
	ReviewId INT NOT NULL PRIMARY KEY,
	ReviewStatus VARCHAR(50) NOT NULL
);

INSERT Into dbo.Reviews(ReviewId, ReviewStatus)
VALUES	(1, 'PENDING'),
		(2, 'IN PROGRESS'),
		(3, 'ON SCHEDULE');

SELECT * From dbo.Reviews;
END;
GO




-- Create and Add Seed to Build Table
CREATE Procedure spCreateBuildWithSeed
AS
BEGIN

CREATE Table dbo.Builds(
	BuildId INT NOT NULL PRIMARY KEY,
	BuildType VARCHAR(50) NOT NULL
);

INSERT Into dbo.Builds(BuildId, BuildType)
VALUES	(1, 'MANUAL'),
		(2, 'MANUAL-SOC'),
		(3, 'OCTOPUS');

SELECT * From dbo.Builds;
END;
GO



-- Create and Add Seed to User Table
CREATE Procedure spCreateUserWithSeed
AS
BEGIN

CREATE Table dbo.Users(
	UserId INT NOT NULL PRIMARY KEY,
	UserFirstName VARCHAR(50) NOT NULL,
	UserLastName VARCHAR(50) NOT NULL
);

INSERT Into dbo.Users(UserId, UserFirstName, UserLastName)
VALUES	(1, 'Maya', 'Patel'),
		(2, 'Christopher', 'Evans'),
		(3, 'Olivia', 'Jones'),
		(4, 'Sarah', 'Lopez'),
		(5, 'Ethan', 'Garcia'),
		(6, 'David', 'Miller'),
		(7, 'Sophia', 'Hernandez'),
		(8, 'Matthew', 'Lee'),
		(9, 'Ava', 'Wilson'),
		(10, 'Noah', 'Brown'),
		(11, 'Chloe', 'Robinson'),
		(12, 'Michael', 'Walker'),
		(13, 'Mia', 'Garcia'),
		(14, 'William', 'Anderson'),
		(15, 'Isabella', 'King'),
		(16, 'James', 'Moore'),
		(17, 'Charlotte', 'Thomas'),
		(18, 'Daniel', 'Lewis'),
		(19, 'Evelyn', 'Young'),
		(20, 'Benjamin', 'Clark'),
		(21, 'Ashley', 'Hernandez'),
		(22, 'Alexander', 'Young'),
		(23, 'Catherine', 'Lopez'),
		(24, 'Brandon', 'Morris'),
		(25, 'Sophia', 'Lee'),
		(26, 'Emily', 'Garcia'),
		(27, 'David', 'Hernandez'),
		(28, 'Olivia', 'Brown'),
		(29, 'Michael', 'Young'),
		(30, 'Jessica', 'Moore'),
		(31, 'Christopher', 'King'),
		(32, 'Ava', 'Lopez'),
		(33, 'Sarah', 'Walker'),
		(34, 'Ethan', 'Lewis'),
		(35, 'Chloe', 'Evans'),
		(36, 'William', 'Thomas'),
		(37, 'Isabella', 'Miller'),
		(38, 'James', 'Robinson'),
		(39, 'Ashley', 'Clark'),
		(40, 'Aisha', 'Patel'),
		(41, 'Sarah', 'Miller'),
		(42, 'David', 'Chen'),
		(43, 'Evelyn', 'Garcia'),
		(44, 'Alexander', 'Jones');

SELECT * From dbo.Users;
END;
GO





-- Create and Add Seed to WeeklyIRMList Table
CREATE Procedure spCreateWeeklyIRMWithSeed
AS
BEGIN

CREATE Table dbo.WeeklyIRMList(
	[Key] VARCHAR(50) NOT NULL PRIMARY KEY,
	ChangeTicket VARCHAR(50) NOT NULL,
	IssueType INT NOT NULL Foreign Key (IssueType) References dbo.Issues(IssueId),
	Applications INT NOT NULL Foreign Key (Applications) References dbo.Applications(AppId),
	Reporter INT NOT NULL Foreign Key (Reporter) References dbo.Users(UserId),
	Status INT NOT NULL Foreign Key (Status) References dbo.Status(StatusId),
	Created DATETIME NOT NULL,
	StartDateTime DATETIME NOT NULL,
	TargetEndDateTime DATETIME NOT NULL,
	ReviewStatus INT NOT NULL Foreign Key (ReviewStatus) References dbo.Reviews(ReviewId),
	PrerequisiteTicket VARCHAR(50) NOT NULL,
	MiddlewareTask VARCHAR(50) NOT NULL,
	BuildType INT NOT NULL Foreign Key (BuildType) References dbo.Builds(BuildId),
	ElevatedPermission VARCHAR(50) NOT NULL,
	TakeoffsOwner INT NOT NULL Foreign Key (TakeoffsOwner) References dbo.Users(UserId),
	Remarks VARCHAR(MAX) NOT NULL
);

INSERT Into dbo.WeeklyIRMList([Key],ChangeTicket,IssueType,Applications,Reporter,
								Status,Created,StartDateTime,TargetEndDateTime,ReviewStatus,
								PrerequisiteTicket,MiddlewareTask,BuildType,ElevatedPermission,
								TakeoffsOwner,Remarks)
VALUES 
('IRM-12345', 'CHG0012345', 4, 3, 9, 2, '07/03/2024 12:37:19', '07/05/2024 12:37:19', '07/05/2024 14:37:19', 2, 'CHG0012345', 'TASK123', 1, 'NA', 44, 'Investigate potential performance bottleneck in a module.'),
('IRM-12346', 'CHG0012346', 1, 3, 8, 2, '06/25/2024 08:21:43', '06/26/2024 08:21:43', '06/26/2024 18:21:43', 3, 'CHG0012346', 'TASK124', 1, 'YES', 34, 'Need clarification on expected behavior for a feature.'),
('IRM-12347', 'CHG0012347', 4, 4, 8, 1, '06/22/2024 18:54:02', '06/23/2024 18:54:02', '06/23/2024 19:54:02', 2, 'CHG0012347', 'None', 2, 'NA', 32, 'User reported issue with functionality. Replicate and provide details.'),
('IRM-12348', 'CHG0012348', 4, 7, 23, 1, '07/09/2024 04:12:58', '07/10/2024 04:12:58', '07/10/2024 05:12:58', 3, 'CHG0012348', 'TASK126', 1, 'YES', 40, 'Missing documentation for a configuration option. Please provide.'),
('IRM-12349', 'CHG0012349', 3, 2, 24, 1, '06/29/2024 21:09:35', '06/30/2024 21:09:35', '06/30/2024 23:09:35', 3, 'CHG0012349', 'TASK127', 3, 'NA', 37, 'Error message encountered: "[error message]". Investigate root cause.'),
('IRM-12350', 'CHG0012350', 1, 4, 10, 1, '06/27/2024 01:47:21', '06/29/2024 01:47:21', '06/29/2024 05:47:21', 3, 'CHG0012350', 'None', 1, 'NA', 40, 'Unit tests failing for a function. Fix required.'),
('IRM-12351', 'CHG0012351', 1, 1, 9, 2, '07/04/2024 10:26:14', '07/08/2024 10:26:14', '07/08/2024 11:26:14', 2, 'CHG0012351', 'None', 3, 'YES', 26, 'Requesting code review for changes made to a file.'),
('IRM-12352', 'CHG0012352', 4, 7, 3, 2, '06/21/2024 05:01:47', '06/25/2024 05:01:47', '06/25/2024 07:01:47', 2, 'CHG0012352', 'None', 2, 'NA', 31, 'Data inconsistency identified in a table. Requires investigation.'),
('IRM-12353', 'CHG0012353', 1, 2, 12, 1, '07/02/2024 17:51:40', '07/03/2024 17:51:40', '07/03/2024 18:51:40', 2, 'CHG0012353', 'TASK131', 2, 'YES', 28, 'Need access to a resource to complete development task.'),
('IRM-12354', 'CHG0012354', 4, 7, 14, 1, '06/23/2024 09:34:13', '06/25/2024 09:34:13', '06/25/2024 10:34:13', 1, 'CHG0012354', 'TASK132', 2, 'NA', 44, 'External API integration issue. Verify compatibility with our system.'),
('IRM-12355', 'CHG0012355', 2, 1, 16, 1, '06/28/2024 03:18:46', '06/29/2024 03:18:46', '06/29/2024 05:18:46', 1, 'CHG0012355', 'TASK133', 2, 'YES', 40, 'User interface (UI) element requires redesign for better usability.'),
('IRM-12356', 'CHG0012356', 4, 6, 7, 1, '07/01/2024 20:43:19', '07/07/2024 20:43:19', '08/07/2024 00:43:19', 1, 'CHG0012356', 'TASK134', 2, 'NA', 39, 'Regression identified in functionality after recent update. Fix needed.'),
('IRM-12357', 'CHG0012357', 4, 2, 5, 1, '06/20/2024 14:07:52', '06/21/2024 14:07:52', '06/21/2024 15:07:52', 2, 'CHG0012357', 'TASK135', 2, 'NA', 33, 'Update database schema to accommodate new data model requirements.'),
('IRM-12358', 'CHG0012358', 3, 5, 11, 1, '07/07/2024 07:17:45', '07/09/2024 07:17:45', '07/09/2024 08:17:45', 1, 'CHG0012358', 'TASK136', 1, 'YES', 28, 'Explore potential security implications of implementing a feature.'),
('IRM-12359', 'CHG0012359', 3, 6, 21, 1, '06/26/2024 15:52:18', '06/29/2024 15:52:18', '06/29/2024 18:52:18', 2, 'CHG0012359', 'TASK137', 2, 'NA', 27, 'Performance optimization needed for functionality to meet user needs.'),
('IRM-12360', 'CHG0012360', 3, 7, 24, 2, '07/10/2024 14:46:51', '07/12/2024 14:46:51', '07/12/2024 15:46:51', 1, 'CHG0012360', 'None', 3, 'YES', 33, 'Identify root cause of memory leak in a module.'),
('IRM-12361', 'CHG0012361', 2, 1, 5, 1, '06/24/2024 06:25:49', '06/25/2024 06:25:49', '06/25/2024 07:25:49', 1, 'CHG0012361', 'TASK139', 3, 'NA', 40, 'Missing edge case handling for a scenario. Needs implementation.'),
('IRM-12362', 'CHG0012362', 1, 7, 23, 1, '07/06/2024 11:01:22', '07/07/2024 11:01:22', '07/07/2024 12:01:22', 1, 'CHG0012362', 'TASK140', 1, 'NA', 31, 'Requesting clarification on acceptance criteria for this issue.'),
('IRM-12363', 'CHG0012363', 1, 7, 1, 2, '06/20/2024 22:32:25', '06/21/2024 22:32:25', '06/21/2024 23:32:25', 1, 'CHG0012363', 'None', 3, 'YES', 39, 'Investigate compatibility issues with a browser/OS version.'),
('IRM-12364', 'CHG0012364', 2, 4, 21, 1, '07/05/2024 18:36:57', '07/08/2024 18:36:57', '07/08/2024 19:36:57', 3, 'CHG0012364', 'TASK142', 2, 'NA', 42, 'Data migration script failing. Requires debugging and correction.'),
('IRM-12365', 'CHG0012365', 1, 5, 16, 1, '06/22/2024 13:09:04', '06/23/2024 13:09:04', '06/23/2024 14:09:04', 2, 'CHG0012365', 'TASK143', 2, 'YES', 29, 'User interface (UI) bug reported: [describe bug briefly]. Fix required.'),
('IRM-12366', 'CHG0012366', 4, 2, 25, 2, '06/29/2024 07:54:30', '06/24/2024 07:54:30', '06/24/2024 09:54:30', 2, 'CHG0012366', 'None', 1, 'NA', 38, 'Need additional information from user to replicate and diagnose issue.'),
('IRM-12367', 'CHG0012367', 3, 5, 7, 1, '07/08/2024 00:29:03', '07/09/2024 00:29:03', '07/09/2024 01:29:03', 2, 'CHG0012367', 'None', 3, 'NA', 41, 'Deployment script failing. Investigate and resolve before next release.'),
('IRM-12368', 'CHG0012368', 1, 4, 2, 1, '06/27/2024 23:23:56', '06/29/2024 23:23:56', '06/29/2024 01:29:03', 3, 'CHG0012368', 'TASK146', 3, 'YES', 39, 'Reviewing code for potential security vulnerabilities.'),
('IRM-12369', 'CHG0012369', 3, 6, 20, 2, '07/03/2024 05:04:32', '07/08/2024 05:04:32', '07/08/2024 06:04:32', 2, 'CHG0012369', 'TASK147', 1, 'NA', 34, 'Consider accessibility guidelines when designing the new feature.'),
('IRM-12370', 'CHG0012370', 4, 7, 4, 2, '06/21/2024 19:38:09', '06/29/2024 19:38:09', '06/29/2024 20:38:09', 1, 'CHG0012370', 'None', 1, 'YES', 44, 'Third-party library causing conflicts. Update or find alternative.'),
('IRM-12371', 'CHG0012371', 4, 6, 8, 2, '06/25/2024 02:48:06', '06/26/2024 02:48:06', '06/26/2024 06:48:06', 3, 'CHG0012371', 'None', 3, 'NA', 28, 'Integrate unit tests for newly implemented functionality.'),
('IRM-12372', 'CHG0012372', 1, 2, 13, 2, '07/09/2024 13:03:39', '07/19/2024 13:03:39', '07/19/2024 14:03:39', 3, 'CHG0012372', 'None', 3, 'NA', 39, 'Investigate potential data loss during an operation.'),
('IRM-12373', 'CHG0012373', 1, 1, 16, 2, '06/28/2024 10:43:13', '06/29/2024 10:43:13', '06/29/2024 13:43:13', 2, 'CHG0012373', 'None', 3, 'YES', 34, 'Requesting peer review for proposed solution to this issue.'),
('IRM-12374', 'CHG0012374', 4, 6, 8, 1, '07/02/2024 03:18:06', '07/04/2024 03:18:06', '07/04/2024 06:18:06', 1, 'CHG0012374', 'TASK152', 2, 'NA', 40, 'Update documentation to reflect changes made in recent update.'),
('IRM-12375', 'CHG0012375', 4, 5, 18, 2, '06/23/2024 16:52:39', '06/24/2024 16:52:39', '06/24/2024 17:52:39', 1, 'CHG0012375', 'TASK153', 2, 'YES', 40, 'Consider browser compatibility testing for this new feature.'),
('IRM-12376', 'CHG0012376', 2, 7, 1, 2, '06/30/2024 04:17:54', '07/03/2024 04:17:54', '07/03/2024 05:17:54', 1, 'CHG0012376', 'TASK154', 3, 'NA', 33, 'Investigate performance impact of implementing this new functionality.'),
('IRM-12377', 'CHG0012377', 1, 3, 15, 1, '07/05/2024 01:51:30', '07/06/2024 01:51:30', '07/06/2024 02:51:30', 3, 'CHG0012377', 'TASK155', 3, 'NA', 26, 'Data validation failing for unexpected input. Needs improvement.'),
('IRM-12378', 'CHG0012378', 2, 4, 11, 2, '06/20/2024 07:42:27', '06/23/2024 07:42:27', '06/23/2024 09:42:27', 3, 'CHG0012378', 'None', 1, 'YES', 28, 'Review error logs for potential clues about the root cause of the issue.'),
('IRM-12379', 'CHG0012379', 1, 3, 14, 2, '07/07/2024 09:26:07', '07/08/2024 09:26:07', '07/08/2024 12:26:07', 2, 'CHG0012379', 'TASK157', 3, 'NA', 32, 'User interface (UI) element not responsive on mobile devices. Fix needed.'),
('IRM-12380', 'CHG0012380', 2, 4, 2, 1, '06/26/2024 22:11:40', '06/27/2024 22:11:40', '06/27/2024 23:11:40', 1, 'CHG0012380', 'TASK158', 2, 'YES', 33, 'Consider user experience (UX) when designing the solution for this issue.'),
('IRM-12381', 'CHG0012381', 1, 7, 2, 2, '07/10/2024 07:46:23', '07/11/2024 07:46:23', '07/11/2024 08:46:23', 3, 'CHG0012381', 'None', 3, 'NA', 31, 'Requesting additional time to complete this task due to unforeseen complexity.'),
('IRM-12382', 'CHG0012382', 3, 5, 25, 1, '06/24/2024 00:54:16', '06/25/2024 00:54:16', '06/25/2024 02:54:16', 3, 'CHG0012382', 'TASK160', 2, 'NA', 39, 'Investigate potential scalability issues with increased user load.'),
('IRM-12383', 'CHG0012383', 3, 1, 6, 1, '07/01/2024 04:17:43', '07/04/2024 04:17:43', '07/04/2024 05:17:43', 3, 'CHG0012383', 'TASK161', 3, 'YES', 34, 'Update test data to reflect changes made in the database schema.'),
('IRM-12384', 'CHG0012384', 3, 7, 6, 2, '06/29/2024 09:14:27', '07/02/2024 09:14:27', '07/02/2024 10:14:27', 1, 'CHG0012384', 'None', 3, 'NA', 35, 'Consider edge cases and error handling when implementing the solution.');

SELECT * From dbo.WeeklyIRMList;
END;
GO





--Select all table all rows
Create Procedure spGetAllRowsAllTables
As
Begin
	SELECT * From dbo.Summaries;
	SELECT * From dbo.Applications;
	SELECT * From dbo.Issues;
	SELECT * From dbo.Status;
	SELECT * From dbo.Reviews;
	SELECT * From dbo.Builds;
	SELECT * From dbo.Users;
	SELECT * From dbo.WeeklyIRMList;
End;
GO








-- Consolidated View Model SP
CREATE PROCEDURE spWeeklyIRMView
AS
BEGIN
    -- Drop the temporary table if it exists
    IF OBJECT_ID('tempdb..#weeklyIRMResults') IS NOT NULL
    BEGIN
        DROP TABLE #weeklyIRMResults;
    END

    -- Create the temporary table
    CREATE TABLE #weeklyIRMResults (
        [Key] VARCHAR(50), 
        ChangeTicket VARCHAR(50), 
        Application VARCHAR(50), 
        Summary VARCHAR(50),
        IssueType VARCHAR(50),
        Reporter VARCHAR(50),
        Status VARCHAR(50),
        Created DATETIME,
        StartDateTime DATETIME,
        TargetEndDateTime DATETIME,
        ReviewStatus VARCHAR(50),
        PrerequisiteTicket VARCHAR(50),
        MiddlewareTask VARCHAR(50),
        BuildType VARCHAR(50),
        ElevatedPermission VARCHAR(50),
        TakeoffsOwner VARCHAR(50),
        Remarks VARCHAR(MAX),
        Flag VARCHAR(MAX)
    );

    -- Insert data into the temporary table
    INSERT INTO #weeklyIRMResults
    SELECT 
        WL.[Key], 
        WL.ChangeTicket, 
        APP.Application as Application, 
        Sm.SummaryValue as Summary,
        IST.IssueType,
        CONCAT(UR.UserFirstName, ' ', UR.UserLastName) as Reporter,
        ST.StatusVal as Status,
        WL.Created,
        WL.StartDateTime,
        WL.TargetEndDateTime,
        RV.ReviewStatus as ReviewStatus,
        WL.PrerequisiteTicket,
        WL.MiddlewareTask,
        BD.BuildType as BuildType,
        WL.ElevatedPermission,
        CONCAT(UO.UserFirstName, ' ', UO.UserLastName) as TakeoffsOwner,
        WL.Remarks,
        CASE
            WHEN ABS(DATEDIFF(HOUR, WL.Created, WL.StartDateTime)) <= 24 THEN 'Started within 24 Hours of Creation'
            WHEN ABS(DATEDIFF(HOUR, WL.Created, GETDATE())) <= 48 AND UPPER(ST.StatusVal) IN ('RELEASE REQUEST OPENED', 'IN TAKEOFFS APPROVAL')
                THEN 'Difference between start date and today''s date is less than 48 hours for RRO or ITO status'
            ELSE 'NA'
        END AS Flag
    FROM dbo.WeeklyIRMList WL 
    JOIN dbo.Applications APP ON WL.Applications = APP.AppId 
    JOIN dbo.Summaries Sm ON APP.AppSummary = Sm.SummaryId
    JOIN dbo.Issues IST ON WL.IssueType = IST.IssueId
    JOIN dbo.Users UR ON WL.Reporter = UR.UserId
    JOIN dbo.Status ST ON WL.Status = ST.StatusId
    JOIN dbo.Reviews RV ON WL.ReviewStatus = RV.ReviewId
    JOIN dbo.Builds BD ON WL.BuildType = BD.BuildId
    JOIN dbo.Users UO ON WL.TakeoffsOwner = UO.UserId;

    -- Select from the temporary table to ensure data is populated
    SELECT * FROM #weeklyIRMResults;
END;
GO






-- Consolidated View Model SP with date range input
CREATE PROCEDURE spWeeklyIRMDateView
    @startDate DATETIME,
    @endDate DATETIME
AS
BEGIN
    IF OBJECT_ID('tempdb..#weeklyIRMResultNEW') IS NOT NULL
        DROP TABLE #weeklyIRMResultNEW;

    CREATE TABLE #weeklyIRMResultNEW (
        [Key] VARCHAR(50), 
        ChangeTicket VARCHAR(50), 
        Application VARCHAR(50), 
        Summary VARCHAR(50),
        IssueType VARCHAR(50),
        Reporter VARCHAR(50),
        Status VARCHAR(50),
        Created DATETIME,
        StartDateTime DATETIME,
        TargetEndDateTime DATETIME,
        ReviewStatus VARCHAR(50),
        PrerequisiteTicket VARCHAR(50),
        MiddlewareTask VARCHAR(50),
        BuildType VARCHAR(50),
        ElevatedPermission VARCHAR(50),
        TakeoffsOwner VARCHAR(50),
        Remarks VARCHAR(MAX),
        Flag VARCHAR(MAX)
    );

    -- Insert the results of the existing stored procedure into the temporary table
    INSERT INTO #weeklyIRMResultNEW
    EXEC spWeeklyIRMView;

    -- Select from the temporary table with date range filtering
    SELECT *
    FROM #weeklyIRMResultNEW
    WHERE StartDateTime >= @startDate AND TargetEndDateTime <= @endDate
    ORDER BY StartDateTime;

    -- Drop the temporary table
    DROP TABLE #weeklyIRMResultNEW;
END;
GO










-- Execution Statements (CREATE)
EXEC spCreateSummaryWithSeed;

EXEC spCreateApplicationWithSeed;

EXEC spCreateIssuesWithSeed;

EXEC spCreateStatusWithSeed;

EXEC spCreateReviewWithSeed;

EXEC spCreateBuildWithSeed;

EXEC spCreateUserWithSeed;

EXEC spCreateWeeklyIRMWithSeed;



-- Execution Statements (GET ALL ROWS ALL TABLES)
EXEC spGetAllRowsAllTables;





-- Consolidate View SP executions

EXEC spWeeklyIRMView;



-- Example input parameters for start date, end date
DECLARE @exampleStartDate DATETIME = '2024-07-03 00:00:00';
DECLARE @exampleEndDate DATETIME = '2024-07-05 00:00:00';

EXEC spWeeklyIRMDateView @startDate = @exampleStartDate, @endDate = @exampleEndDate;




