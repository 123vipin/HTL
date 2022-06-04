using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace KaysthaMatrimoneySite.Data.Models
{
    public class tbl_height
    {
        [Key]
        public int Id { get; set; }
        public string Height { get; set; }
    }
}
