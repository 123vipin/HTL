using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace KaysthaMatrimoneySite.Data.Models
{
    public partial class TbL_User
    {
       

        [Key]
        public long? UserId { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string Password { get; set; }
        public bool? IsActive { get; set; }
        public String Salt { get; set; }
        public int Status { get; set; }
      
        public string EmailSalt { get; set; }
        public long Phone { get; set; }

    }
}
