namespace HealthScorePredictor.Models
{
    public class CustomerParameters
    {
        public string FirstName { get; set; } = null!;

        public string LastName { get; set; } = null!;

        public int? Age { get; set; }

        public string Gender { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }
    }
}
