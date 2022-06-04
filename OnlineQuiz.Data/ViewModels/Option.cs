using System;
using System.Collections.Generic;
using System.Text;

namespace OnlineQuiz.Data.ViewModels
{
    public class Option
    {
        public int Id { get; set; }

        public int questionId { get; set; }
        public string name { get; set; }
        public bool isAnswer { get; set; }
        public bool selected { get; set; }

    }
}
