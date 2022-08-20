using System;    
using System.Threading.Tasks;       
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using KaysthaMatrimoneySite.Core.DataContext;
using KaysthaMatrimoneySite.Core.Services;
using KaysthaMatrimoneySite.Data.Models;
using KaysthaMatrimoneySite.Data.ViewModels;
using System.Security.Cryptography;
using System.Net.Http;
using System.Net.Http.Headers;
using Microsoft.Extensions.Configuration;
using OnlineQuiz.Data.ViewModels;
using System.Collections.Generic;
using HTL.Data.Models;

namespace KaysthaMatrimoneySite.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuizController : ControllerBase
    {
        KaysthMatrimoneyContext _context;
        private readonly IQuiz _quiz;
        private readonly IConfiguration _config;
        private readonly IEmailSender _iemailSender;
        private readonly IHttpContextAccessor _httpContextAccessor;
        const string Role = "";
        public QuizController(KaysthMatrimoneyContext context, 
            IConfiguration config, IQuiz quiz,  IHttpContextAccessor httpContextAccessor, IEmailSender iemailSender)
        {
            _context = context;
            _config = config;
            _quiz = quiz;
            _iemailSender = iemailSender;

            _httpContextAccessor = httpContextAccessor;

        }
        [HttpGet("GetProductList/{UserId}/{GetValue}/{skipValue}/{statusType}")]
        public ProductMainEditModel GetProductList(int Userid, int GetValue, int skipValue, int statusType)
        {
           
            return _quiz.GetProductList(Userid, GetValue, skipValue, statusType);
        }

        [HttpGet("GetUserList/{UserId}/{GetValue}/{skipValue}/{statusType}")]
        public UserMainEditModel GetUserList(int Userid, int GetValue, int skipValue, int statusType)
        {

            return _quiz.GetUserList(Userid, GetValue, skipValue, statusType);
        }

        [HttpGet("getRoleDataById/{UserId}/{GetValue}/{skipValue}/{statusType}")]
        public RoleMainEditModel getRoleDataById(int roleId, int GetValue, int skipValue, int statusType)
        {

            return _quiz.getRoleDataById(roleId, GetValue, skipValue, statusType);
        }

        
        [HttpGet("GetRoleList/{UserId}/{GetValue}/{skipValue}/{statusType}")]
        public List<DropDownList> GetRoleList(int Userid, int GetValue, int skipValue, int statusType)
        {

            return _quiz.GetRoleList(Userid, GetValue, skipValue, statusType);
        }
        

        [HttpGet("GetPaperList/{UserId}/{GetValue}/{skipValue}/{statusType}")]
        public IEnumerable<PaperViewModel> GetPaperList(int Userid, int GetValue, int skipValue, int statusType)
        {

            return _quiz.GetPaperList(Userid, GetValue, skipValue, statusType);
        }

        [HttpGet("GetQuizById/{UserId}/{GetValue}/{skipValue}/{testId}")]
        public QuizlListMainModel GetQuizById(int Userid, int GetValue, int skipValue, int testId)
        {

            return _quiz.GetQuizById(Userid, GetValue, skipValue, testId);
        }
        [HttpPost("AddQuestion")]
        public int AddQuestion(AddQuestion model)
        {

            return _quiz.AddQuestion(model);
        }
        [HttpPost("SaveProduct")]
        public int SaveProduct(TestSeries model)
        {

            return _quiz.SaveProduct(model);
        }


        [HttpGet("Publish/{testId}")]
        public int Publish(int testId)
        {

            return _quiz.Publish(testId);
        }

        [HttpGet("GetproductDatabyId/{id}")]
        public ProductCategoryEditModel GetproductDatabyId(int id)
        {

            return _quiz.GetproductDatabyId(id);
        }

        
        [HttpGet("GetQuestionType/{userId}")]
        public IEnumerable<DropDownList> GetQuestionType(int userId)
        {

            return _quiz.GetQuestionType(userId);
        }

        [HttpGet("GetAllPaperList/{userId}")]
        public IEnumerable<DropDownList> GetAllPaperList(string userId)
        {

            return _quiz.GetAllPaperList(userId);
        }

        [HttpPost("SavePaperSeries")]
        public int SavePaperSeries(PaperViewModel model)
        {

            return _quiz.SavePaperSeries(model);
        }
        [HttpGet("GetPaperAllList/{UserId}/{GetValue}/{skipValue}/{statusType}")]
        public IEnumerable<PaperViewModel> GetPaperAllList(int Userid, int GetValue, int skipValue, int statusType)
        {

            return _quiz.GetPaperAllList(Userid, GetValue, skipValue, statusType);
        }

        [HttpGet("GetProductCategoryList/{UserId}/{GetValue}/{skipValue}")]
        public IEnumerable<ProductCategory> GetProductCategoryList(int Userid, int GetValue, int skipValue)
        {

            return _quiz.GetProductCategoryList(Userid, GetValue, skipValue);
        }

        [HttpPost("saveProductCategory")]
        public int saveProductCategory(ProductCategory model)
        {

            return _quiz.saveProductCategory(model);
        }
        

    }
}
