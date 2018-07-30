using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using TaskList.Data;

namespace TaskList.Controllers
{
    public class TasksController : Controller
    {
        private readonly TasksContext _tasksContext;

        public TasksController(TasksContext tasksContext)
        {
            _tasksContext = tasksContext;
        }
        public IActionResult Index()
        {
            return View(_tasksContext.Tasks.ToList());
        }
        public IActionResult Create(Domain.Task task)
        {
            task.AddedOn = DateTime.UtcNow;
            _tasksContext.Tasks.Add(task);
            _tasksContext.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            var task = _tasksContext.Tasks.Find(id);
            _tasksContext.Tasks.Remove(task);
            _tasksContext.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult MarkAsComplete(int id)
        {
            var task = _tasksContext.Tasks.Find(id);
            task.MarkAsComplete();
            _tasksContext.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult MarkAsIncomplete(int id)
        {
            var task = _tasksContext.Tasks.Find(id);
            task.MarkAsIncomplete();
            _tasksContext.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
