
using KaysthaMatrimoneySite.Data.Models;

using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

using System;

namespace KaysthaMatrimoneySite.Core.DataContext
{
    public partial class KaysthMatrimoneyContext : DbContext
    {
        public KaysthMatrimoneyContext()
        {
        }
        public KaysthMatrimoneyContext(DbContextOptions<KaysthMatrimoneyContext> option) : base(option) { }

        public virtual DbSet<Login> Login { get; set; }
        
        public virtual DbSet<Occupation> Occupation { get; set; }
        public virtual DbSet<TbL_User> TbL_User { get; set; }
        public virtual DbSet<Tbl_UploadImage> Tbl_UploadImage { get; set; }
        public virtual DbSet<tbl_height> tbl_height { get; set; }
        public virtual DbSet<StateMaster> StateMaster { get; set; }
        public virtual DbSet<CityMaster> CityMaster { get; set; }




    }
}
