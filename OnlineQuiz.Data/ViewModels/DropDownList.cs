﻿using System;
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
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public int Roleid { get; set; }
        public string urlValue { get; set; }
        public string iclass { get; set; }
    }
}
