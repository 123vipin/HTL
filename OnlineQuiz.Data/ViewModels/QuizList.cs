using System;
using System.Collections.Generic;
using System.Text;

namespace OnlineQuiz.Data.ViewModels
{
    public class QuizList
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public int? Status { get; set; }
        public int? NoOfQustion { get; set; }

        public int? Time { get; set; }
        public bool isActive { get; set; }
        public string Subject { get; set; }
        public string qustinonLink { get; set; }
        public string AnswerLink { get; set; }

    }
}
