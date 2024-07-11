using System;
using System.Collections.Generic;

namespace WeeklyIRMListApp_NEW.Models;

public partial class Summary
{
    public int SummaryId { get; set; }

    public string SummaryValue { get; set; } = null!;

    public virtual ICollection<Application> Applications { get; set; } = new List<Application>();
}
