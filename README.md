# Weiz.TaskManager
任务管理平台
1.	系统简介
你曾经需要应用执行一个任务吗？这个任务每天或每周星期二晚上11：30，或许仅仅每个月的最后一天执行。一个自动执行而无须干预的任务在执行过程中如果发生一个严重错误，应用能够知到其执行失败并尝试重新执行吗？你和你的团队是用.NET编程吗？如果这些问题中任何一个你回答是，那么你可以使用Quartz.NET调度器。 Quartz.NET允许开发人员根据时间间隔（或天）来调度作业。它实现了作业和触发器的多对多关系，还能把多个作业与不同的触发器关联。

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


3.	开发过程
添加一个新任务步骤如下
	在Mysoft.Task项目TaskSet文件夹下添加继承IJob接口的任务类,可以参照现有的IpProxyJob
 


最重要的部分运行频率需要怎么写？这里也替大家考虑到了，可以使用在线Cron生成器来生成，
 
	完成以上两步,即完成了一个新任务的添加，是不是很简单呢。
4.	安装部署
由于项目使用的是Window服务来搭载Quartz.net,那么项目的安装即安装Window服务。
本来可以通过批处理来完成服务安装卸载的，本人嫌这个太麻烦，于是写了Windows服务安装卸载小工具,源码在WSWinForm项目里面。

生成整个解决方案以后,右键以管理员方式打开WSWinForm.exe文件，选择TaskManager服务进行安装运行
 
运行成功后会生成Logs文件夹，记录执行日志的
 
5.	其它说明
目前系统内置了三个定时任务
1.	代理ip爬虫
每隔一小时从网站上爬取最新的代理IP信息,爬下来的数据存在p_IPProxy表


4.	系统配置
当然系统要正常运行还需要进行相关配置，配置文件在Config\ Config.xml里面，目前只有两条相关配置
 
数据库连接信息
使用者可以拿从SVN下载代码MyDocument项目下的任务系统”SQL合并脚本_20150911.sql”执行创建相关表和初始数据


