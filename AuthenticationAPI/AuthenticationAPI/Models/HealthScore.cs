using System;
using System.Collections.Generic;

namespace AuthenticationAPI.Models
{
    public partial class HealthScore
    {
        public int? Cid { get; set; }
        public int HealthNo { get; set; }
        public int? Count { get; set; }
        public int? WellnessScore { get; set; }

        public virtual Customer? CidNavigation { get; set; }
    }
}
