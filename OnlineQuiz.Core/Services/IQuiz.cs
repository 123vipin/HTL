using HTL.Data.Models;
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

        ProductMainEditModel GetProductList(int userid,  int getValue, int skipValue,int statusType);
        QuizlListMainModel GetQuizById(int userid, int getValue, int skipValue, int testId);
        int AddQuestion(AddQuestion model);
        int SaveProduct(TestSeries model);
        int Publish(int testId);
        ProductCategoryEditModel GetproductDatabyId(int id);
        
        IEnumerable<PaperViewModel> GetPaperList(int userid, int getValue, int skipValue, int statusType);
        
        IEnumerable<DropDownList> GetQuestionType(int userid);
        IEnumerable<DropDownList> GetAllPaperList(string userid);
        int SavePaperSeries(PaperViewModel model);
        IEnumerable<PaperViewModel> GetPaperAllList(int userid, int getValue, int skipValue, int statusType);
        IEnumerable<ProductCategory> GetProductCategoryList(int userid, int getValue, int skipValue);
        int saveProductCategory(ProductCategory model);
        UserMainEditModel GetUserList(int userid, int getValue, int skipValue, int statusType);
        List<DropDownList> GetRoleList(int userid, int getValue, int skipValue, int statusType);
        RoleMainEditModel getRoleDataById(int roleId, int getValue, int skipValue, int statusType);

    }
    




}
