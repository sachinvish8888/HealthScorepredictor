using System;
using System.Collections.Generic;

namespace HealthScorePredictor.Models;

public partial class Customer
{
    public int CustomerId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public int? Age { get; set; }

    public string? Gender { get; set; }

    public string? Email { get; set; }

    public string? Password { get; set; }

    public DateTime? CreatedDate { get; set; }

    public virtual Diagnosis? Diagnosis { get; set; }

    public virtual Disease? Disease { get; set; }
}
