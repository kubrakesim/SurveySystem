using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TeachersSurvey.Models;
using TeachersSurvey.Utils;

namespace TeachersSurvey.Controllers
{
    public class QuestionController : BaseController
    {
        // GET: Question
        public ActionResult Index()
        {

            if(Session["Admin"] == null)
            {
                return RedirectToAction("SignIn","Login");
            }
            else
            {
                var model = db.TblQuestions.ToList();
                return View(model);
            }
           
        }

        public ActionResult Create(TblQuestions questions)
        {
            if (questions.Question != null)
            {
                questions.CreateDate = DateTime.Now;
                questions.CreateBy =FullName;
                db.TblQuestions.Add(questions);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }



        }

        public ActionResult Edit(int? Id) 
        {
            if (Id == null || Id == 0)
            {
                return HttpNotFound();

            }
            var model = db.TblQuestions.Find(Id);

            return View(model);

        }
        [HttpPost]
        public ActionResult Edit(TblQuestions questions)
        {
            db.Entry(questions).State = System.Data.Entity.EntityState.Modified;
            db.Entry(questions).Property(e => e.CreateBy).IsModified = false;
            db.Entry(questions).Property(e => e.CreateDate).IsModified = false;
            questions.ModifyBy = FullName;
            questions.ModifyDate = DateTime.Now;
            db.SaveChanges();
            return RedirectToAction("Index");

        }


        public ActionResult Delete(int? Id)
        {
            if (Id == null || Id == 0)
            {
                return HttpNotFound();

            }
            var question = db.TblQuestions.Find(Id);
            db.TblQuestions.Remove(question);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}