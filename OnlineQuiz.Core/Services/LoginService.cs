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
using KaysthaMatrimoneySite.Data.LoginEnum;
using HTL.Data.Models;
using OnlineQuiz.Data.ViewModels;

namespace KaysthaMatrimoneySite.Core.Services
{
    public class LoginService : ILogin
    {
        IBaseRepository<TbL_User> _userRepo;

        IConfiguration _config;
        private static readonly int MaxSaltLength = 32;

        public LoginService(IBaseRepository<TbL_User> userRepo,
            IConfiguration config)
        {
            _userRepo = userRepo;

            _config = config;
        }

        public DashBoardViewModel GetAllDashBoardRecord(int Userid)
        {
            DashBoardViewModel dbTrade = new DashBoardViewModel();
                string connetionString = null;
                SqlConnection con;
                connetionString = _config.GetConnectionString("DbConnectionString");
                con = new SqlConnection(connetionString);
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_getDashBardDetails]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@userid", Userid);
                 
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        try
                        {

                            dbTrade.TotalLeft = reader.GetInt32(reader.GetOrdinal("TotalLeft"));
                            dbTrade.Attempt = reader.GetInt32(reader.GetOrdinal("Attempt"));

                    }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                    }
                    reader.Close();
                    con.Close();
                }
                return dbTrade;
            
        }

        public Login Login(Login userlogin)
        {

            var decraptedPassword = "";
            Login loginUser = new Login();
        
            var result = _userRepo.GetAll(a => a.UserName.ToLower() == userlogin.UserName.ToLower()).FirstOrDefault();

            if (result != null && result.IsActive == false)
            {
                loginUser.Status = (int)LoginEnum.AccountInActive; ;
                return loginUser;
            }
            if (result != null)
            {
                try
                {
                  decraptedPassword = Cryptography.Decrypt(result.Password, result.Salt);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                if (decraptedPassword == userlogin.Password)
                {
                    loginUser.Status = (int)(LoginEnum.Success);
                    loginUser.FirstName = result.FirstName + " " + result.LastName;
                    loginUser.UserName = result.UserName;
                    loginUser.LoginId = Convert.ToInt32(result.UserId);
                    loginUser.UserType = 1;
                }
                else
                {
                    loginUser.Status = (int)(LoginEnum.EmailPassWord);
                }
            }
            else
            {
                 loginUser.Status = (int)(LoginEnum.UserNotFound);

            }

            return loginUser;
        }

        public int SaveUser(UserModel model)
        {
            var salt = CreateSalt(16).ToString();
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_saveUser]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@FirstName", model.FirstName);
                    Cmd.Parameters.AddWithValue("@Phone", model.Phone == null ? 0 : model.Phone) ;
                    Cmd.Parameters.AddWithValue("@Email", model.Email);
                    Cmd.Parameters.AddWithValue("@Password", Cryptography.Encrypt(model.Password, salt.ToString()));
                    Cmd.Parameters.AddWithValue("@PassWordSalt", salt.ToString());
                    Cmd.Parameters.AddWithValue("@UserId", model.UserId);
                    Cmd.Parameters.AddWithValue("@RoleId", model.RoleId);
                    Cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;
                    con.Open(); 
                     SqlDataReader reader = Cmd.ExecuteReader();
                    int contractID = Convert.ToInt32(Cmd.Parameters["@status"].Value);
                   
                    reader.Close();
                    con.Close();
                    if (contractID == 1)
                    { return (int)(CreateUser.AlreadyExits); }
                    else { return (int)(CreateUser.Success); }
                }

            }
            catch (Exception ex)
            {
                return (int)(CreateUser.Failed);
            }
            

        }
        public string CreateSalt(int size)
        {
            //Generate a cryptographic random number.
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[size];
            rng.GetBytes(buff);
            return Convert.ToBase64String(buff);
        }

        public UserModel ForgotSendMailPassword(UserModel model)
        {
            UserModel user = new UserModel();
            var result = _userRepo.GetAll(a => a.UserName.ToLower() == model.Email.ToLower()).FirstOrDefault();
            if(result!=null)
            {
                user.FirstName = result.UserName;
                user.UserId = result.UserId;
                user.Email = model.Email;
                return user;
            }
            else
            {
                user.UserId = 0;
                return user;
            }

        }

        public int UpdatePassword(UserPassword model)
        {
            var salt = CreateSalt(16).ToString();
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_updatePassword]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;

                    Cmd.Parameters.AddWithValue("@Password", Cryptography.Encrypt(model.Password, salt.ToString()));
                    Cmd.Parameters.AddWithValue("@PassWordSalt", salt.ToString());
                    Cmd.Parameters.AddWithValue("@Userid", model.UserId);
                    Cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    int contractID = Convert.ToInt32(Cmd.Parameters["@status"].Value);
                    reader.Close();
                    con.Close();
                    if (contractID == 1)
                    { return (int)(CreateUser.Success); }
                    else { return (int)(CreateUser.Failed); }
                }

            }
            catch (Exception ex)
            {
                return (int)(CreateUser.Failed);
            }

        }

        public int SaveSuggestion(UserModel model)
        {
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_feedback]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;

                    Cmd.Parameters.AddWithValue("@Password",model.Password);
                    Cmd.Parameters.AddWithValue("@Userid", model.UserId);
                    Cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    int contractID = Convert.ToInt32(Cmd.Parameters["@status"].Value);
                    reader.Close();
                    con.Close();
                    if (contractID == 1)
                    { return (int)(CreateUser.Success); }
                    else { return (int)(CreateUser.Failed); }
                }

            }
            catch (Exception ex)
            {
                return (int)(CreateUser.Failed);
            }
        }
        public int saveRole(RoleModel model)
        {
           
            SqlConnection con;
            string connetionString = null;
            connetionString = _config.GetConnectionString("DbConnectionString");
            con = new SqlConnection(connetionString);
            try
            {
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_saveRole]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@rolename", model.RoleName);
                    Cmd.Parameters.AddWithValue("@roleId", model.RoleId);
               
                    Cmd.Parameters.AddWithValue("@menuid", model.menuId);
                    Cmd.Parameters.AddWithValue("@UserId", model.UserId);
                    Cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    int contractID = Convert.ToInt32(Cmd.Parameters["@status"].Value);

                    reader.Close();
                    con.Close();
                    if (contractID == 1)
                    { return (int)(CreateUser.AlreadyExits); }
                    else { return (int)(CreateUser.Success); }
                }

            }
            catch (Exception ex)
            {
                return (int)(CreateUser.Failed);
            }
            return 0;

        }

   
            public List<DropDownList> getSideBarList(int userId)
            {

                List<DropDownList> dcategoryList = new List<DropDownList>();

                string connetionString = null;
                SqlConnection con;
                connetionString = _config.GetConnectionString("DbConnectionString");
                con = new SqlConnection(connetionString);
                using (SqlCommand Cmd = new SqlCommand("[dbo].[sp_getsideBarMenu]", con))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId", userId);
                    con.Open();
                    SqlDataReader reader = Cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        try
                        {
                            dcategoryList.Add(new DropDownList
                            {
                                Value = reader.IsDBNull(reader.GetOrdinal("Menu")) ? null : reader.GetString(reader.GetOrdinal("Menu")),
                                urlValue = reader.IsDBNull(reader.GetOrdinal("urlValue")) ? null : reader.GetString(reader.GetOrdinal("urlValue")),
                                iclass = reader.IsDBNull(reader.GetOrdinal("iclass")) ? null : reader.GetString(reader.GetOrdinal("iclass")),
                                Key = reader.GetInt32(reader.GetOrdinal("id")),
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

                return dcategoryList;
            }
      
    }
}
