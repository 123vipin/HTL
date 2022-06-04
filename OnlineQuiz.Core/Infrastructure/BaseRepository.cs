using Microsoft.EntityFrameworkCore;
using KaysthaMatrimoneySite.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using KaysthaMatrimoneySite.Core.DataContext;
using System.Linq;
using Microsoft.EntityFrameworkCore.Metadata;


namespace KaysthaMatrimoneySite.Core.Infrastructure
{
    public class BaseRepository<T> : IBaseRepository<T> where T : class
    {
        DbSet<T> _dbSet;
        KaysthMatrimoneyContext _context;
        public BaseRepository(KaysthMatrimoneyContext context)
        {
            _context = context;
            _dbSet = context.Set<T>();
        }
        public virtual T Get(long id)
        {
            try
            {

                return dbset.Find(id);
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public virtual T Get(int id)
        {
            try
            {

                return dbset.Find(id);
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public List<T> GetAll()
        {
            try
            {
                return dbset.ToList();

            }
            catch (Exception exception)
            {
                throw exception;
            }

        }


        public void Insert(T obj)
        {
            if (obj == null)
                throw new ArgumentNullException(nameof(obj));
            try
            {
                dbset.Add(obj);
                _context.SaveChanges();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }
      

        public void Update(T obj)
        {
            if (obj == null)
                throw new ArgumentNullException(nameof(obj));
            try
            {
                dbset.Update(obj);
                _context.SaveChanges();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }
        public void Delete(T obj)
        {
            if (obj == null)
                throw new ArgumentNullException(nameof(obj));

            try
            {
                dbset.Remove(obj);
                _context.SaveChanges();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public List<T> GetAll(Expression<Func<T, bool>> whereCondition)
        {
            try
            {
                return dbset.Where(whereCondition).ToList();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public List<T> GetAllWithIncludes(Expression<Func<T, bool>> whereCondition)
        {
            try
            {
                return dbset.Where(whereCondition).Include("BookMakers").ToList();
            }
            catch (Exception exception)
            {
                throw exception;
            }

        }

        public virtual IQueryable<T> Table => dbset;

        protected virtual DbSet<T> dbset
        {
            get
            {
                if (_dbSet == null)
                    _dbSet = _context.Set<T>();

                return _dbSet;
            }
        }

    }
}
