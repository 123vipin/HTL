using System;
using System.Collections.Generic;
using System.Text;

namespace HTL.Data.Models
{
    public class ProductCategory
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public bool isActive { get; set; }
        public string CreatedBy { get; set; }
        public DateTime createdTime { get; set; }
        public string description { get; set; }
        public int? Userid { get; set; }
    }
}
