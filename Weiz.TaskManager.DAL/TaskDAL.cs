﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using Weiz.TaskManager.Models;
using Weiz.TaskManager.Utility;

namespace Weiz.TaskManager.DAL
{
    public class TaskDAL
    {
        public PageOf<TaskModel> GetTaskList(int pageIndex, int pageSize)
        {
            var QUERY_SQL = @"( SELECT TaskID,TaskName,TaskParam,CronExpressionString,AssemblyName,ClassName,Status,IsDelete,CreatedTime,ModifyTime,RecentRunTime,NextFireTime,CronRemark,Remark
	                            FROM p_Task(nolock)
                                WHERE IsDelete=0 ";

            QUERY_SQL += ") pp ";
            string SQL = string.Format(@" select * from (select ROW_NUMBER() OVER(order by pp.ModifyTime desc) AS RowNum,* from {0}
										) as A where A.RowNum BETWEEN (@PageIndex-1)* @PageSize+1 AND @PageIndex*@PageSize ORDER BY RowNum;",
                                  QUERY_SQL);

            SQL += string.Format(@" SELECT COUNT(1) FROM {0};", QUERY_SQL);

            object param = new { pageIndex = pageIndex, pageSize = pageSize };

            DataSet ds = SQLHelper.FillDataSet(SQL, param);
            return new PageOf<TaskModel>()
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                Total = Convert.ToInt32(ds.Tables[1].Rows[0][0]),
                Items = DataMapHelper.DataSetToList<TaskModel>(ds)
            };
        }

        public List<TaskModel> GetAllTaskList()
        {
            var sql = @"SELECT TaskID,TaskName,TaskParam,CronExpressionString,AssemblyName,ClassName,Status,IsDelete,CreatedTime,ModifyTime,RecentRunTime,NextFireTime,CronRemark,Remark
	                    FROM p_Task(nolock)
                        WHERE IsDelete=0 and Status =1";

            var result = SQLHelper.ToList<TaskModel>(sql);

            return result;

        }

        public bool UpdateTaskStatus(string taskId, int status)
        {
            var sql = @" UPDATE p_Task
                           SET Status = @Status 
                         WHERE TaskID=@TaskID
                        ";
            object param = new { TaskID = taskId, Status = status };

            return SQLHelper.ExecuteNonQuery(sql, param) > 0;
        }

        public bool UpdateNextFireTime(string taskId, DateTime nextFireTime)
        {
            var sql = @" UPDATE p_Task
                           SET NextFireTime = @NextFireTime 
                               ,ModifyTime = GETDATE()
                         WHERE TaskID=@TaskID
                        ";
            object param = new { TaskID = taskId, NextFireTime = nextFireTime };

            return SQLHelper.ExecuteNonQuery(sql, param) > 0;
        }

        public bool UpdateRecentRunTime(string taskId, DateTime recentRunTime)
        {
            var sql = @" UPDATE p_Task
                           SET RecentRunTime = @RecentRunTime 
                               ,ModifyTime = GETDATE()
                         WHERE TaskID=@TaskID
                        ";
            object param = new { TaskID = taskId, RecentRunTime = recentRunTime };

            return SQLHelper.ExecuteNonQuery(sql, param) > 0;
        }

        public TaskModel GetTaskById(string taskId)
        {
            var sql = @"SELECT TaskID,TaskName,TaskParam,CronExpressionString,AssemblyName,ClassName,Status,IsDelete,CreatedTime,ModifyTime,RecentRunTime,NextFireTime,CronRemark,Remark
	                    FROM p_Task(nolock)
                        WHERE TaskID=@TaskID";

            object param = new { TaskID = taskId };
            var result = SQLHelper.Single<TaskModel>(sql, param);

            return result;
        }

        public bool Add(TaskModel task)
        {
            var sql = @" INSERT INTO p_Task
                               (TaskID,TaskName,TaskParam,CronExpressionString,AssemblyName,ClassName,Status,IsDelete,CreatedTime,ModifyTime,CronRemark,Remark)
                         VALUES
                               (@TaskID ,@TaskName,@TaskParam,@CronExpressionString,@AssemblyName,@ClassName,@Status,0,getdate(),getdate(),@CronRemark,@Remark)";

            object param = new
            {
                TaskID = task.TaskID,
                TaskName = task.TaskName,
                TaskParam = task.TaskParam,
                CronExpressionString = task.CronExpressionString,
                AssemblyName = task.AssemblyName,
                ClassName = task.ClassName,
                Status = task.Status,
                CronRemark = task.CronRemark,
                Remark = task.Remark
            };

            return SQLHelper.ExecuteNonQuery(sql, param) > 0;
        }

        public bool Edit(TaskModel task)
        {

            var sql = @" UPDATE p_Task
                           SET TaskName = @TaskName,TaskParam = @TaskParam,CronExpressionString = @CronExpressionString,AssemblyName = @AssemblyName,ClassName = @ClassName,
                               Status = @Status,IsDelete = 0,ModifyTime =getdate() ,CronRemark = @CronRemark,Remark = @Remark
                         WHERE TaskID = @TaskID";

            object param = new
            {
                TaskID = task.TaskID,
                TaskName = task.TaskName,
                TaskParam = task.TaskParam,
                CronExpressionString = task.CronExpressionString,
                AssemblyName = task.AssemblyName,
                ClassName = task.ClassName,
                Status = task.Status,
                CronRemark = task.CronRemark,
                Remark = task.Remark
            };

            return SQLHelper.ExecuteNonQuery(sql, param) > 0;
        }
    }
}