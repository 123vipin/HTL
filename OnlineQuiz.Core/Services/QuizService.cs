using KaysthaMatrimoneySite.Core.Infrastructure;

using System;
using System.Linq;

using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Extensions.Configuration;
using KaysthaMatrimoneySite.Data.Models;
using KaysthaMatrimoneySite.Data.ViewModels;
using Web.Core.Users.Crytography;
using System.Security.Cryptography;
using OnlineQuiz.Data.ViewModels;
using Newtonsoft.Json;
using HTL.Data.Models;

namespace KaysthaMatrimoneySite.Core.Services
{
    public class QuizService : IQuiz
    {
   
        IConfiguration _config;


        public QuizService(
            IConfiguration config)
        {
        
            _config = config;
        
        }

        public int AddQuestion(AddQuestion model)
        {
            int QuestionNo = 0;
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_Question]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@Quetion", model.Question);
                    Cmd.Parameters.AddWithValue("@Option", model.Option);
                    Cmd.Parameters.AddWithValue("@Userid", model.Userid);
                    Cmd.Parameters.AddWithValue("@testSeriesid", model.TestSeriesId);
                    Cmd.Parameters.Add("@QuestionNo", SqlDbType.Int).Direction = ParameterDirection.Output;
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                     QuestionNo = Convert.ToInt32(Cmd.Parameters["@QuestionNo"].Value);

                    reader.Close();
                    con.Close();
                    
                }

            }
            catch (Exception ex)
            {
                //return (int)(CreateUser.Failed);
            }
            return QuestionNo;
        }

        public IEnumerable<TestSeries> GetProductList(int userId, int GetValue, int skipValue,int statusType)
        {
            List<TestSeries> dbTradeList = new List<TestSeries>();
            string connetionString = null;
            SqlConnection con;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_PrductList]", con))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@UserId", userId);
                Cmd.Parameters.AddWithValue("@skipValue", skipValue);
                Cmd.Parameters.AddWithValue("@GetValue", GetValue);
                Cmd.Parameters.AddWithValue("@statusType", statusType);
                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {
                        dbTradeList.Add(new TestSeries

                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id")),
                            Name = reader.IsDBNull(reader.GetOrdinal("Name")) ? null : reader.GetString(reader.GetOrdinal("Name")),
                            description = reader.IsDBNull(reader.GetOrdinal("Description")) ? null : reader.GetString(reader.GetOrdinal("Description")),
                            Quantity = reader.GetInt32(reader.GetOrdinal("Quantity")),
                            Price = reader.GetDecimal(reader.GetOrdinal("Price")),
                            isActive = reader.GetBoolean(reader.GetOrdinal("isActive")),
                            ImageUrl = reader.IsDBNull(reader.GetOrdinal("ImageUrl")) ? null : reader.GetString(reader.GetOrdinal("ImageUrl")),


                        });
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                reader.Close();
                con.Close();
            }
          
            return dbTradeList;
        }

        public QuizlListMainModel GetQuizById(int userid, int getValue, int skipValue, int testId)
        {
            List<QuizListModel> dbTradeList = new List<QuizListModel>();
            string connetionString = null;
            SqlConnection con;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_getTestSeriesById]", con))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@UserId", userid);
                Cmd.Parameters.AddWithValue("@skipValue", skipValue);
                Cmd.Parameters.AddWithValue("@GetValue", getValue);
                Cmd.Parameters.AddWithValue("@testId", testId);
                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {
                        dbTradeList.Add(new QuizListModel
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            QuestionId = reader.GetInt32(reader.GetOrdinal("Id")),
                            optionjson = reader.IsDBNull(reader.GetOrdinal("Options")) ? null : reader.GetString(reader.GetOrdinal("Options")),
                            Name = reader.IsDBNull(reader.GetOrdinal("QuestinName")) ? null : reader.GetString(reader.GetOrdinal("QuestinName")),
                            //NoOfQustion = reader.GetInt32(reader.GetOrdinal("NoOfQustion")),
                            Time = reader.GetInt32(reader.GetOrdinal("Time")),
                            //Status = reader.GetInt32(reader.GetOrdinal("Status")),
                            SeriesName = reader.IsDBNull(reader.GetOrdinal("SeriesName")) ? null : reader.GetString(reader.GetOrdinal("SeriesName")),

                            
                        });
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                reader.Close();
                con.Close();
            }
            questionTypeModel q = new questionTypeModel();
            q.IsActive = true;
            q.Id = 1;
            q.Name = "Multiple Choice";

            foreach (var x in dbTradeList)
            {

               x.options= JsonConvert.DeserializeObject<List<Option>>(x.optionjson);
                x.questionType = q;
                x.questionTypeId = testId;
            }
            var testSeriesName=dbTradeList.FirstOrDefault().SeriesName;
            var time = dbTradeList.FirstOrDefault().Time;
            QuizlListMainModel m = new QuizlListMainModel();
            m.questions = dbTradeList;
            m.Name = testSeriesName;
            m.time = time * 60;
            m.Description = "Description";
            return m;
        }

        public int SaveProduct(TestSeries model)
        {
            int status = 0;
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[save_Product]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@Id", model.Id);
                    Cmd.Parameters.AddWithValue("@Name", model.Name);
                    Cmd.Parameters.AddWithValue("@Userid", model.Userid);
                    Cmd.Parameters.AddWithValue("@description", model.description);
                    Cmd.Parameters.AddWithValue("@ImageUrl", model.ImageUrl);
                    Cmd.Parameters.AddWithValue("@Price", model.Price);
                    Cmd.Parameters.AddWithValue("@Quantity", model.Quantity);
                    Cmd.Parameters.AddWithValue("@isActive", model.isActive);
                      con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    status = 1;

                    reader.Close();
                    con.Close();

                }

            }
            catch (Exception ex)
            {
                status = 0;


                //return (int)(CreateUser.Failed);
            }
            return status;
        }
        public int Publish(int testId)
        {
            int status = 0;
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_publish]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@testId", testId);
                    Cmd.Parameters.Add("@Status", SqlDbType.Int).Direction = ParameterDirection.Output;
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    status = Convert.ToInt32(Cmd.Parameters["@Status"].Value);

                    reader.Close();
                    con.Close();

                }

            }
            catch (Exception ex)
            {
                //return (int)(CreateUser.Failed);
            }
            return status;
        }

        public ProductCategoryEditModel GetproductDatabyId(int id)
        {
            TestSeries dbTrade = new TestSeries();
            List<DropDownList> dbTradeList = new List<DropDownList>();
            ProductCategoryEditModel categoryList = new ProductCategoryEditModel();
            string connetionString = null;
            SqlConnection con;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_getProductDatabyId]", con))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {

                        dbTrade.Id = reader.GetInt32(reader.GetOrdinal("id"));
                        dbTrade.Name = reader.IsDBNull(reader.GetOrdinal("Name")) ? null : reader.GetString(reader.GetOrdinal("Name"));
                        dbTrade.description = reader.IsDBNull(reader.GetOrdinal("Description")) ? null : reader.GetString(reader.GetOrdinal("Description"));
                        dbTrade.Quantity = reader.GetInt32(reader.GetOrdinal("Quantity"));
                        dbTrade.Price = reader.GetDecimal(reader.GetOrdinal("Price"));
                        dbTrade.isActive = reader.GetBoolean(reader.GetOrdinal("isActive"));
                        dbTrade.ImageUrl = reader.IsDBNull(reader.GetOrdinal("ImageUrl")) ? null : reader.GetString(reader.GetOrdinal("ImageUrl"));


                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                reader.NextResult();
                while (reader.Read())
                {
                    try
                    {

                        dbTradeList.Add(new DropDownList
                        {
                            Key = reader.GetInt32(reader.GetOrdinal("KEYId")),
                            Value = reader.IsDBNull(reader.GetOrdinal("Text")) ? null : reader.GetString(reader.GetOrdinal("Text")),

                        });

                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }


                reader.Close();
                con.Close();
            }

            categoryList.dbTrade = dbTrade;
            categoryList.dbTradeList = dbTradeList;


            return categoryList;

        }

       public  IEnumerable<DropDownList> GetQuestionType(int userid)
        {
            List<DropDownList> dbTradeList = new List<DropDownList>();
            string connetionString = null;
            SqlConnection con;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_getQuestionTypeList]", con))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@UserId", userid);
                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {
                        dbTradeList.Add(new DropDownList
                        {
                            Key = reader.GetInt32(reader.GetOrdinal("KEYId")),
                            Value = reader.IsDBNull(reader.GetOrdinal("Text")) ? null : reader.GetString(reader.GetOrdinal("Text")),
                           
                        });
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                reader.Close();
                con.Close();
            }

            return dbTradeList;
        }

        public IEnumerable<PaperViewModel> GetPaperList(int userId, int GetValue, int skipValue, int statusType)
        {
            List<PaperViewModel> dbTradeList = new List<PaperViewModel>();
            string connetionString = null;
            SqlConnection con;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            using (SqlCommand Cmd = new SqlCommand("[dbo].[get_Question_list]", con))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
             //   Cmd.Parameters.AddWithValue("@UserId", userId);
               // Cmd.Parameters.AddWithValue("@skipValue", skipValue);
               // Cmd.Parameters.AddWithValue("@GetValue", GetValue);
                Cmd.Parameters.AddWithValue("@PaperType", statusType);
                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {
                        dbTradeList.Add(new PaperViewModel
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            Name = reader.IsDBNull(reader.GetOrdinal("PName")) ? null : reader.GetString(reader.GetOrdinal("PName")),
                           // qustinonLink = reader.IsDBNull(reader.GetOrdinal("qustinonLink")) ? null : reader.GetString(reader.GetOrdinal("qustinonLink")),
                           //// AnswerLink = reader.IsDBNull(reader.GetOrdinal("AnswerLink")) ? null : reader.GetString(reader.GetOrdinal("AnswerLink")),
                            //time = reader.IsDBNull(reader.GetOrdinal("Yeasr")) ? null : reader.GetString(reader.GetOrdinal("Yeasr")),
                            isActive = reader.GetBoolean(reader.GetOrdinal("isActive")),
                 
                            
                        });
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                reader.Close();
                con.Close();
            }

            return dbTradeList;
        }

        public IEnumerable<DropDownList> GetAllPaperList(string userid)
        {
            List<DropDownList> dbTradeList = new List<DropDownList>();
            string connetionString = null;
            SqlConnection con;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_getPaperTypeList]", con))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@UserId", userid);
                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {
                        dbTradeList.Add(new DropDownList
                        {
                            Key = reader.GetInt32(reader.GetOrdinal("KEYId")),
                            Value = reader.IsDBNull(reader.GetOrdinal("Text")) ? null : reader.GetString(reader.GetOrdinal("Text")),

                        });
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                reader.Close();
                con.Close();
            }

            return dbTradeList;
        }

        public int SavePaperSeries(PaperViewModel model)
        {
            int status = 0;
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_PaperSeries]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@Paper", model.Paper);
                    Cmd.Parameters.AddWithValue("@time", model.time);
                    Cmd.Parameters.AddWithValue("@Userid", model.Userid);
                    Cmd.Parameters.AddWithValue("@description", model.description);
                    Cmd.Parameters.AddWithValue("@questionUrl", model.questionUrl);
                    Cmd.Parameters.AddWithValue("@answerurl", model.answerurl);
                    Cmd.Parameters.AddWithValue("@paperType", model.paperType);
                    Cmd.Parameters.Add("@Status", SqlDbType.Int).Direction = ParameterDirection.Output;
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    status = Convert.ToInt32(Cmd.Parameters["@Status"].Value);

                    reader.Close();
                    con.Close();

                }

            }
            catch (Exception ex)
            {
                //return (int)(CreateUser.Failed);
            }
            return status;
        }

        public IEnumerable<PaperViewModel> GetPaperAllList(int userId, int GetValue, int skipValue, int statusType)
        {
            List<PaperViewModel> dbTradeList = new List<PaperViewModel>();
            string connetionString = null;
            SqlConnection con;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_getPaperSeries]", con))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@UserId", userId);
                Cmd.Parameters.AddWithValue("@skipValue", skipValue);
                Cmd.Parameters.AddWithValue("@GetValue", GetValue);
                Cmd.Parameters.AddWithValue("@statusType", statusType);
                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {
                        dbTradeList.Add(new PaperViewModel
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            Paper = reader.IsDBNull(reader.GetOrdinal("Name")) ? null : reader.GetString(reader.GetOrdinal("Name")),
                            questionUrl = reader.IsDBNull(reader.GetOrdinal("qustinonLink")) ? null : reader.GetString(reader.GetOrdinal("qustinonLink")),
                            time = reader.IsDBNull(reader.GetOrdinal("Yeasr")) ? null : reader.GetString(reader.GetOrdinal("Yeasr")),
                            PaperTypeStr = reader.IsDBNull(reader.GetOrdinal("SubjectText")) ? null : reader.GetString(reader.GetOrdinal("SubjectText")),
                            isActive = reader.GetBoolean(reader.GetOrdinal("isActive")),
                            

                        });
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                reader.Close();
                con.Close();
            }

            return dbTradeList;
        }

        public IEnumerable<ProductCategory> GetProductCategoryList(int userId, int GetValue, int skipValue)
        {
            List<ProductCategory> dbTradeList = new List<ProductCategory>();
            string connetionString = null;
            SqlConnection con;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_getProductcategoryList]", con))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@UserId", userId);
                Cmd.Parameters.AddWithValue("@skipValue", skipValue);
                Cmd.Parameters.AddWithValue("@GetValue", GetValue);
               
                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {
                        dbTradeList.Add(new ProductCategory
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            Name = reader.IsDBNull(reader.GetOrdinal("Name")) ? null : reader.GetString(reader.GetOrdinal("Name")),
                            CreatedBy = reader.IsDBNull(reader.GetOrdinal("UserName")) ? null : reader.GetString(reader.GetOrdinal("UserName")),
                            createdTime = reader.GetDateTime(reader.GetOrdinal("CreatedDate")),
                            //PaperTypeStr = reader.IsDBNull(reader.GetOrdinal("SubjectText")) ? null : reader.GetString(reader.GetOrdinal("SubjectText")),
                            isActive = reader.GetBoolean(reader.GetOrdinal("isActive")),


                        });
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                reader.Close();
                con.Close();
            }

            return dbTradeList;
        }

        public int saveProductCategory(ProductCategory model)
        {
            int status = 0;
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[save_ProductCtaegory]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@Id", model.Id);
                    Cmd.Parameters.AddWithValue("@Name", model.Name);
                    Cmd.Parameters.AddWithValue("@Userid", model.Userid);
                    Cmd.Parameters.AddWithValue("@description", model.description);
                    Cmd.Parameters.AddWithValue("@isActive", model.isActive);
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    status = 1;

                    reader.Close();
                    con.Close();

                }

            }
            catch (Exception ex)
            {
                status = 0;


                //return (int)(CreateUser.Failed);
            }
            return status;
        }
    }
}
; 
