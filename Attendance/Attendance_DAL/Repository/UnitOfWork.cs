using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Attendance_DAL.DB;

namespace MediClaim_DAL.Repository
{
    public class UnitOfWork
    {

        private readonly AttendanceEntities _context = new AttendanceEntities();

        // Master
        private GenericRepository<Employee> _EmployeeRepository;
        private GenericRepository<RelationType> _RelationTypeRepository;
        private GenericRepository<RelationDetail> _RelationDetailsRepository;
        private GenericRepository<RelationTypeCount> _RelationTypeCountRepository;


        public GenericRepository<Employee> EmployeeRepository
        {
            get
            {
                if (_EmployeeRepository == null)
                    _EmployeeRepository = new GenericRepository<Employee>(_context);
                return _EmployeeRepository;
            }
        }

        public GenericRepository<RelationType> RelationTypeRepository
        {
            get
            {
                if (_RelationTypeRepository == null)
                    _RelationTypeRepository = new GenericRepository<RelationType>(_context);
                return _RelationTypeRepository;
            }
        }

        public GenericRepository<RelationDetail> RelationDetailsRepository
        {
            get
            {
                if (_RelationDetailsRepository == null)
                    _RelationDetailsRepository = new GenericRepository<RelationDetail>(_context);
                return _RelationDetailsRepository;
            }
        }

        public GenericRepository<RelationTypeCount> RelationTypeCountRepository
        {
            get
            {
                if (_RelationTypeCountRepository == null)
                    _RelationTypeCountRepository = new GenericRepository<RelationTypeCount>(_context);
                return _RelationTypeCountRepository;
            }
        }
        // end
        public int Save()
        {
            try
            {

                return _context.SaveChanges();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private bool _disposed;
        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                    _context.Dispose();
            }
            _disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}