using HTL.Data.Models;
using KaysthaMatrimoneySite.Data.Models;
using KaysthaMatrimoneySite.Data.ViewModels;
using OnlineQuiz.Data.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace KaysthaMatrimoneySite.Core.Services
{
    public interface ILogin
    {
        Login Login(Login userlogin);
        DashBoardViewModel GetAllDashBoardRecord(int userId);
        int SaveUser(UserModel model);
        UserModel ForgotSendMailPassword(UserModel model);
        int UpdatePassword(UserPassword model);
        int SaveSuggestion(UserModel model);
    }

}
