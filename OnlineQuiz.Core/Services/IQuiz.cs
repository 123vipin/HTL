using KaysthaMatrimoneySite.Data.Models;
using KaysthaMatrimoneySite.Data.ViewModels;
using OnlineQuiz.Data.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace KaysthaMatrimoneySite.Core.Services
{
    public interface IQuiz
    {
 
        IEnumerable<QuizList> GetLatestQuiz(int userid,  int getValue, int skipValue,int statusType);
        QuizlListMainModel GetQuizById(int userid, int getValue, int skipValue, int testId);
        int AddQuestion(AddQuestion model);
        int SaveProduct(TestSeries model);
        int Publish(int testId);

        IEnumerable<PaperViewModel> GetPaperList(int userid, int getValue, int skipValue, int statusType);
        
        IEnumerable<DropDownList> GetQuestionType(int userid);
        IEnumerable<DropDownList> GetAllPaperList(string userid);
        int SavePaperSeries(PaperViewModel model);
        IEnumerable<PaperViewModel> GetPaperAllList(int userid, int getValue, int skipValue, int statusType);
    }
    


}
