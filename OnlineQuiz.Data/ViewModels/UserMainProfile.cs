using System;
using System.Collections.Generic;
using System.Text;

namespace KaysthaMatrimoneySite.Data.ViewModels
{
    public class UserMainProfile
    {
        public long? UserId { get; set; }
        public string UserName { get; set; }
        public string City { get; set; }
        public string Income { get; set; }
        public string Occupation { get; set; }
        public string Height { get; set; }
        public string Years { get; set; }
        public string ImageName { get; set; }
   
        public int TotalPhoto { get; set; }
        public string ActualImageName { get; set; }
        public long MainStatus { get; set; }
    }
}
