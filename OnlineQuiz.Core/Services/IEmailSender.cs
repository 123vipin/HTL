using HTL.Data.Models;
using KaysthaMatrimoneySite.Data.ViewModels;
using OnlineQuiz.Data.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace KaysthaMatrimoneySite.Core.Services
{
    public interface IEmailSender
    {
        void SendEmail(UserModel model,string filePath, UserModel userlogin, string updatePasswrdLink);
    }
}
