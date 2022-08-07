using HTL.Data.Models;
using KaysthaMatrimoneySite.Data.ViewModels;
using MailKit.Security;
using MimeKit;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace KaysthaMatrimoneySite.Core.Services
{
    public class EmailSender : IEmailSender
    {
        private readonly EmailConfiguration _emailConfig;
        public EmailSender(EmailConfiguration emailConfig)
        {
            _emailConfig = emailConfig;
        }
        public void SendEmail(UserModel model, string filePath, UserModel userlogin, string updatePasswrdLink)
        {
            System.Net.ServicePointManager.Expect100Continue = false;
            string emailSender = _emailConfig.From;
            string emailSenderPassword = _emailConfig.Password;
            string emailSenderHost = _emailConfig.SmtpServer;
            int emailSenderPort = Convert.ToInt16(_emailConfig.Port);
            Boolean emailIsSSL = Convert.ToBoolean(_emailConfig.emailIsSSL);
            StreamReader str = new StreamReader(filePath);
            string MailText = str.ReadToEnd();
            str.Close();
            MailText = MailText.Replace("[newusername]", model.FirstName);
            MailText = MailText.Replace("[link]", updatePasswrdLink+"/"+ model.UserId);
           
            string subject = "Welcome to Ugc Net online Test Quiz.Com";
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailSender);
                mail.To.Add(model.Email);
                mail.Subject = subject;
                mail.Body = MailText;
                mail.IsBodyHtml = true;
                using (SmtpClient smtp = new SmtpClient(emailSenderHost, emailSenderPort))
                {
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(emailSender, emailSenderPassword);
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }




        }


    }
}

