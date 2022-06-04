using System;
using System.Collections.Generic;

namespace KaysthaMatrimoneySite.Data.Models
{
    public partial class Login
    {
        public int? UserType { get; set; }

        public int? LoginId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int? Status { get; set; }
        public int Phone { get; set; }
        public string Email { get; set; }

    }
}
