﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Weiz.TaskManager.BLL;
using Weiz.TaskManager.Models;
using Weiz.TaskManager.TaskUtility;
using Weiz.TaskManager.Utility;

namespace Weiz.TaskManager.HouTai_New.Controllers
{
    public class TaskController : BaseController
    {

        TaskBLL task = new TaskBLL();

        public ActionResult Grid()
        {
            var result = task.GetTaskList(PageNo, PageSize);

            return View(result);
        }

        public ActionResult Edit(string taskId)
        {
            TaskModel model = new TaskModel();
            if (!string.IsNullOrEmpty(taskId))
            {
                model = task.GetTaskById(taskId);
            }
            return PartialView("_Edit", model);
        }

        public JsonResult Save(string data,string action)
        {
            try
            {
                var taskmodel = JsonHelper.ToObject<TaskModel>(data);
                var result = false;
                if (action == "edit")
                {
                    result = task.Edit(taskmodel);
                }
                else
                {
                    taskmodel.TaskID = Guid.NewGuid();

                    result = task.Add(taskmodel);
                }

                if (result)
                {
                    QuartzHelper.ScheduleJob(taskmodel, true);
                }

                return Json(new { result = result });
            }
            catch (Exception ex)
            {
                return Json(new { result = false, msg = ex.Message });
            }
        }

        public ActionResult UpdateStatus(string taskId, int status)
        {
            try
            {
                TaskHelper.UpdateTaskStatus(taskId, (TaskStatus)status);

                return Json(new { result = true, msg = "" });
            }
            catch (Exception ex)
            {
                return Json(new { result = false, msg = ex.Message });
            }
        }
    }
}