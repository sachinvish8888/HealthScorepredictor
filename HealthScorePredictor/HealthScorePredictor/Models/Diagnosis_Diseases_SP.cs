namespace HealthScorePredictor.Models
{
    public class Diagnosis_Diseases_SP
    {
        public int CustomerId { get; set; }

        public float Pulse { get; set; }

        public float Hbp { get; set; }

        public float Lbp { get; set; }

        public float Hemoglobin { get; set; }

        public float Hba1cFbs { get; set; }

        public float Cholesterol { get; set; }

        public float Creatinine { get; set; }

        public float Sgpt { get; set; }

        public string EcgTmt { get; set; } = null!;

        public string Mer { get; set; } = null!;

        public float Bmi { get; set; }

        public float Esr { get; set; }

        //public string? Diabetic { get; set; }

        //public string? Obes { get; set; }

        //public string? Kidney { get; set; }

        //public string? Anaemia { get; set; }

        //public string? Cardiac { get; set; }
    }
}
