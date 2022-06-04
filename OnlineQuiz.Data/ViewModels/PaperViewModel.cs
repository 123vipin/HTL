using System;
using System.Collections.Generic;
using System.Text;

namespace OnlineQuiz.Data.ViewModels
{
    public class PaperViewModel
    {
        public string qustinonLink;

        public string time { get; set; }
        public string Paper { get; set; }
        public string description { get; set; }
        public string questionUrl { get; set; }
        public string answerurl { get; set; }
        public int? Userid { get; set; }
        public bool isActive { get; set; }
        public int? Id { get; set; }
        public int paperType { get; set; }
        public string PaperTypeStr { get; set; }
        public string AnswerLink { get; set; }
        public string Name { get; set; }
    }
}
