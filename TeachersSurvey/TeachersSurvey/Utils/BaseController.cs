using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TeachersSurvey.Models;

namespace TeachersSurvey.Utils
{
    public class BaseController : Controller
    {
        // GET: Base
        public DbServeySystemEntities db = new DbServeySystemEntities();
        public string UserCode { get; set; }
        public string FullName { get; set; }
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if(Session["Code"] == null)
            {
                filterContext.Result = new RedirectResult("/Login/SignIn");
            }
            else
            {
                UserCode = Session["Code"].ToString();
                FullName = Session["FullName"].ToString();

            }
            base.OnActionExecuting(filterContext);
        }
    }
}