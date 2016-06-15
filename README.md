# Weiz.TaskManager
任务管理平台
1.	系统简介
Quartz.NET允许开发人员根据时间间隔（或天）来调度作业。它实现了作业和触发器的多对多关系，还能把多个作业与不同的触发器关联。

本系统通过window服务来集成Quartz.net,通过修改配置文件和添加相应Job即可完成作业添加，使用简单方便。

2.	项目结构
系统目前包含八个项目组成：

Weiz.TaskManager.HouTai_New					1. 任务后台管理系统，任务，。
Weiz.TaskManager.Tasks						2. 所有任务的集合，目前只有一个TestJob。
Weiz.TaskManager.ServiceBus					3. 集成Quartz.netwindow服务，通过window服务来承载调度Weiz.TaskManager.Tasks 的各个任务Job。
Weiz.TaskManager.TaskUtility				4. 操作任务的公共类库。
Weiz.TaskManager.Utility					5. 整个平台的公共类库
Weiz.TaskManager.Models
Weiz.TaskManager.BLL
Weiz.TaskManager.DAL

 
3.	其它说明
目前系统内置了一个用于测试的定时任务。


4.	系统配置
当然系统要正常运行还需要进行相关配置，配置文件在Config\ Config.xml里面，目前只有两条相关配置
 
数据库连接信息
使用者可以拿从SVN下载代码MyDocument项目下的任务系统”SQL合并脚本_20150911.sql”执行创建相关表和初始数据


