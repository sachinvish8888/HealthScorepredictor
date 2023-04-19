using HealthScorePredictor.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using Microsoft.AspNetCore.Authorization;

namespace HealthScorePredictor.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadPDFController : ControllerBase
    {
        private readonly HealthScorePredictorContext _context;

        public UploadPDFController(HealthScorePredictorContext context)
        {
            _context = context;
        }

        [HttpPost]
        //[Authorize]
        public async Task<ActionResult<HealthScore>> PostDiagnosis(IFormFile file,int a)
        {
            List<HealthScore> Task = new List<HealthScore>();
            try
            {
                var lines = await ReadPdf(file);

                List<LabReportData> labData = new List<LabReportData>();
                LabPersonalData data = new LabPersonalData();
                LabData obj = new LabData();
                string[] name = lines[0].ToString().Split(" Lab");
                data.Name = name[0].ToString();
                string[] ages = lines[2].Split(":");
                data.Age = ages[1];
                data.DOB = lines[1].ToString();
                data.Gender = "";
                for (int i = 4; i <= lines.Length - 1; i++)
                {

                    if (i != 57)
                    {
                        string pattern = @"(\D+)([\d\.]+)([\d\.]+)";
                        var regaxData = Regex.Match(lines[i], pattern, RegexOptions.IgnoreCase);
                        var orignalData = regaxData.ToString().Replace("- ", "-");
                        if (regaxData.Success)
                        {
                            Regex re = new Regex(@"(\D+)([\d\.]+)([\d\.]+)");
                            Match result = re.Match(orignalData.ToString());
                            string alphaPart = result.Groups[1].Value;
                            string numberPart = result.Groups[2].Value + result.Groups[3].Value;
                            string[] str = orignalData.ToString().Trim().Split(" ");
                            if (str.Count() >= 2)
                            {
                                labData.Add(new LabReportData { parameter = alphaPart, result = numberPart });
                            }

                        }
                    }
                    else
                    {
                        string[] str1 = lines[57].ToString().Split(" ");
                        labData.Add(new LabReportData { parameter = str1[0] + " " + str1[1], result = str1[2] });
                    }





                }
                //var splitLines = lines.Select(l => l.Split(new[] { "\n" }, StringSplitOptions.RemoveEmptyEntries)).ToArray();



                List<LabReportData> labDataResponse = new List<LabReportData>();
                DiagDataModel diagDataModel = new DiagDataModel();



                //Iterate on labData
                foreach (var item in labData)
                {
                    if (item.parameter.Trim().Equals("Hemoglobin"))
                    {
                        diagDataModel.Hemoglobin = double.Parse(item.result);
                        labDataResponse.Add(item);
                    }
                    if (item.parameter.Trim().Equals("BLOOD PRESSURE"))
                    {
                        diagDataModel.bloodPressure = item.result;
                        string[] str = diagDataModel.bloodPressure.Split("/");
                        diagDataModel.HBP = int.Parse(str[0]);
                        diagDataModel.LBP = int.Parse(str[1]);
                        labDataResponse.Add(item);

                    }
                    if (item.parameter.Trim().Equals("Eosinophils"))
                    {
                        diagDataModel.HBA1C_FBS = double.Parse(item.result);
                        labDataResponse.Add(item);
                    }


                }

                //database diagDataModel


                obj.LabReports = labDataResponse;
                obj.personalDetails = data;





                //SpDiagnosesUpdateDataByPdf
                //SpDiagnosesInsert

                var Output = String.Format("Exec  SpDiagnosesUpdateDataByPdf @CustomerId={0},@Pulse={1},@HBP={2},@LBP={3},@Hemoglobin={4},@HBA1C_FBS={5},@Cholesterol={6},@Creatinine={7},@SGPT={8},@ECG_TMT={9},@MER={10},@BMI={11},@ESR={12}",
                    a, 92, diagDataModel.HBP, diagDataModel.LBP, diagDataModel.Hemoglobin, diagDataModel.HBA1C_FBS, 138, 0.7, 1,"1", "1", 23.17, 1);
                var res = await _context.Database.ExecuteSqlRawAsync(Output);


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

        public class LabReportData
        {

            public string parameter { get; set; }
            public string result { get; set; }
        }

        public class LabPersonalData
        {

            public string Name { get; set; }
            public string Age { get; set; }
            public string DOB { get; set; }
            public string Gender { get; set; }


        }
        public class LabData
        {
            public LabPersonalData personalDetails { get; set; }
            public List<LabReportData> LabReports { get; set; }

        }

        public class DiagDataModel
        {
            public double Hemoglobin { get; set; }
            public string bloodPressure { get; set; }

            public int HBP { get; set; }

            public int LBP { get; set; }

            public double HBA1C_FBS { get; set; }
        }

        public class PdfResult
        {
            public string Text { get; set; }
        }
        private async Task<string[]> ReadPdf(IFormFile file)
        {
            using (var stream = file.OpenReadStream())
            {
                using (var reader = new PdfReader(stream))
                {
                    var lines = new List<string>();
                    string text = "";
                    for (var i = 1; i <= reader.NumberOfPages; i++)
                    {
                        text = PdfTextExtractor.GetTextFromPage(reader, i);
                        var pageLines = text.Split('\n');
                        //foreach (var item in pageLines)
                        //{
                        //    lines.Add(item);
                        //    }
                        if (i == 1)
                        {
                            lines.Add(pageLines[0]);
                            lines.Add(pageLines[1]);
                            lines.Add(pageLines[3]);
                            lines.Add(pageLines[5]);
                            for (int j = 15; j < 60; j++)
                            {
                                lines.Add(pageLines[j]);



                            }
                        }
                        if (i == 2)
                        {
                            lines.Add(pageLines[15]);
                            lines.Add(pageLines[27]);
                            lines.Add(pageLines[35]);

                        }
                        if (i == 3)
                        {
                            lines.Add(pageLines[15]);
                            lines.Add(pageLines[27]);
                            lines.Add(pageLines[21]);
                            lines.Add(pageLines[20]);

                        }
                        if (i == 4)
                        {
                            lines.Add(pageLines[17]);
                            lines.Add(pageLines[21]);

                        }
                        //if (i == 2)
                        //{
                        //    lines.Add(pageLines[14]);
                        //}
                        //if (i == 3)
                        //{
                        //    lines.Add(pageLines[15]);
                        //    lines.Add(pageLines[34]);
                        //    lines.Add(pageLines[2]);
                        //}

                    }

                    //var pageLines = text.Split('\n');
                    //foreach (var item in pageLines)
                    //{
                    //    lines.Add(item);
                    //}

                    return lines.ToArray();
                }
            }
        }
    }
}


