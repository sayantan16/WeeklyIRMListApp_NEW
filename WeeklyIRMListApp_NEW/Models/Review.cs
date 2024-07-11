using System;
using System.Collections.Generic;

namespace WeeklyIRMListApp_NEW.Models;

public partial class Review
{
    public int ReviewId { get; set; }

    public string ReviewStatus { get; set; } = null!;

    public virtual ICollection<WeeklyIrmlist> WeeklyIrmlists { get; set; } = new List<WeeklyIrmlist>();
}
