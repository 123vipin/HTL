using System;
using System.Collections.Generic;
using System.Text;

namespace OnlineQuiz.Data.ViewModels
{
  public  class QuizListModel
    {
        public int questionTypeId { get; set; }

        public string Name { get; set; }
        public int Id { get; set; }
        public string optionjson { get; set; }
        public List<Option> options { get; set; }
        public int QuestionId { get; set; }
        public questionTypeModel questionType { get; set; }
        public int Time { get; set; }
        public string SeriesName { get; set; }
    }

    public class QuizlListMainModel
    {
        public int time;

        public List<QuizListModel> questions { get; set; }
        public string Name { get; set; }
        public int Id { get; set; }
        public string Description { get; set; }
    }

    public class questionTypeModel
    {
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public string Name { get; set; }
    }

    public class AddQuestion
    {
        public int TestSeriesId { get; set; }
        public string Question { get; set; }
        public string Option { get; set; }
        public int Userid { get; set; }
    }

    public class TestSeries
    {
        public int time { get; set; }
        public string testSeries { get; set; }
        public string description { get; set; }
        public int Userid { get; set; }
        public int questionType { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string ImageUrl { get; set; }
        public decimal Price { get; set; }
        public bool isActive { get; set; }

       
    }
}
