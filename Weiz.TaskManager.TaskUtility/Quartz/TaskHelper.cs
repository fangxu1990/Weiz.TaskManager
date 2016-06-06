using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Weiz.TaskManager.Models;

namespace  Weiz.TaskManager.TaskUtility
{
    /// <summary>
    /// 任务帮助类
    /// </summary>
    public class TaskHelper
    {
        private static BLL.TaskBLL task = new BLL.TaskBLL();

        /// <summary>
        /// 删除指定id任务
        /// </summary>
        /// <param name="TaskID">任务id</param>
        public static void DeleteById(string taskId)
        {
            QuartzHelper.DeleteJob(taskId);

            task.DeleteById(taskId);
        }

        /// <summary>
        /// 更新任务运行状态
        /// </summary>
        /// <param name="TaskID">任务id</param>
        /// <param name="Status">任务状态</param>
        public static void UpdateTaskStatus(string taskId, TaskStatus Status)
        {
            if (Status == TaskStatus.RUN)
            {
                QuartzHelper.ResumeJob(taskId);
            }
            else
            {
                QuartzHelper.PauseJob(taskId);
            }
            task.UpdateTaskStatus(taskId, (int)Status);
        }

        /// <summary>
        /// 更新任务下次运行时间
        /// </summary>
        /// <param name="TaskID">任务id</param>
        /// <param name="NextFireTime">下次运行时间</param>
        public static void UpdateNextFireTime(string taskId, DateTime nextFireTime)
        {
            task.UpdateNextFireTime(taskId, nextFireTime);
        }

        /// <summary>
        /// 任务完成后，更新上次执行时间
        /// </summary>
        /// <param name="taskId"></param>
        /// <param name="recentRunTime">上次执行时间</param>
        public static void UpdateRecentRunTime(string taskId, DateTime recentRunTime)
        {
            task.UpdateRecentRunTime(taskId, recentRunTime);
        }

        /// <summary>
        /// 获取所有启用的任务
        /// </summary>
        /// <returns>所有启用的任务</returns>
        public static List<TaskModel> GetAllTaskList()
        {
            return task.GetAllTaskList();
        }


    }
}
