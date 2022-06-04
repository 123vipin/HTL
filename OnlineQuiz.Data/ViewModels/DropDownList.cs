using System;
using System.Collections.Generic;
using System.Text;

namespace KaysthaMatrimoneySite.Data.ViewModels
{
   public class DropDownList
    {
        public int Key { get; set; }
        public string Value { get; set; }
        public int? UserId { get; set; }
        public bool IsCheck { get; set; }
        public string small { get; set; }
        public string big { get; set; }
        public string medium { get; set; }
    }
}
