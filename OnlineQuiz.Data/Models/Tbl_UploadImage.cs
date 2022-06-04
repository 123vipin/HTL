using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace KaysthaMatrimoneySite.Data.Models
{
   public class Tbl_UploadImage
    {
        [Key]
        public int ImageId { get; set; }
        public string ImagePath { get; set; }
        public string Name { get; set; }
    
        public long UserId { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool defaultImage { get; set; }
        public bool IsDeleted { get; set; }
        public bool isActive { get; set; }
    }
    

}
