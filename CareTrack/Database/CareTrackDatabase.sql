
/****** Object:  Database [CareTrack Database]    Script Date: 3/25/2025 11:09:57 PM ******/
CREATE DATABASE [CareTrack Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CareTrack Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CareTrack Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CareTrack Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CareTrack Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CareTrack Database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CareTrack Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CareTrack Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CareTrack Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CareTrack Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CareTrack Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CareTrack Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [CareTrack Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CareTrack Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CareTrack Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CareTrack Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CareTrack Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CareTrack Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CareTrack Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CareTrack Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CareTrack Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CareTrack Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CareTrack Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CareTrack Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CareTrack Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CareTrack Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CareTrack Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CareTrack Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CareTrack Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CareTrack Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CareTrack Database] SET  MULTI_USER 
GO
ALTER DATABASE [CareTrack Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CareTrack Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CareTrack Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CareTrack Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CareTrack Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CareTrack Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CareTrack Database] SET QUERY_STORE = ON
GO
ALTER DATABASE [CareTrack Database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CareTrack Database]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[BillingID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[due_date] [date] NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Care_Plan_Tasks]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Care_Plan_Tasks](
	[CareplanID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CareplanID] ASC,
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Caregiver]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caregiver](
	[CaregiverID] [int] NOT NULL,
	[name] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[SupervisorID] [int] NULL,
	[employment_date] [date] NULL,
	[signature] [varbinary](max) NULL,
	[status] [varchar](20) NULL,
	[hourly_rate] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CaregiverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarePlans]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarePlans](
	[PlanID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[details] [text] NULL,
	[last_updated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] NOT NULL,
	[name] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[address] [text] NULL,
	[CaregiverID] [int] NULL,
	[service_start_date] [date] NULL,
	[signature] [varbinary](max) NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[PayrollID] [int] NOT NULL,
	[CaregiverID] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[pay_period] [date] NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PayrollID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[role_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service_Logs]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Logs](
	[LogID] [int] NOT NULL,
	[CaregiverID] [int] NULL,
	[ClientID] [int] NULL,
	[date_time] [datetime] NULL,
	[tasks_performed] [text] NULL,
	[caregiver_signature] [varbinary](max) NULL,
	[cleint_signature] [varbinary](max) NULL,
	[notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts_Assignment]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts_Assignment](
	[ShiftID] [int] NOT NULL,
	[CaregiverID] [int] NULL,
	[ClientID] [int] NULL,
	[shift_date] [date] NULL,
	[status] [varchar](20) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[clock_in] [datetime] NULL,
	[clock_out] [datetime] NULL,
	[total_minutes] [int] NULL,
	[pay_amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supervisors]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisors](
	[SupervisorID] [int] NOT NULL,
	[name] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupervisorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskAssignment]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskAssignment](
	[TaskAssignment_ID] [int] IDENTITY(1,1) NOT NULL,
	[CaregiverID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[scheduled_date] [date] NOT NULL,
	[completion_status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskAssignment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [int] NOT NULL,
	[description] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/25/2025 11:09:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[CaregiverID] [int] NULL,
	[username] [varchar](50) NOT NULL,
	[password_hash] [varchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (1, 1)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (1, 2)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (1, 3)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (1, 5)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 1)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 2)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 3)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 4)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 5)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 6)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 7)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 8)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 9)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 10)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 11)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 12)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 13)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 14)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 15)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 16)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 17)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 18)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 19)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 20)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 21)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 22)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (2, 23)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (3, 8)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (3, 14)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 1)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 2)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 3)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 4)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 5)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 6)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 7)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 10)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 11)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 12)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 13)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 14)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 15)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 16)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 17)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (4, 18)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (5, 19)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (5, 20)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (5, 21)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (5, 22)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (5, 23)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (6, 4)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (6, 5)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (6, 7)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (6, 9)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (7, 1)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (7, 2)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (7, 3)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (7, 4)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (7, 5)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (7, 6)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (8, 1)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (8, 3)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (8, 4)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (8, 5)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (8, 8)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (8, 14)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (9, 12)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (9, 13)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (9, 15)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (9, 16)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (10, 1)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (10, 2)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (10, 3)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (10, 4)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (10, 5)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (10, 6)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (10, 9)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 1)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 2)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 3)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 4)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 5)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 6)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 7)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 8)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 10)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 11)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 12)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 13)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 14)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 15)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 16)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 17)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 18)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 19)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 20)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 21)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 22)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (11, 23)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (12, 7)
GO
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (12, 8)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (12, 14)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (12, 19)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (12, 20)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (12, 21)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (12, 22)
INSERT [dbo].[Care_Plan_Tasks] ([CareplanID], [TaskID]) VALUES (12, 23)
GO
INSERT [dbo].[Caregiver] ([CaregiverID], [name], [phone], [email], [SupervisorID], [employment_date], [signature], [status], [hourly_rate]) VALUES (1, N'Janice Smith', N'555-987-4563', N'Janice.Smith@gmail.com', 1, CAST(N'2018-04-22' AS Date), NULL, N'Active', CAST(18.00 AS Decimal(5, 2)))
INSERT [dbo].[Caregiver] ([CaregiverID], [name], [phone], [email], [SupervisorID], [employment_date], [signature], [status], [hourly_rate]) VALUES (2, N'Joshua Rogers', N'888-754-8456', N'Joshua.Rogers@yahoo.com', 1, CAST(N'2018-06-14' AS Date), NULL, N'Active', CAST(19.00 AS Decimal(5, 2)))
INSERT [dbo].[Caregiver] ([CaregiverID], [name], [phone], [email], [SupervisorID], [employment_date], [signature], [status], [hourly_rate]) VALUES (3, N'Brooklin Harrold', N'123-548-9634', N'Brooklin.Harrold@outlook.com', 1, CAST(N'2018-07-23' AS Date), NULL, N'Active', CAST(19.50 AS Decimal(5, 2)))
INSERT [dbo].[Caregiver] ([CaregiverID], [name], [phone], [email], [SupervisorID], [employment_date], [signature], [status], [hourly_rate]) VALUES (4, N'David Duncan', N'444-777-4444', N'David.Duncan@gmail.com', 2, CAST(N'2020-04-12' AS Date), NULL, N'Active', CAST(18.75 AS Decimal(5, 2)))
INSERT [dbo].[Caregiver] ([CaregiverID], [name], [phone], [email], [SupervisorID], [employment_date], [signature], [status], [hourly_rate]) VALUES (5, N'Michael Barry', N'555-888-9999', N'Michael.Barry@gmail.com', 2, CAST(N'2021-11-15' AS Date), NULL, N'Active', CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Caregiver] ([CaregiverID], [name], [phone], [email], [SupervisorID], [employment_date], [signature], [status], [hourly_rate]) VALUES (6, N'Bethany Jones', N'632-874-5214', N'Bethany.Jones@outlook.com', 2, CAST(N'2023-05-02' AS Date), NULL, N'Active', CAST(21.50 AS Decimal(5, 2)))
GO
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (1, 1, N'Basic Hygiene', CAST(N'2025-03-25T00:00:00.000' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (2, 2, N'Full Care Plan with meals', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (3, 3, N'Assistance with mobility', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (4, 4, N'Housekeeping and Hygiene', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (5, 5, N'Medication Supervision', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (6, 6, N'Daily morning assistance', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (7, 7, N'Bathing and grooming', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (8, 8, N'Mobility and Hygiene', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (9, 9, N'Light Housekeeping', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (10, 10, N'Hygiene and nutrition', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (11, 11, N'Full Service Plan', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
INSERT [dbo].[CarePlans] ([PlanID], [ClientID], [details], [last_updated]) VALUES (12, 12, N'Partial Support Only', CAST(N'2025-03-25T19:46:48.410' AS DateTime))
GO
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (1, N'Brandy Bonilla', N'443-294-7683', N'4194 Retreat Avenue', 1, CAST(N'2018-07-06' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (2, N'Corine Vincent', N'443-003-6440', N'4643 Forest Avenue', 1, CAST(N'2019-01-23' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (3, N'Otis Flowers', N'443-155-3736', N'2419 Henry Ford Avenue', 2, CAST(N'2020-02-27' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (4, N'Rae Mcdonald', N'443-839-0126', N'3578 Briarwood Drive', 2, CAST(N'2020-04-09' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (5, N'Lori Salas', N'443-088-1392', N'3590 Tenmile Road', 3, CAST(N'2020-07-24' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (6, N'Jimmy Oconnor', N'443-095-4630', N'4522 Wines Lane', 3, CAST(N'2021-01-21' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (7, N'Carole Vega', N'443-618-3431', N'1705 Hurry Street', 4, CAST(N'2021-09-17' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (8, N'Marlin Chase', N'443-795-0046', N'2771 Gateway Road', 4, CAST(N'2022-03-17' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (9, N'Harry Marsh', N'443-470-2918', N'4129 Angus Road', 5, CAST(N'2023-09-05' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (10, N'Dennis Hinton', N'443-517-5512', N'3827 Langtown Road', 5, CAST(N'2024-04-08' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (11, N'Lisa Harper', N'443-445-8026', N'824 Reeves Street', 6, CAST(N'2024-10-31' AS Date), NULL, N'Active')
INSERT [dbo].[Clients] ([ClientID], [name], [phone], [address], [CaregiverID], [service_start_date], [signature], [status]) VALUES (12, N'Selena Maria', N'443-179-6537', N'3000 Saint James Drive', 6, CAST(N'2024-12-06' AS Date), NULL, N'Active')
GO
INSERT [dbo].[Roles] ([RoleID], [role_name]) VALUES (2, N'Caregiver')
INSERT [dbo].[Roles] ([RoleID], [role_name]) VALUES (1, N'Supervisor')
GO
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (1, 1, 1, CAST(N'2025-05-01' AS Date), N'Scheduled', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (2, 1, 2, CAST(N'2025-05-02' AS Date), N'Scheduled', CAST(N'11:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (3, 2, 3, CAST(N'2025-05-03' AS Date), N'Scheduled', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (4, 2, 4, CAST(N'2025-05-04' AS Date), N'Scheduled', CAST(N'11:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (5, 3, 5, CAST(N'2025-05-05' AS Date), N'Scheduled', CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (6, 3, 6, CAST(N'2025-05-06' AS Date), N'Scheduled', CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (7, 4, 7, CAST(N'2025-05-07' AS Date), N'Scheduled', CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (8, 4, 8, CAST(N'2025-05-08' AS Date), N'Scheduled', CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (9, 5, 9, CAST(N'2025-05-09' AS Date), N'Scheduled', CAST(N'11:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (10, 5, 10, CAST(N'2025-05-10' AS Date), N'Scheduled', CAST(N'11:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (11, 6, 11, CAST(N'2025-05-11' AS Date), N'Scheduled', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Shifts_Assignment] ([ShiftID], [CaregiverID], [ClientID], [shift_date], [status], [start_time], [end_time], [clock_in], [clock_out], [total_minutes], [pay_amount]) VALUES (12, 6, 12, CAST(N'2025-05-12' AS Date), N'Scheduled', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Supervisors] ([SupervisorID], [name], [Phone], [email]) VALUES (1, N'Alexander Wright', N'555-748-5821', N'Alexander.Wright@gmail.com')
INSERT [dbo].[Supervisors] ([SupervisorID], [name], [Phone], [email]) VALUES (2, N'Lucinda Mack', N'456-753-1598', N'Lucina.Mack@outlook.com')
GO
SET IDENTITY_INSERT [dbo].[TaskAssignment] ON 

INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (1, 1, 1, 1, CAST(N'2025-05-01' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (2, 1, 1, 2, CAST(N'2025-05-01' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (3, 1, 1, 3, CAST(N'2025-05-01' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (4, 1, 1, 5, CAST(N'2025-05-01' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (5, 1, 2, 1, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (6, 1, 2, 2, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (7, 1, 2, 3, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (8, 1, 2, 4, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (9, 1, 2, 5, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (10, 1, 2, 6, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (11, 1, 2, 7, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (12, 1, 2, 8, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (13, 1, 2, 9, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (14, 1, 2, 10, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (15, 1, 2, 11, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (16, 1, 2, 12, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (17, 1, 2, 13, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (18, 1, 2, 14, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (19, 1, 2, 15, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (20, 1, 2, 16, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (21, 1, 2, 17, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (22, 1, 2, 18, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (23, 1, 2, 19, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (24, 1, 2, 20, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (25, 1, 2, 21, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (26, 1, 2, 22, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (27, 1, 2, 23, CAST(N'2025-05-02' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (28, 2, 3, 8, CAST(N'2025-05-03' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (29, 2, 3, 14, CAST(N'2025-05-03' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (30, 2, 4, 1, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (31, 2, 4, 2, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (32, 2, 4, 3, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (33, 2, 4, 4, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (34, 2, 4, 5, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (35, 2, 4, 6, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (36, 2, 4, 7, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (37, 2, 4, 10, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (38, 2, 4, 11, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (39, 2, 4, 12, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (40, 2, 4, 13, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (41, 2, 4, 14, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (42, 2, 4, 15, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (43, 2, 4, 16, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (44, 2, 4, 17, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (45, 2, 4, 18, CAST(N'2025-05-04' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (46, 3, 5, 19, CAST(N'2025-05-05' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (47, 3, 5, 20, CAST(N'2025-05-05' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (48, 3, 5, 21, CAST(N'2025-05-05' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (49, 3, 5, 22, CAST(N'2025-05-05' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (50, 3, 5, 23, CAST(N'2025-05-05' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (51, 3, 6, 4, CAST(N'2025-05-06' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (52, 3, 6, 5, CAST(N'2025-05-06' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (53, 3, 6, 7, CAST(N'2025-05-06' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (54, 3, 6, 9, CAST(N'2025-05-06' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (55, 4, 7, 1, CAST(N'2025-05-07' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (56, 4, 7, 2, CAST(N'2025-05-07' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (57, 4, 7, 3, CAST(N'2025-05-07' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (58, 4, 7, 4, CAST(N'2025-05-07' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (59, 4, 7, 5, CAST(N'2025-05-07' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (60, 4, 7, 6, CAST(N'2025-05-07' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (61, 4, 8, 1, CAST(N'2025-05-08' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (62, 4, 8, 3, CAST(N'2025-05-08' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (63, 4, 8, 4, CAST(N'2025-05-08' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (64, 4, 8, 5, CAST(N'2025-05-08' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (65, 4, 8, 8, CAST(N'2025-05-08' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (66, 4, 8, 14, CAST(N'2025-05-08' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (67, 5, 9, 12, CAST(N'2025-05-09' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (68, 5, 9, 13, CAST(N'2025-05-09' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (69, 5, 9, 15, CAST(N'2025-05-09' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (70, 5, 9, 16, CAST(N'2025-05-09' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (71, 5, 10, 1, CAST(N'2025-05-10' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (72, 5, 10, 2, CAST(N'2025-05-10' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (73, 5, 10, 3, CAST(N'2025-05-10' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (74, 5, 10, 4, CAST(N'2025-05-10' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (75, 5, 10, 5, CAST(N'2025-05-10' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (76, 5, 10, 6, CAST(N'2025-05-10' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (77, 5, 10, 9, CAST(N'2025-05-10' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (78, 6, 11, 1, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (79, 6, 11, 2, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (80, 6, 11, 3, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (81, 6, 11, 4, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (82, 6, 11, 5, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (83, 6, 11, 6, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (84, 6, 11, 7, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (85, 6, 11, 8, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (86, 6, 11, 10, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (87, 6, 11, 11, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (88, 6, 11, 12, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (89, 6, 11, 13, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (90, 6, 11, 14, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (91, 6, 11, 15, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (92, 6, 11, 16, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (93, 6, 11, 17, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (94, 6, 11, 18, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (95, 6, 11, 19, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (96, 6, 11, 20, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (97, 6, 11, 21, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (98, 6, 11, 22, CAST(N'2025-05-11' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (99, 6, 11, 23, CAST(N'2025-05-11' AS Date), N'Pending')
GO
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (100, 6, 12, 7, CAST(N'2025-05-12' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (101, 6, 12, 8, CAST(N'2025-05-12' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (102, 6, 12, 14, CAST(N'2025-05-12' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (103, 6, 12, 19, CAST(N'2025-05-12' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (104, 6, 12, 20, CAST(N'2025-05-12' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (105, 6, 12, 21, CAST(N'2025-05-12' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (106, 6, 12, 22, CAST(N'2025-05-12' AS Date), N'Pending')
INSERT [dbo].[TaskAssignment] ([TaskAssignment_ID], [CaregiverID], [ClientID], [TaskID], [scheduled_date], [completion_status]) VALUES (107, 6, 12, 23, CAST(N'2025-05-12' AS Date), N'Pending')
SET IDENTITY_INSERT [dbo].[TaskAssignment] OFF
GO
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (1, N'Bathing')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (2, N'Shaving')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (3, N'Hair Care')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (4, N'Skin Care')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (5, N'Mouth Care')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (6, N'Nail Maintenance')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (7, N'Dressing')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (8, N'Assistance with ambulation/transferring')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (9, N'Prepare Meals')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (10, N'Wash, dry, and put dishes away')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (11, N'Wipe the exterior of appliances')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (12, N'Take garbage out')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (13, N'Changing bed linen')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (14, N'Toileting/incontinence care')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (15, N'Assisting with housekeeping')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (16, N'Vaccuming clients bedroom and bathroom')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (17, N'Assistance with laundry')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (18, N'Wet and dry mop bedroom and bathroom')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (19, N'Medication reminder')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (20, N'Gathering medications')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (21, N'Read medication for instructions')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (22, N'Open medication bottles for clients')
INSERT [dbo].[Tasks] ([TaskID], [description]) VALUES (23, N'Reassure that medication has been taken')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [CaregiverID], [username], [password_hash], [RoleID], [isActive]) VALUES (1, 1, N'JSmith', N'123456789', 2, 1)
INSERT [dbo].[Users] ([UserID], [CaregiverID], [username], [password_hash], [RoleID], [isActive]) VALUES (2, 2, N'JRogers', N'123456789', 2, 1)
INSERT [dbo].[Users] ([UserID], [CaregiverID], [username], [password_hash], [RoleID], [isActive]) VALUES (3, 3, N'BHarrold', N'123456789', 2, 1)
INSERT [dbo].[Users] ([UserID], [CaregiverID], [username], [password_hash], [RoleID], [isActive]) VALUES (4, 4, N'DDuncan', N'123456789', 2, 1)
INSERT [dbo].[Users] ([UserID], [CaregiverID], [username], [password_hash], [RoleID], [isActive]) VALUES (5, 5, N'MBarry', N'123456789', 2, 1)
INSERT [dbo].[Users] ([UserID], [CaregiverID], [username], [password_hash], [RoleID], [isActive]) VALUES (6, 6, N'BJones', N'123456789', 2, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__783254B1711D1756]    Script Date: 3/25/2025 11:09:57 PM ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC572445D101C]    Script Date: 3/25/2025 11:09:57 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Users__F72B74D09B4475B9]    Script Date: 3/25/2025 11:09:57 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[CaregiverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Care_Plan_Tasks]  WITH CHECK ADD FOREIGN KEY([CareplanID])
REFERENCES [dbo].[CarePlans] ([PlanID])
GO
ALTER TABLE [dbo].[Care_Plan_Tasks]  WITH CHECK ADD FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
ALTER TABLE [dbo].[Caregiver]  WITH CHECK ADD FOREIGN KEY([SupervisorID])
REFERENCES [dbo].[Supervisors] ([SupervisorID])
GO
ALTER TABLE [dbo].[CarePlans]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([CaregiverID])
REFERENCES [dbo].[Caregiver] ([CaregiverID])
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD FOREIGN KEY([CaregiverID])
REFERENCES [dbo].[Caregiver] ([CaregiverID])
GO
ALTER TABLE [dbo].[Service_Logs]  WITH CHECK ADD FOREIGN KEY([CaregiverID])
REFERENCES [dbo].[Caregiver] ([CaregiverID])
GO
ALTER TABLE [dbo].[Service_Logs]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Shifts_Assignment]  WITH CHECK ADD FOREIGN KEY([CaregiverID])
REFERENCES [dbo].[Caregiver] ([CaregiverID])
GO
ALTER TABLE [dbo].[Shifts_Assignment]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[TaskAssignment]  WITH CHECK ADD FOREIGN KEY([CaregiverID])
REFERENCES [dbo].[Caregiver] ([CaregiverID])
GO
ALTER TABLE [dbo].[TaskAssignment]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[TaskAssignment]  WITH CHECK ADD FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([CaregiverID])
REFERENCES [dbo].[Caregiver] ([CaregiverID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD CHECK  (([status]='Overdue' OR [status]='Paid' OR [status]='Unpaid'))
GO
ALTER TABLE [dbo].[Caregiver]  WITH CHECK ADD CHECK  (([status]='Inactive' OR [status]='Active'))
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD CHECK  (([status]='Inactive' OR [status]='Active'))
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD CHECK  (([status]='Failed' OR [status]='Paid' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[Shifts_Assignment]  WITH CHECK ADD CHECK  (([status]='Missed' OR [status]='Completed' OR [status]='Scheduled'))
GO
ALTER TABLE [dbo].[TaskAssignment]  WITH CHECK ADD CHECK  (([completion_status]='Completed' OR [completion_status]='Pending'))
GO
USE [master]
GO
ALTER DATABASE [CareTrack Database] SET  READ_WRITE 
GO
