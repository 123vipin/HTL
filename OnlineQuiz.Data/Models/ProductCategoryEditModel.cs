using KaysthaMatrimoneySite.Data.ViewModels;
using OnlineQuiz.Data.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace HTL.Data.Models
{
    public class ProductCategoryEditModel
    {
        public TestSeries dbTrade { get; set; }
        public  List<DropDownList> dbTradeList { get; set; }
        
    }

    public class ProductMainEditModel
    {
        public List<TestSeries> dbTradeList { get; set; }
        public List<DropDownList> categoryList { get; set; }

    }

    public class UserCategoryEditModel
    {
        public UserModel dbTrade { get; set; }
        public List<DropDownList> dbTradeList { get; set; }

    }

    public class UserMainEditModel
    {
        public List<UserModel> dbTradeList { get; set; }
        public List<DropDownList> categoryList { get; set; }

    }

    public class RoleMainEditModel
    {
        public List<DropDownList> dbTradeList { get; set; }
        public List<DropDownList> categoryList { get; set; }

    }
}
