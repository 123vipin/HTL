using System;

namespace KaysthaMatrimoneySite.Data.ViewModels
{
    public class FileDocumentModel
    {
        public int DocumentId { get; set; }
        public string Name { get; set; }

        public string UniqueDocumentId { get; set; }
        public string Description { get; set; }
        public string UserName { get; set; }
        public DateTime? ViewCreatedDate { get; set; }
    }
}
