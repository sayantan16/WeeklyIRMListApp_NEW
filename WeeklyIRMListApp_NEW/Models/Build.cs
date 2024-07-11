using System;
using System.Collections.Generic;

namespace WeeklyIRMListApp_NEW.Models;

public partial class Build
{
    public int BuildId { get; set; }

    public string BuildType { get; set; } = null!;

    public virtual ICollection<WeeklyIrmlist> WeeklyIrmlists { get; set; } = new List<WeeklyIrmlist>();
}
