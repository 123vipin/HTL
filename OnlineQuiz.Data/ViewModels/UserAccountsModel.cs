using System;
using System.Collections.Generic;
using System.Text;

namespace KaysthaMatrimoneySite.Data.ViewModels
{
    public class UserAccountsModel
    {
       

        public long? UserAccountId { get; set; }
        public long? UserId { get; set; }
        public int ? LoginUserId { get; set; }
        public int? BookmakerId { get; set; }
        public decimal? Balance { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool? ActiveState { get; set; }
        public string BookmakerName { get; set; }
        public double? OddRangeFrom { get; set; }
        public double? OddRangeTo { get; set; }
        public string Bookmaker { get; set; }
        public string Url { get; set; }
        public string TrademateName { get; set; }       
        public string Title { get; set; }
        public string Forename { get; set; }
        public string Surname { get; set; }
        public bool Active { get; set; }
        public string Code { get; set; }
        public int UserType { get; set; }
        public string LicenseNumber { get; set; }
        public DateTime? LicenseValidityFrom { get; set; }
        public DateTime? LicenseValidityTo { get; set; }
        public string TrademateUserName { get; set; }
        public string TrademateUserPassword { get; set; }
        public string LANIP { get; set; }
        public string MACAddress { get; set; }
        public DateTime? CreatedOn { get; set; }
        public double? EdgeRangeFrom { get; set; }
        public double? EdgeRangeTo { get; set; }
        public string AllowDayOfWeek { get; set; }
        public bool day0 { get; set; }
        public bool day1 { get; set; }
        public bool day2 { get; set; }
        public bool day3 { get; set; }
        public bool day4 { get; set; }
        public bool day5 { get; set; }
        public bool day6 { get; set; }
        public int CreatedBy { get; set; }
        public string CustomerName { get; set; }
        public string ExceptionReportStartDate { get; set; }
        public String ExceptionRepotToDate { get; set; }
        public TimeSpan TimeFrom { get; set; }
        public TimeSpan TimeTo { get; set; }
        public string Bookies { get; set; }
        public bool  IsLogin { get; set; }
        public string ProcType { get; set; }
    }
}
