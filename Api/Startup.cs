using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using KaysthaMatrimoneySite.Core.DataContext;
using KaysthaMatrimoneySite.Core.Infrastructure;
using KaysthaMatrimoneySite.Core.Services;
using KaysthaMatrimoneySite.Data.ViewModels;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddDbContext<KaysthMatrimoneyContext>(options =>
           options.UseSqlServer(Configuration.GetConnectionString("DbConnectionString")));
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddDistributedMemoryCache();
            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(1);//You can set Time   
                options.Cookie.HttpOnly = true;
                options.Cookie.SameSite = SameSiteMode.Strict;
            });
            var emailConfig = Configuration
        .GetSection("EmailConfiguration")
        .Get<EmailConfiguration>();
            services.AddSingleton(emailConfig);
            services.AddCors(options =>
            {
                options.AddPolicy("MyPolicy",
                    builder => builder.WithOrigins("https://onlinequizappin.azurewebsites.net","https://mygkpower.com","http://mygkpower.com", "http://localhost:4200")
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials());
            });
            //http://localhost:4200

            //https://onlinequizappin.azurewebsites.net/#/

            //services.AddMvc().AddNewtonsoftJson(o =>
            //{
            //    o.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            //});

            services.AddTransient<ILogin, LoginService>();

            services.AddTransient<IEmailSender, EmailSender>();
            services.AddTransient<IQuiz, QuizService>();
            services.AddTransient<IHttpContextAccessor, HttpContextAccessor>();

            services.AddScoped(typeof(IBaseRepository<>), typeof(BaseRepository<>));
            services.Configure<FormOptions>(o =>
            {
                o.ValueLengthLimit = int.MaxValue;
                o.MultipartBodyLengthLimit = int.MaxValue;
                o.MemoryBufferThreshold = int.MaxValue;
            });
            services.AddDirectoryBrowser();
        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseFileServer(enableDirectoryBrowsing: true);

            app.UseDefaultFiles();
            app.UseRouting();
            app.UseCors("MyPolicy");
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
