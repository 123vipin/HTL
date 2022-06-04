using System;
using System.Collections.Generic;
using System.Text;

namespace KaysthaMatrimoneySite.Data.ViewModels
{
    public class UserProfileUpdate
    {
       
        public long? UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string City { get; set; }
        public string Income { get; set; }
        public string EmployedIn { get; set; }
        public string Occupation { get; set; }
        public string OrganizationName { get; set; }
        public string MaritalStatus { get; set; }
        public string Height { get; set; }
        public string challengedExp { get; set; }
        public string AboutMe { get; set; }
        public bool challenged { get; set; }
        public bool smoking { get; set; }
        public bool drinking { get; set; }
        public DateTime ? Dob { get; set; }
        public int StateId { get; set; }
        public string CityId { get; set; }
        public string ImageName { get; set; }
        public string CityList { get; set; }
        public string Years { get; set; }
        public int? TotalPhoto { get; set; }
    }

    
}
