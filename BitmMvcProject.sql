USE [master]
GO
/****** Object:  Database [BitmMvcProject]    Script Date: 9/22/2018 6:40:14 AM ******/
CREATE DATABASE [BitmMvcProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BitmMvcProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BitmMvcProject.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BitmMvcProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BitmMvcProject_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BitmMvcProject] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BitmMvcProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BitmMvcProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BitmMvcProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BitmMvcProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BitmMvcProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BitmMvcProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [BitmMvcProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BitmMvcProject] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BitmMvcProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BitmMvcProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BitmMvcProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BitmMvcProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BitmMvcProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BitmMvcProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BitmMvcProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BitmMvcProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BitmMvcProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BitmMvcProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BitmMvcProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BitmMvcProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BitmMvcProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BitmMvcProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BitmMvcProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BitmMvcProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BitmMvcProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BitmMvcProject] SET  MULTI_USER 
GO
ALTER DATABASE [BitmMvcProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BitmMvcProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BitmMvcProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BitmMvcProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BitmMvcProject]
GO
/****** Object:  Table [dbo].[Assign]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assign](
	[AssignId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Assign] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Classroom]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Classroom](
	[ClassroomId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[StartTime] [varchar](50) NULL,
	[EndTime] [varchar](50) NULL,
	[AllocationStatus] [bit] NULL,
 CONSTRAINT [PK_Classroom] PRIMARY KEY CLUSTERED 
(
	[ClassroomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
	[CourseCredit] [decimal](5, 2) NOT NULL,
	[Description] [varchar](500) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemisterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[DayId] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](40) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[EnrollId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrollDate] [datetime] NULL,
	[IsStudentActive] [bit] NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[EnrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grade]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetter] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Result](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [varchar](50) NOT NULL,
	[IsStudentActive] [bit] NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semister]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semister](
	[SemisterId] [int] IDENTITY(1,1) NOT NULL,
	[SemisterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Semister] PRIMARY KEY CLUSTERED 
(
	[SemisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [varchar](50) NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](20) NULL,
	[Date] [datetime] NULL,
	[Address] [varchar](50) NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 9/22/2018 6:40:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [varchar](50) NOT NULL,
	[Address] [varchar](200) NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditTaken] [decimal](6, 2) NULL,
	[RemainingCredit] [float] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Assign] ON 

INSERT [dbo].[Assign] ([AssignId], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (13, 1, 23, 23, 0)
INSERT [dbo].[Assign] ([AssignId], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (14, 1, 23, 23, 1)
INSERT [dbo].[Assign] ([AssignId], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (15, 2, 24, 24, 1)
SET IDENTITY_INSERT [dbo].[Assign] OFF
SET IDENTITY_INSERT [dbo].[Classroom] ON 

INSERT [dbo].[Classroom] ([ClassroomId], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (5, 1, 23, 1, 1, N'12:06 AM', N'1:09 AM', 0)
INSERT [dbo].[Classroom] ([ClassroomId], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (6, 1, 23, 2, 3, N'7:34 AM', N'7:34 AM', 0)
INSERT [dbo].[Classroom] ([ClassroomId], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (7, 5, 25, 3, 3, N'8:33 PM', N'9:33 PM', 0)
INSERT [dbo].[Classroom] ([ClassroomId], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (8, 1, 23, 1, 1, N'10:29 PM', N'10:29 PM', 1)
INSERT [dbo].[Classroom] ([ClassroomId], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (9, 2, 24, 6, 5, N'10:08 AM', N'10:08 AM', 1)
SET IDENTITY_INSERT [dbo].[Classroom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [Description], [DepartmentId], [SemisterId]) VALUES (23, N'EEE01', N'EEE', CAST(4.00 AS Decimal(5, 2)), N'eeee', 1, 1)
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [Description], [DepartmentId], [SemisterId]) VALUES (24, N'CIT201', N'IT', CAST(5.00 AS Decimal(5, 2)), N'wwww', 2, 4)
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [Description], [DepartmentId], [SemisterId]) VALUES (25, N'NewIT', N'newIt', CAST(2.50 AS Decimal(5, 2)), N'sgfsg', 5, 4)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (1, N'Saturday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (3, N'Monday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (5, N'Wednesday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (6, N'Thursday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (1, N'CSE01', N'CSE')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (2, N'BIT01', N'BIT')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (5, N'IT301', N'IT')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (1, N'Senior Lecturer')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (2, N'Janior Lecturer')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (3, N'Professor')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (4, N'Lecturer')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([EnrollId], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (1, 2, 23, CAST(0x0000A95E00000000 AS DateTime), 1)
INSERT [dbo].[EnrollCourse] ([EnrollId], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (2, 5, 25, CAST(0x0000A95F00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (1, N'A+')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (2, N'A')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (3, N'A-')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (4, N'B+')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (5, N'B')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (6, N'B-')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (7, N'C+')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (8, N'C')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (9, N'C-')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (10, N'D+')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (11, N'D')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (14, N'D-')
INSERT [dbo].[Grade] ([GradeId], [GradeLetter]) VALUES (15, N'F')
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([ResultId], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (3, 3, 24, N'A+', 1)
INSERT [dbo].[Result] ([ResultId], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (4, 5, 25, N'D', 1)
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [RoomNo]) VALUES (1, N'Room No:101')
INSERT [dbo].[Room] ([RoomId], [RoomNo]) VALUES (2, N'Room No:102')
INSERT [dbo].[Room] ([RoomId], [RoomNo]) VALUES (3, N'Room No:203')
INSERT [dbo].[Room] ([RoomId], [RoomNo]) VALUES (4, N'Room No:202')
INSERT [dbo].[Room] ([RoomId], [RoomNo]) VALUES (5, N'Room No:301')
INSERT [dbo].[Room] ([RoomId], [RoomNo]) VALUES (6, N'Room No:302')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semister] ON 

INSERT [dbo].[Semister] ([SemisterId], [SemisterName]) VALUES (1, N'First Semister')
INSERT [dbo].[Semister] ([SemisterId], [SemisterName]) VALUES (2, N'Second Semister')
INSERT [dbo].[Semister] ([SemisterId], [SemisterName]) VALUES (3, N'Third Semister')
INSERT [dbo].[Semister] ([SemisterId], [SemisterName]) VALUES (4, N'Four Semister')
INSERT [dbo].[Semister] ([SemisterId], [SemisterName]) VALUES (5, N'Five Semister')
INSERT [dbo].[Semister] ([SemisterId], [SemisterName]) VALUES (6, N'Six Semister')
INSERT [dbo].[Semister] ([SemisterId], [SemisterName]) VALUES (7, N'Seven Semister')
INSERT [dbo].[Semister] ([SemisterId], [SemisterName]) VALUES (8, N'Eight Semister')
SET IDENTITY_INSERT [dbo].[Semister] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (2, N'CSE01-2018-001', N'anis ahammed', N'anisahammed72@gmail.com', N'0253654765', CAST(0x0000A95E00000000 AS DateTime), N'West Rajabazar', 1)
INSERT [dbo].[Student] ([StudentId], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (3, N'BIT01-2018-001', N'Fariha', N'bandarimran@gmail.com', N'0253654765', CAST(0x0000A95800000000 AS DateTime), N'West Rajabazar', 2)
INSERT [dbo].[Student] ([StudentId], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (4, N'BIT01-2018-002', N'Sonia', N'anisahammed6735@gmail.com', N'0253654765', CAST(0x0000A95000000000 AS DateTime), N'West Rajabazar', 2)
INSERT [dbo].[Student] ([StudentId], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (5, N'IT301-2018-001', N'tumi', N'tumi@gmail.com', N'675878967', CAST(0x0000A95F00000000 AS DateTime), N'fhada', 5)
INSERT [dbo].[Student] ([StudentId], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (6, N'BIT01-2018-003', N'Liza', N'liza@gmail.com', N'046789256', CAST(0x0000A95F00000000 AS DateTime), N'jasuoe', 2)
INSERT [dbo].[Student] ([StudentId], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (7, N'IT301-2018-002', N'sumi', N'sumi@gmail.com', N'019876784', CAST(0x0000A95F00000000 AS DateTime), N'West Rajabazar', 5)
INSERT [dbo].[Student] ([StudentId], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (8, N'BIT01-2018-004', N'masuma', N'masuma@gmail.com', N'0296857943', CAST(0x0000A95F00000000 AS DateTime), N'West Rajabazar', 2)
INSERT [dbo].[Student] ([StudentId], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (9, N'IT301-2018-003', N'sama', N'sama@gmail.com', N'0253654765', CAST(0x0000A95F00000000 AS DateTime), N'dha', 5)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (23, N'Metu', N'West Rajabazar', N'anisahammed72@gmail.com', N'01675678678', 1, 1, CAST(50.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (24, N'farha', N'dha', N'f@g.com', N'9857956', 2, 2, CAST(20.00 AS Decimal(6, 2)), 5)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (25, N'Bethi', N'West Rajabazar', N'anisahammed72@mail.com', N'01675678678', 1, 1, CAST(10.00 AS Decimal(6, 2)), 0)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Course]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Department]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Teacher]
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD  CONSTRAINT [FK_Classroom_Course] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Classroom] CHECK CONSTRAINT [FK_Classroom_Course]
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD  CONSTRAINT [FK_Classroom_Course1] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Classroom] CHECK CONSTRAINT [FK_Classroom_Course1]
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD  CONSTRAINT [FK_Classroom_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([DayId])
GO
ALTER TABLE [dbo].[Classroom] CHECK CONSTRAINT [FK_Classroom_Day]
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD  CONSTRAINT [FK_Classroom_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Classroom] CHECK CONSTRAINT [FK_Classroom_Department]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course] FOREIGN KEY([SemisterId])
REFERENCES [dbo].[Semister] ([SemisterId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Course]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Student]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Course]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
USE [master]
GO
ALTER DATABASE [BitmMvcProject] SET  READ_WRITE 
GO
