using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using TeachersSurvey.Models;
using TeachersSurvey.Utils;

namespace TeachersSurvey.Controllers
{
    public class AnswerController : BaseController
    {
        // GET: Answer
        public ActionResult Index()
        {
            var model = db.TblAnswers.Where(m => m.UserCode == UserCode).ToList();
            return View(model);
        }
        public ActionResult Create(string Code)
        {
            if(Code == null)
            {
                List<SelectListItem> teacherList = (from teacher in db.TblTeacher
                                                    where teacher.Code != UserCode
                                                    select new SelectListItem
                                                    {
                                                        Text = teacher.FullName,
                                                        Value = teacher.Code.ToString()
                                                    }).ToList();
                ViewBag.TblTeacher = new SelectList(teacherList.OrderBy(m => m.Text), "Value", "Text");
                var questionModel = db.TblQuestions.ToList();
                return View(questionModel);
            }
            else
            {
                CalculateScore(Code);
                return RedirectToAction("Index");
            }

            
        }
        public void CalculateScore(string code)
        {
            double yes = 0, no = 0, result = 0;
            var answer = db.TblAnswers.FirstOrDefault(m => m.TeacherCode == code && m.UserCode == UserCode);
            var answerLine = db.TblAnswerLine.Where(m => m.AnswerId == answer.Id).ToList();

            foreach (var item in answerLine)
            {
                if (item.Answer == Constants.AnswerType.Yes)
                {
                    yes++;

                }
                else
                    no++;
            }
            result = (yes/(yes+no))*100;
            if(result > 70)
            {
                answer.IsComplete = true;
            }
            else
            {
                answer.IsComplete = false;
            }
            answer.Score = result.ToString();
            db.SaveChanges();
        }

        public String SendData(AnswerModel answerModel)
        {
            int? month = DateTime.Now.Month;
            var model = db.TblAnswers.FirstOrDefault(m=>m.TeacherCode == answerModel.Code && m.UserCode == UserCode && m.CreateDate.Value.Month == month);
            if(model != null)
            {
                SaveAnswerLine(answerModel.Question, answerModel.Answer, model.Id);
            }
            else
            {
                TblAnswers answer = new TblAnswers();
                answer.TeacherCode = answerModel.Code;
                answer.TeacherName = answerModel.FullName;
                answer.UserCode = UserCode;
                answer.CreateDate = DateTime.Now;
                answer.CreateBy = FullName;

                db.TblAnswers.Add(answer);
                db.SaveChanges();
                SaveAnswerLine(answerModel.Question, answerModel.Answer, answer.Id);
            }

            
            return "True";
        }
        public void SaveAnswerLine(string question,string answer,int answerId)
        {
            var model = db.TblAnswerLine.FirstOrDefault(m=>m.AnswerId == answerId && m.Question == question);
            if (model != null)
            {
                model.Answer = answer;
                db.SaveChanges();

            }
            else
            {
                TblAnswerLine answerLine = new TblAnswerLine();
                answerLine.AnswerId = answerId;
                answerLine.Answer = answer;
                answerLine.Question = question;

                db.TblAnswerLine.Add(answerLine);
                db.SaveChanges();
            }

            
        }

        public ActionResult Detail(int? Id)
        {
            var model = db.TblAnswerLine.Where(m=>m.AnswerId == Id).ToList();
            return View(model);
        }
    }
}