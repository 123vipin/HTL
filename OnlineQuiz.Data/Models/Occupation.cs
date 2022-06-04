using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace KaysthaMatrimoneySite.Data.Models
{
    public class Occupation
    {
        [Key]
        public int Id { get; set; }
        public string OccupationType { get; set; }
        public bool IsActive { get; set; }
    }
}
