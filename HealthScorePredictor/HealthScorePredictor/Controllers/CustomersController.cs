using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HealthScorePredictor.Models;

namespace HealthScorePredictor.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly HealthScorePredictorContext _context;

        public CustomersController(HealthScorePredictorContext context)
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

        // GET: api/Customers/5
        
        //[HttpPost]
        //public async Task<ActionResult<Customer>> PostCustomer(CustomerParameters customer)
        //{
        //  if (_context.Customers == null)
        //  {
        //      return Problem("Entity set 'HealthScorePredictorContext.Customers'  is null.");
        //  }
        //    _context.Customers.Add(customer);
        //    await _context.SaveChangesAsync();

        //    return CreatedAtAction("GetCustomer", new { id = customer.CustomerId }, customer);
        //}

        
        //private bool CustomerExists(int id)
        //{
        //    return (_context.Customers?.Any(e => e.CustomerId == id)).GetValueOrDefault();
        //}
    }
}
