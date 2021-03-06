USE [master]
GO
/****** Object:  Database [TaskManager]    Script Date: 06/06/2016 15:09:25 ******/
CREATE DATABASE [TaskManager] ON  PRIMARY 
( NAME = N'TaskManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TaskManager.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TaskManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TaskManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TaskManager] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskManager] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TaskManager] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TaskManager] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TaskManager] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TaskManager] SET ARITHABORT OFF
GO
ALTER DATABASE [TaskManager] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TaskManager] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TaskManager] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TaskManager] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TaskManager] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TaskManager] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TaskManager] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TaskManager] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TaskManager] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TaskManager] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TaskManager] SET  DISABLE_BROKER
GO
ALTER DATABASE [TaskManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TaskManager] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TaskManager] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TaskManager] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TaskManager] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TaskManager] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TaskManager] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TaskManager] SET  READ_WRITE
GO
ALTER DATABASE [TaskManager] SET RECOVERY FULL
GO
ALTER DATABASE [TaskManager] SET  MULTI_USER
GO
ALTER DATABASE [TaskManager] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TaskManager] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TaskManager', N'ON'
GO

USE [TaskManager]
GO
/****** Object:  Table [dbo].[p_User]    Script Date: 06/06/2016 15:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[p_User](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[PassWord] [varchar](50) NULL,
	[TrueName] [varchar](50) NULL,
	[UserEmail] [varchar](50) NULL,
	[PhoneNum] [varchar](30) NULL,
	[IsAdmin] [int] NULL,
	[Status] [int] NULL,
	[CreateTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
 CONSTRAINT [PK_p_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[p_User] ([UserId], [UserName], [PassWord], [TrueName], [UserEmail], [PhoneNum], [IsAdmin], [Status], [CreateTime], [LastLoginTime]) VALUES (1, N'admin', NULL, N'admin', N'417114764@qq.com', N'18618243664', 1, 1, CAST(0x0000A5E900000000 AS DateTime), CAST(0x0000A5E900000000 AS DateTime))
/****** Object:  Table [dbo].[p_Task]    Script Date: 06/06/2016 15:09:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[p_Task](
	[TaskID] [uniqueidentifier] NOT NULL,
	[TaskName] [nvarchar](300) NULL,
	[TaskParam] [nvarchar](max) NULL,
	[CronExpressionString] [nvarchar](200) NULL,
	[AssemblyName] [nvarchar](150) NULL,
	[ClassName] [nvarchar](150) NULL,
	[Status] [int] NULL,
	[IsDelete] [bit] NULL,
	[CreatedTime] [datetime] NULL,
	[ModifyTime] [datetime] NULL,
	[RecentRunTime] [datetime] NULL,
	[NextFireTime] [datetime] NULL,
	[CronRemark] [nvarchar](300) NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK__p_Task__7C6949D12F10007B] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'TaskID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'TaskName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'TaskParam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务运行Cron表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'CronExpressionString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'程序集名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'AssemblyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务所在类包含命名空间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务运行状态    1:运行 0:停止 -1 删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近运行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'RecentRunTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下次运行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'NextFireTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表达式中文说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'CronRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task'
GO
INSERT [dbo].[p_Task] ([TaskID], [TaskName], [TaskParam], [CronExpressionString], [AssemblyName], [ClassName], [Status], [IsDelete], [CreatedTime], [ModifyTime], [RecentRunTime], [NextFireTime], [CronRemark], [Remark]) VALUES (N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间', N'', N'0/10 * * * * ?', N'Weiz.TaskManager.TaskSet', N'Weiz.TaskManager.TaskSet.TestJob', 0, 0, CAST(0x0000A5F300F9CD76 AS DateTime), CAST(0x0000A616014418C8 AS DateTime), CAST(0x0000A616014418C0 AS DateTime), CAST(0x0000A61601442478 AS DateTime), N'每10秒运行一次', NULL)
/****** Object:  Table [dbo].[p_RunningLog]    Script Date: 06/06/2016 15:09:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[p_RunningLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskID] [uniqueidentifier] NULL,
	[Remark] [varchar](500) NULL,
	[Description] [varchar](1000) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_p_TaskRunLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[p_RunningLog] ON
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (1, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6110140AC6C AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (2, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6110140B782 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (3, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6110140BCEA AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (4, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6110140BDCD AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (5, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6110140C336 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (6, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6110140CA4C AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (7, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6110140D5C4 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (8, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6110140D5C5 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (9, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6110140D8B9 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (10, N'd4d6abe2-edaf-4f4e-a7de-445d0bace372', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6110140D8BA AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (11, N'26c8e067-bcd8-4ab7-b602-db077e7e837a', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6110143EA3A AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (12, N'26c8e067-bcd8-4ab7-b602-db077e7e837a', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6110143EA3A AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (13, N'26c8e067-bcd8-4ab7-b602-db077e7e837a', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6110143F599 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (14, N'26c8e067-bcd8-4ab7-b602-db077e7e837a', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6110143F59B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (15, N'26c8e067-bcd8-4ab7-b602-db077e7e837a', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61101440150 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (16, N'26c8e067-bcd8-4ab7-b602-db077e7e837a', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61101440152 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (17, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200E09703 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (18, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200E0970B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (19, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200E09FE8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (20, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200E09FEA AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (21, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200E0ABA1 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (22, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200E0ABA2 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (23, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200E0B75A AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (24, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200E0B75B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (25, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200E0C311 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (26, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200E0C318 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (27, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200EFF979 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (28, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200EFF979 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (29, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200F00169 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (30, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200F0016A AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (31, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200F00D21 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (32, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200F00D22 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (33, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200F018D9 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (34, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200F018DA AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (35, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200F02491 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (36, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200F02492 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (37, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200F03049 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (38, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200F0304A AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (39, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FA1F50 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (40, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FA1F52 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (41, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FA3318 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (42, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FA33F7 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (43, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FA41F7 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (44, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FA41FB AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (45, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FA426B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (46, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FA426C AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (47, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC1737 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (48, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC1737 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (49, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC2BF2 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (50, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC2D60 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (51, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC3172 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (52, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC3172 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (53, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC3A53 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (54, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC3A55 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (55, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC460B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (56, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC460D AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (57, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC51C3 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (58, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC51C4 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (59, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC7599 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (60, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC759B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (61, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC80A2 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (62, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC80A5 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (63, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC8C5B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (64, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC8C5C AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (65, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FC981B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (66, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FC981E AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (67, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61200FCA3CB AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (68, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61200FCA3CE AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (69, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120100FE1C AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (70, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120100FE1D AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (71, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A612010108CF AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (72, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A612010108D2 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (73, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61201011483 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (74, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61201011486 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (75, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101203B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (76, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101203C AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (77, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61201012BF5 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (78, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61201012BF5 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (79, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A612010137BB AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (80, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A612010137BC AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (81, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61201014364 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (82, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61201014366 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (83, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61201014F1B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (84, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61201014F1C AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (85, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61201015AD2 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (86, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61201015AD4 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (87, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101668C AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (88, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61201017AAB AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (89, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101AE76 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (90, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101AE78 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (91, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101AE79 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (92, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101B0D8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (93, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101B0E1 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (94, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101B0E2 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (95, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101B0E7 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (96, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101B0E8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (97, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101B122 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (98, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101B125 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (99, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101B14A AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (100, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101B14C AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (101, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101B893 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (102, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101B896 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (103, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101C44B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (104, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101C44D AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (105, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101D001 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (106, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101D002 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (107, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101DBBB AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (108, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101DBBC AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (109, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6120101E772 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (110, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6120101E774 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (111, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013BF2E6 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (112, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013BF2E7 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (113, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C0A4A AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (114, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C0A4A AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (115, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C15F8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (116, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C15F8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (117, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C21BC AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (118, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C21BC AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (119, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C2D68 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (120, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C2D68 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (121, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C3920 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (122, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C3920 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (123, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C44D8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (124, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C44D8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (125, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C5090 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (126, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C5090 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (127, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C5C48 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (128, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C5C48 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (129, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C6807 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (130, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C6807 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (131, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C73B8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (132, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C73B8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (133, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C7F70 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (134, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C7F70 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (135, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C8B28 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (136, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C8B28 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (137, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013C96E0 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (138, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013C96E0 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (139, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013CA298 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (140, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013CA298 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (141, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013CAE50 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (142, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013CAE50 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (143, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013CBA08 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (144, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013CBA08 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (145, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013CC5C9 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (146, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013CC5C9 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (147, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013CD178 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (148, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013CD178 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (149, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013CDD3B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (150, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013CDD3B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (151, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013CE8E8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (152, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013CE8E8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (153, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013CF4B3 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (154, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013CF4B3 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (155, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013D0058 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (156, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013D0058 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (157, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013D0C19 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (158, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013D0C19 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (159, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013D17C8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (160, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013D17C8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (161, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013D2380 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (162, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013D2380 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (163, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013D2F38 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (164, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013D2F38 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (165, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013D3AF0 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (166, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013D3AF0 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (167, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013D46A8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (168, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013D46A8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (169, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A613013D5260 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (170, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A613013D5260 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (171, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61601406F8D AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (172, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61601406F8D AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (173, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6160142AD8D AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (174, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6160142AD8E AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (175, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6160142B930 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (176, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6160142B930 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (177, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6160142C4EB AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (178, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6160142C4EB AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (179, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6160142D0A2 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (180, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6160142D0A2 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (181, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6160142DC7B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (182, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6160142DC7B AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (183, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6160142E812 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (184, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6160142E812 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (185, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6160142F3CA AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (186, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6160142F3CA AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (187, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A6160143F5A4 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (188, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A6160143F5A4 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (189, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61601440151 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (190, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61601440151 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (191, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A61601440D09 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (192, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A61601440D09 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (193, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 开始', N'', CAST(0x0000A616014418C8 AS DateTime))
INSERT [dbo].[p_RunningLog] ([Id], [TaskID], [Remark], [Description], [CreateTime]) VALUES (194, N'5fbaa648-d1e8-e511-b79d-54ee75868db8', N'测试任务,输出当前时间 结束', N'成功执行', CAST(0x0000A616014418C8 AS DateTime))
SET IDENTITY_INSERT [dbo].[p_RunningLog] OFF
/****** Object:  Table [dbo].[p_ErrorLog]    Script Date: 06/06/2016 15:09:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[p_ErrorLog](
	[nId] [bigint] IDENTITY(1,1) NOT NULL,
	[dtDate] [datetime] NULL,
	[sThread] [varchar](100) NULL,
	[sLevel] [varchar](100) NULL,
	[sLogger] [varchar](3000) NULL,
	[sMessage] [varchar](8000) NULL,
	[sException] [varchar](8000) NULL,
	[sName] [varchar](200) NULL,
 CONSTRAINT [PK_p_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[nId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[p_ErrorLog] ON
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (1, CAST(0x0000A61101420EC6 AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (2, CAST(0x0000A611014356CA AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (3, CAST(0x0000A61101435D44 AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (4, CAST(0x0000A611014368FD AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (5, CAST(0x0000A611014374B4 AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (6, CAST(0x0000A6110143806D AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (7, CAST(0x0000A61101438C25 AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (8, CAST(0x0000A611014397DC AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (9, CAST(0x0000A6110143BEC2 AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (10, CAST(0x0000A6110143C21A AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
INSERT [dbo].[p_ErrorLog] ([nId], [dtDate], [sThread], [sLevel], [sLogger], [sMessage], [sException], [sName]) VALUES (11, CAST(0x0000A6110143C550 AS DateTime), NULL, N'ERROR', N'system', N'未将对象引用设置到对象的实例。', N'   在 Weiz.TaskManager.Tasks.Utils.TaskHelper.GetTask(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\Utils\TaskHelper.cs:行号 24
   在 Weiz.TaskManager.Tasks.TaskSet.TestJob.Execute(IJobExecutionContext context) 位置 e:\vs2012\TaskManager-master\Weiz.TaskManager.Tasks\TaskSet\TestJob.cs:行号 25', N'Weiz.TaskManager.Tasks')
SET IDENTITY_INSERT [dbo].[p_ErrorLog] OFF
/****** Object:  Default [DF__p_Task__TaskID__30F848ED]    Script Date: 06/06/2016 15:09:27 ******/
ALTER TABLE [dbo].[p_Task] ADD  CONSTRAINT [DF__p_Task__TaskID__30F848ED]  DEFAULT (newsequentialid()) FOR [TaskID]
GO
/****** Object:  Default [DF__p_Task__Status__31EC6D26]    Script Date: 06/06/2016 15:09:27 ******/
ALTER TABLE [dbo].[p_Task] ADD  CONSTRAINT [DF__p_Task__Status__31EC6D26]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__p_Task__CreatedO__32E0915F]    Script Date: 06/06/2016 15:09:27 ******/
ALTER TABLE [dbo].[p_Task] ADD  CONSTRAINT [DF__p_Task__CreatedO__32E0915F]  DEFAULT (getdate()) FOR [CreatedTime]
GO
