using System;
using System.Collections.Generic;
using System.Text;

namespace KaysthaMatrimoneySite.Data.ViewModels
{
   public class DashBoardViewModel
    {
        public long ActiveUser { get; set; }
        public long Tradefeeds { get; set; }
        public long BookMakers { get; set; }
        public long TotalSend { get; set; }
        public long TotalAccpted { get; set; }
        public int Attempt { get; set; }
        public int TotalLeft { get; set; }
    }
}
