using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace KaysthaMatrimoneySite.Data.Models
{
    public partial class StateMaster
    {
        [Key]
        public int Id { get; set; }

        public int? CountryId { get; set; }
        public string Name { get; set; }
      
       
    }
}
