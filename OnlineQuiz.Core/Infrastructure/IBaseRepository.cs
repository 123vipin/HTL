using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using KaysthaMatrimoneySite.Data.Models;

namespace KaysthaMatrimoneySite.Core.Infrastructure
{
    public  interface IBaseRepository<T> where T : class
    {
        T Get(long id);
        T Get(int id);
        List<T> GetAll();
        List<T> GetAll(Expression<Func<T, bool>> whereCondition);
        void Insert(T obj);
        void Update(T obj);
        void Delete(T obj);
        IQueryable<T> Table { get; }
        List<T> GetAllWithIncludes(Expression<Func<T, bool>> whereCondition);
       


    }
}
