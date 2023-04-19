using System;
using System.Collections.Generic;

namespace AuthenticationAPI.Models
{
    public partial class Disease
    {
        public int CustomerId { get; set; }
        public string? Diabetic { get; set; }
        public string? Obes { get; set; }
        public string? Kidney { get; set; }
        public string? Anaemia { get; set; }
        public string? Cardiac { get; set; }

        public virtual Customer Customer { get; set; } = null!;
    }
}
