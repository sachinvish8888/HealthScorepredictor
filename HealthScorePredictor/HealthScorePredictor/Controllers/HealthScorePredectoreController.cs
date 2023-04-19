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
    public class DiagnosesController : ControllerBase
    {
        private readonly HealthScorePredictorContext _context;

        public DiagnosesController(HealthScorePredictorContext context)
        {
            _context = context;
        }

       // // GET: api/Diagnoses
      
        [HttpGet]
        public async Task<ActionResult<IEnumerable<HealthScore>>> GetDiagnoses()
        {
          if (_context.Diagnoses == null)
          {
              return NotFound();
          }
            return await _context.HealthScores.ToListAsync();
        }
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<HealthScore>> PostDiagnosis(Diagnosis_Diseases_SP diagnosis)
        {
            List<HealthScore> Task = new List<HealthScore>();
            try
            {


                var Output = String.Format("Exec SpDiagnosesUpdateDataByPdf @CustomerId={0},@Pulse={1},@HBP={2},@LBP={3},@Hemoglobin={4},@HBA1C_FBS={5},@Cholesterol={6},@Creatinine={7},@SGPT={8},@ECG_TMT={9},@MER={10},@BMI={11},@ESR={12}",
                    diagnosis.CustomerId, diagnosis.Pulse, diagnosis.Hbp, diagnosis.Lbp, diagnosis.Hemoglobin, diagnosis.Hba1cFbs, diagnosis.Cholesterol, diagnosis.Creatinine, diagnosis.Sgpt, diagnosis.EcgTmt, diagnosis.Mer, diagnosis.Bmi, diagnosis.Esr);

                var res = await _context.Database.ExecuteSqlRawAsync(Output);
                //var Output = String.Format("Exec Sp_DiagnosesDiseaseInsert @CustomerId={0},@Pulse={1},@HBP={2},@LBP={3},@Hemoglobin={4},@HBA1C_FBS={5},@Cholesterol={6},@Creatinine={7},@SGPT={8},@ECG_TMT={9},@MER={10},@BMI={11},@ESR={12},@Diabetic={13},@Obes={14},@Kidney={15},@Anaemia={16},@Cardiac={17}",
                //    diagnosis.CustomerId,diagnosis.Pulse,diagnosis.Hbp,diagnosis.Lbp,diagnosis.Hemoglobin,diagnosis.Hba1cFbs,diagnosis.Cholesterol,diagnosis.Creatinine,diagnosis.Sgpt,diagnosis.EcgTmt,diagnosis.Mer,diagnosis.Bmi,diagnosis.Esr,diagnosis.Diabetic,diagnosis.Obes,diagnosis.Kidney,diagnosis.Anaemia,diagnosis.Cardiac);
                //var result = await _context.Database.ExecuteSqlRawAsync(Output);


                //var Out = String.Format("exec Sp_Report @CustomerId={0}",diagnosis.CustomerId);

                //var res = await _context.Database.ExecuteSqlRawAsync(Out);

                Task = _context.HealthScores.ToList();
                
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            var outcome = Task.Last();
            return outcome;
        }
    }

      
       
}

