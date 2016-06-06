using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Weiz.TaskManager.BLL;
using Weiz.TaskManager.Models;
using Weiz.TaskManager.TaskUtility;

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

        public ActionResult UpdateTaskStatus(string taskId, int status)
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