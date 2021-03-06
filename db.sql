USE [master]
GO
/****** Object:  Database [UniversityManagementSystem]    Script Date: 9/12/2018 5:41:05 PM ******/
CREATE DATABASE [UniversityManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityManagementSystem.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityManagementSystem_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagementSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagementSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityManagementSystem]
GO
/****** Object:  Table [dbo].[Assign]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assign](
	[AssignId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[DeptId] [int] NOT NULL,
 CONSTRAINT [PK_Assign] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassAllocation]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassAllocation](
	[AllocationId] [int] IDENTITY(1,1) NOT NULL,
	[DeptId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[ToTime] [time](7) NOT NULL,
 CONSTRAINT [PK_ClassAllocation] PRIMARY KEY CLUSTERED 
(
	[AllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Classroom]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classroom](
	[ClassroomId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[From] [time](7) NULL,
	[To] [time](7) NULL,
 CONSTRAINT [PK_Classroom] PRIMARY KEY CLUSTERED 
(
	[ClassroomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [int] NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
	[Credit] [decimal](6, 0) NOT NULL,
	[Description] [varchar](100) NULL,
	[DeptId] [int] NOT NULL,
	[SemisterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseEnrollment]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseEnrollment](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourseEnrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 9/12/2018 5:41:05 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DeptId] [int] IDENTITY(1,1) NOT NULL,
	[DeptCode] [int] NOT NULL,
	[DeptName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 9/12/2018 5:41:05 PM ******/
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
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[EnrollId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[EnrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetter] [char](10) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semister]    Script Date: 9/12/2018 5:41:05 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[StudentEmail] [varchar](50) NULL,
	[RegNo] [int] NOT NULL,
	[StudentContactNo] [int] NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[StudentAddress] [varchar](150) NULL,
	[DeptId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [varchar](50) NOT NULL,
	[TeacherAddress] [varchar](150) NULL,
	[TeacherEmail] [varchar](50) NOT NULL,
	[TeacherContact] [int] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DeptId] [int] NOT NULL,
	[TakenCredit] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_Assign]    Script Date: 9/12/2018 5:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Assign]
AS
SELECT        dbo.Course.CourseCode AS Code, dbo.Course.CourseName AS Name, dbo.Course.SemisterId AS Semister, dbo.Assign.TeacherId AS Assign
FROM            dbo.Course INNER JOIN
                         dbo.Assign ON dbo.Course.CourseId = dbo.Assign.CourseId


GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DeptId], [DeptCode], [DeptName]) VALUES (1, 101, N'CSE')
INSERT [dbo].[Department] ([DeptId], [DeptCode], [DeptName]) VALUES (2, 202, N'BIT')
INSERT [dbo].[Department] ([DeptId], [DeptCode], [DeptName]) VALUES (3, 301, N'IT')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (1, N'Senior')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (2, N'Janior')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContact], [DesignationId], [DeptId], [TakenCredit]) VALUES (1, N'Metu', N'West Rajabazar', N'a@g.com', 78655, 1, 3, CAST(24.00 AS Decimal(6, 2)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Grade]    Script Date: 9/12/2018 5:41:06 PM ******/
ALTER TABLE [dbo].[Grade] ADD  CONSTRAINT [IX_Grade] UNIQUE NONCLUSTERED 
(
	[GradeLetter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student]    Script Date: 9/12/2018 5:41:06 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [IX_Student] UNIQUE NONCLUSTERED 
(
	[RegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Course]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([DeptId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Department]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Teacher]
GO
ALTER TABLE [dbo].[ClassAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassAllocation_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[ClassAllocation] CHECK CONSTRAINT [FK_ClassAllocation_Course]
GO
ALTER TABLE [dbo].[ClassAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassAllocation_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([DayId])
GO
ALTER TABLE [dbo].[ClassAllocation] CHECK CONSTRAINT [FK_ClassAllocation_Day]
GO
ALTER TABLE [dbo].[ClassAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassAllocation_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([DeptId])
GO
ALTER TABLE [dbo].[ClassAllocation] CHECK CONSTRAINT [FK_ClassAllocation_Department]
GO
ALTER TABLE [dbo].[ClassAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassAllocation_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[ClassAllocation] CHECK CONSTRAINT [FK_ClassAllocation_Room]
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD  CONSTRAINT [FK_Classroom_Course] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Classroom] CHECK CONSTRAINT [FK_Classroom_Course]
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD  CONSTRAINT [FK_Classroom_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([DayId])
GO
ALTER TABLE [dbo].[Classroom] CHECK CONSTRAINT [FK_Classroom_Day]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course] FOREIGN KEY([SemisterId])
REFERENCES [dbo].[Semister] ([SemisterId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([DeptId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Semister] FOREIGN KEY([SemisterId])
REFERENCES [dbo].[Semister] ([SemisterId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Semister]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnrollment_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_CourseEnrollment_Course]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnrollment_Student] FOREIGN KEY([RegNo])
REFERENCES [dbo].[Student] ([RegNo])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_CourseEnrollment_Student]
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
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Grade]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Student] FOREIGN KEY([RegNo])
REFERENCES [dbo].[Student] ([RegNo])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([DeptId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([DeptId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Assign"
            Begin Extent = 
               Top = 10
               Left = 322
               Bottom = 140
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Assign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Assign'
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementSystem] SET  READ_WRITE 
GO
