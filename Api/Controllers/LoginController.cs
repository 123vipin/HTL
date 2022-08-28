using System;    
using System.Threading.Tasks;       
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

using System.Security.Cryptography;
using System.Net.Http;
using System.Net.Http.Headers;
using Microsoft.Extensions.Configuration;
using KaysthaMatrimoneySite.Core.Services;
using KaysthaMatrimoneySite.Core.DataContext;
using KaysthaMatrimoneySite.Data.ViewModels;
using KaysthaMatrimoneySite.Data.Models;
using HTL.Data.Models;
using OnlineQuiz.Data.ViewModels;
using System.Collections.Generic;

namespace KaysthaMatrimoneySite.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        KaysthMatrimoneyContext _context;
        private readonly ILogin _loginUser;
        private readonly IConfiguration _config;
        private readonly IEmailSender _iemailSender;
        private readonly IHttpContextAccessor _httpContextAccessor;
        const string Role = "";
        public LoginController(KaysthMatrimoneyContext context, 
            IConfiguration config, ILogin loginUser,  IHttpContextAccessor httpContextAccessor, IEmailSender iemailSender)
        {
            _context = context;
            _config = config;
            _loginUser = loginUser;
            _iemailSender = iemailSender;

            _httpContextAccessor = httpContextAccessor;

        }
        [HttpPost("registration")]
        public IActionResult Registration(Login userlogin)
        {
            try
            {
                _context.Login.Add(userlogin);
                _context.SaveChanges();
                return Ok(true);
            }
            catch (Exception ex)
            {
                return Ok(ex);
            }
        }

        [HttpPost("login")]
        public ActionResult<Login> Login(Login userlogin)
        {
            return _loginUser.Login(userlogin);
            ///return l;
        }
        [HttpGet("getSideBarList/{userId}")]
        public List<DropDownList> getSideBarList(int userId)
        {
            return _loginUser.getSideBarList(userId);
            ///return l;
        }
        

        [HttpPost("ForgotSendMailPassword")]
        public ActionResult<int> ForgotSendMailPassword(UserModel userlogin)
        {
            var FilePath = _config.GetValue<string>("ForGotPassword");
            var updatePasswrdLink = _config.GetValue<string>("updatePasswrdLink");
            var data= _loginUser.ForgotSendMailPassword(userlogin);
            if(data.UserId>=0)
            {
              //  _iemailSender.SendEmail(data, FilePath, userlogin, updatePasswrdLink);
            }
            return 1;
        }

        [HttpPost("UpdatePassword")]
        public ActionResult<int> UpdatePassword(UserPassword userlogin)
        {
            var data = _loginUser.UpdatePassword(userlogin);
            return data;
        }

        [HttpGet("GetAllDashBoardRecord/{userId}")]
        public ActionResult<DashBoardViewModel> GetAllDashBoardRecord(int userId)
        {


            return _loginUser.GetAllDashBoardRecord(userId);

        }

        [HttpPost("SaveUser")]
        public ActionResult<int> SaveUser(UserModel model)
        {

            return _loginUser.SaveUser(model);

        }
        [HttpGet("SendOtpAsync/{mobileNo}")]
        public async Task<ActionResult<bool>> SendOtpAsync(long mobileNo)
        {
            var client = new HttpClient();
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Post,
                RequestUri = new Uri("https://d7sms.p.rapidapi.com/secure/send"),
                Headers =
    {
        { "authorization", "Basic bml0aW46bml0aW4=" },
        { "x-rapidapi-key", "1b551d9ce3mshf9c844a69533d58p1fcb2ejsne9143c6f20d7" },
        { "x-rapidapi-host", "d7sms.p.rapidapi.com" },
    },
                Content = new StringContent("{\r\n    \"content\": \"Test Message\",\r\n    \"from\": \"D7-Rapid\",\r\n    \"to\": 7409372264\r\n}")
                {
                    Headers =
        {
            ContentType = new MediaTypeHeaderValue("application/json")
        }
                }
            };
            using (var response = await client.SendAsync(request))
            {
                response.EnsureSuccessStatusCode();
                var body = await response.Content.ReadAsStringAsync();
                Console.WriteLine(body);
            }
            return true;

        }
        [HttpGet("Logout")]

        public ActionResult<bool> Logout()
        {

            //HttpContext.Session.Clear();

            return true;

        }

        [HttpPost("SaveSuggestion")]
        public ActionResult<int> SaveSuggestion(UserModel userlogin)
        {
            var data = _loginUser.SaveSuggestion(userlogin);
            return data;
        }

        [HttpPost("saveRole")]
        public ActionResult<int> saveRole(RoleModel model)
        {

            return _loginUser.saveRole(model);

        }
    }
}
