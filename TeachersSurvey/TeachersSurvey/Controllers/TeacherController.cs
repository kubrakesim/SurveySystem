using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls.WebParts;
using TeachersSurvey.Models;
using TeachersSurvey.Utils;

namespace TeachersSurvey.Controllers
{
    public class TeacherController : BaseController
    {
       
      
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("SignIn", "Login");
            }
            else
            {
                var model = db.TblTeacher.ToList();
                return View(model);
            }
                
        }
        public ActionResult Create(TblTeacher teacher, string Answers)
        {
            if(teacher.FullName != null)
            {
                teacher.CreateDate = DateTime.Now;
                teacher.CreateBy = FullName;
                if (Answers == Constants.AnswerType.Yes)
                {
                    teacher.IsAdmin = true;
                }
                else
                {
                    teacher.IsAdmin = false;
                }
                db.TblTeacher.Add(teacher);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
            

           
        }

        public ActionResult Edit(int? Id) //? boş olabilir anlamında!
        {
            if (Id == null || Id == 0)
            {
                return HttpNotFound();

            }
            var model = db.TblTeacher.Find(Id);

            return View(model);

        }
        [HttpPost]
        public ActionResult Edit(TblTeacher teacher, string Answers) 
        {
            db.Entry(teacher).State = System.Data.Entity.EntityState.Modified;
            db.Entry(teacher).Property(e=>e.CreateBy).IsModified=false;
            db.Entry(teacher).Property(e => e.CreateDate).IsModified = false;
            teacher.ModifyBy =FullName;
            teacher.ModifyDate = DateTime.Now;
            if (Answers == Constants.AnswerType.Yes)
            {
                teacher.IsAdmin = true;
            }
            else
            {
                teacher.IsAdmin = false;
            }
            db.SaveChanges();
            return RedirectToAction("Index");

        }


        public ActionResult Delete(int? Id) 
        {
            if (Id == null || Id == 0)
            {
                return HttpNotFound();

            }
            var teacher = db.TblTeacher.Find(Id);
            db.TblTeacher.Remove(teacher);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

    }
}