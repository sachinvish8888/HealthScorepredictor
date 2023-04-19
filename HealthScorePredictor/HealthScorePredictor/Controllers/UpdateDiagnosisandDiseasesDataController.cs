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
    public class UpdateDiagnosisandDiseasesDataController : ControllerBase
    {
        private readonly HealthScorePredictorContext _context;

        public UpdateDiagnosisandDiseasesDataController(HealthScorePredictorContext context)
        {
            _context = context;
        }

        // GET: api/Diagnoses1


        // PUT: api/Diagnoses1/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut]
        public async Task<ActionResult<HealthScore>> PutDiagnosis(Diagnosis_Diseases_SP diagnosis)
        {
            List<HealthScore> Task = new List<HealthScore>();
            try
            {
                var Output = String.Format("Exec SpDiagnosesUpdateDataByPdf @CustomerId={0},@Pulse={1},@HBP={2},@LBP={3},@Hemoglobin={4},@HBA1C_FBS={5},@Cholesterol={6},@Creatinine={7},@SGPT={8},@ECG_TMT={9},@MER={10},@BMI={11},@ESR={12}",
                    diagnosis.CustomerId, diagnosis.Pulse, diagnosis.Hbp, diagnosis.Lbp, diagnosis.Hemoglobin, diagnosis.Hba1cFbs, diagnosis.Cholesterol, diagnosis.Creatinine, diagnosis.Sgpt, diagnosis.EcgTmt, diagnosis.Mer, diagnosis.Bmi, diagnosis.Esr);

                var res = await _context.Database.ExecuteSqlRawAsync(Output);
                //var Output = String.Format("Exec SP_UpdateRepostDetails @CustomerId={0},@Pulse={1},@HBP={2},@LBP={3},@Hemoglobin={4},@HBA1C_FBS={5},@Cholesterol={6},@Creatinine={7},@SGPT={8},@ECG_TMT={9},@MER={10},@BMI={11},@ESR={12},@Diabetic={13},@Obes={14},@Kidney={15},@Anaemia={16},@Cardiac={17}",
                //    diagnosis.CustomerId, diagnosis.Pulse, diagnosis.Hbp, diagnosis.Lbp, diagnosis.Hemoglobin, diagnosis.Hba1cFbs, diagnosis.Cholesterol, diagnosis.Creatinine, diagnosis.Sgpt, diagnosis.EcgTmt, diagnosis.Mer, diagnosis.Bmi, diagnosis.Esr, diagnosis.Diabetic, diagnosis.Obes, diagnosis.Kidney, diagnosis.Anaemia, diagnosis.Cardiac);
                //var result = await _context.Database.ExecuteSqlRawAsync(Output);


                //var Out = String.Format("exec Sp_Report @CustomerId={0}", diagnosis.CustomerId);

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

       

        private bool DiagnosisExists(int id)
        {
            return (_context.Diagnoses?.Any(e => e.CustomerId == id)).GetValueOrDefault();
        }
    }
}
