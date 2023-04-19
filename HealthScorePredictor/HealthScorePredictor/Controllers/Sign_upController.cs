using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HealthScorePredictor.Models;
using Microsoft.AspNetCore.Authorization;

namespace HealthScorePredictor.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Sign_upController : ControllerBase
    {
        private readonly HealthScorePredictorContext _context;

        public Sign_upController(HealthScorePredictorContext context)
        {
            _context = context;
        }

        // GET: api/Customers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Customer>>> GetCustomers()
        {
          if (_context.Customers == null)
          {
              return NotFound();
          }
            return await _context.Customers.ToListAsync();
        }
        [HttpPost]
        public async Task<ActionResult<List<Customer>>> Sign_UP(CustomerParameters customer)
        {
            List<Customer> Task = new List<Customer>();
            try
            {

                //string mailTo = customer.Email + ";// string.Concat("" + customer.Email + "");
                var Output = String.Format(@"Exec Sp_InsertCustomers @FirstName= '" + customer.FirstName + "',@LastName='" + customer.LastName + "' ,@Age= '" + customer.Age + "' ,@Gender='" + customer.Gender + "',@Email='" + customer.Email + "' ,@Password='" + customer.Password + "' "
                    );





                var result = await _context.Database.ExecuteSqlRawAsync(Output);
                _context.SaveChanges();
                Task = _context.Customers.ToList();
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return Task;
        }

        private bool CustomerExists(int id)
        {
            return (_context.Customers?.Any(e => e.CustomerId == id)).GetValueOrDefault();
        }
    }
}
