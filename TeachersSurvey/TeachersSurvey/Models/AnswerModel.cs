using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeachersSurvey.Models
{
    public class AnswerModel
    {

        public string Code { get; set; }
        public string FullName { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}