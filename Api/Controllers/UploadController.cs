
using KaysthaMatrimoneySite.Core.DataContext;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.IO;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        KaysthMatrimoneyContext _context;
        private readonly IConfiguration _config;
        [Obsolete]
        private readonly IHostingEnvironment _env;

        private readonly IHttpContextAccessor _httpContextAccessor;
        const string Role = "";

        [Obsolete]
        public UploadController(KaysthMatrimoneyContext context,  IHostingEnvironment env, IConfiguration config, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _config = config;
            _env = env;
            _httpContextAccessor = httpContextAccessor;

        }
        [HttpGet("Logout")]

        public ActionResult<bool> Logout()
        {

            HttpContext.Session.Clear();

            return true;

        }
        [HttpPost(nameof(UploadFile))]
        public async Task<IActionResult> UploadFile(IFormFile files)
        {
            string systemFileName = files.FileName;
            string blobstorageconnection = _config.GetValue<string>("BlobConnectionString");
            // Retrieve storage account from connection string.    
            CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(blobstorageconnection);
            // Create the blob client.    
            CloudBlobClient blobClient = cloudStorageAccount.CreateCloudBlobClient();
            // Retrieve a reference to a container.    
            CloudBlobContainer container = blobClient.GetContainerReference(_config.GetValue<string>("BlobContainerName"));
            // This also does not make a service call; it only creates a local object.    
            CloudBlockBlob blockBlob = container.GetBlockBlobReference(systemFileName);
            await using (var data = files.OpenReadStream())
            {
                await blockBlob.UploadFromStreamAsync(data);
            }
            return Ok("File Uploaded Successfully");
        }
        [HttpPost(nameof(DownloadFile))]
        public async Task<IActionResult> DownloadFile(string fileName)
        {
            CloudBlockBlob blockBlob;
            await using (MemoryStream memoryStream = new MemoryStream())
            {
                string blobstorageconnection = _config.GetValue<string>("BlobConnectionString");
                CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(blobstorageconnection);
                CloudBlobClient cloudBlobClient = cloudStorageAccount.CreateCloudBlobClient();
                CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference(_config.GetValue<string>("BlobContainerName"));
                blockBlob = cloudBlobContainer.GetBlockBlobReference(fileName);
                await blockBlob.DownloadToStreamAsync(memoryStream);
            }
            Stream blobStream = blockBlob.OpenReadAsync().Result;
            return File(blobStream, blockBlob.Properties.ContentType, blockBlob.Name);
        }

        [HttpPost("UploadImage"), DisableRequestSizeLimit]
        public IActionResult UploadImage()
        {
            try
            {
                var file = Request.Form.Files[0];

                string extension = System.IO.Path.GetExtension(file.FileName);
                var uniqueFileName = Guid.NewGuid() + extension;

                var FilePath = _config.GetValue<string>("FilePath") + "\\" + Request.Form.Files[1].FileName;
                var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), uniqueFileName);

                if (file.Length > 0)
                {
                    int userId = Convert.ToInt32(Request.Form.Files[1].FileName);
                   // _upload.SaveFileName(uniqueFileName, userId);
                    var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    var fullPath = Path.Combine(FilePath, uniqueFileName);
                    var dbPath = Path.Combine(file.FileName, uniqueFileName);
                    bool exists = System.IO.Directory.Exists(FilePath);
                    if (!exists)
                        System.IO.Directory.CreateDirectory(FilePath);
                    using (var stream = new FileStream(fullPath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                    return Ok(new { dbPath });
                }
                else
                {
                    return BadRequest();
                }

            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }

        }

      
        }

    
}