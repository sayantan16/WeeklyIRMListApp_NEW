using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using WeeklyIRMListApp_NEW.Data;
using WeeklyIRMListApp_NEW.Models.ModelDTO;

namespace WeeklyIRMListApp_NEW.Controllers
{
    public class WeeklyIrmlistController : Controller
    {
        private readonly ApplicationDbContext _context;

        public WeeklyIrmlistController(ApplicationDbContext context)
        {
            _context = context;
        }


        public async Task<IActionResult> Index(DateTime? StartDateTime, DateTime? TargetEndDateTime)
        {
            var result = new List<WeeklyIrmlistDto>();

            if (StartDateTime.HasValue && TargetEndDateTime.HasValue)
            {
                var StartDateParam = new SqlParameter("@startDate", StartDateTime);
                var EndDateParam = new SqlParameter("@endDate", TargetEndDateTime);

                var Sql = "EXEC spWeeklyIRMDateView @startDate, @endDate";


                result = await _context.Set<WeeklyIrmlistDto>().FromSqlRaw(Sql, StartDateParam, EndDateParam).ToListAsync();

            }

            ViewBag.StartDateTime = StartDateTime;
            ViewBag.TargetEndDateTime = TargetEndDateTime;

            return View(result);
        }
    }
}
