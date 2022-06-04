using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace KaysthaMatrimoneySite.Data.Models
{
    public partial class CityMaster
    {
        [Key]
        public int Id { get; set; }

        public int? StateID { get; set; }
        public string Name { get; set; }
      
       
    }
}
