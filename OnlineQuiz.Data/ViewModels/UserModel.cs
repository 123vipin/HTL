using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HTL.Data.Models
{
    public partial class UserModel
    {

        public long? UserId { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
      
        public DateTime? CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string Password { get; set; }
        public bool? IsActive { get; set; }
        public String Salt { get; set; }
     
        public long? Phone { get; set; }
        public string encraptedMail { get; set; }


    }

    public class UserPassword
    {
        public int? UserId { get; set; }
        public string Password { get; set; }
    }
}

