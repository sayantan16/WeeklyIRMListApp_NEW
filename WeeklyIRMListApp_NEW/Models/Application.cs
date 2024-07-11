using System;
using System.Collections.Generic;

namespace WeeklyIRMListApp_NEW.Models;

public partial class Application
{
    public int AppId { get; set; }

    public string Application1 { get; set; } = null!;

    public int? AppSummary { get; set; }

    public virtual Summary? AppSummaryNavigation { get; set; }

    public virtual ICollection<WeeklyIrmlist> WeeklyIrmlists { get; set; } = new List<WeeklyIrmlist>();
}
