using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TeachersSurvey.Models;

namespace TeachersSurvey.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        DbServeySystemEntities db = new DbServeySystemEntities();
        public ActionResult SignIn(string Code,string Password)
        {
            if(Code == null)
            {
                return View();
            }
            else
            {
                var teacher = db.TblTeacher.FirstOrDefault(m => m.Code == Code && m.Password == Password);
                if (teacher != null)
                {
                    Session["Code"] = teacher.Code;
                    Session["FullName"] = teacher.FullName;
                    if(teacher.IsAdmin == true)
                    {
                        Session["Admin"] = "Admin";
                    }

                    return RedirectToAction("Create", "Answer");
                }
                else
                {
                    ViewBag.Error = "Kullanıcı adı veya şifre hatalı";
                    return View();
                }
            }
           
           
        }
    
        public ActionResult LogOut()
        {
            Session.Abandon();
            return RedirectToAction("SignIn", "Login");
        }
    }
}