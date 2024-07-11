using System;
using System.Collections.Generic;

namespace WeeklyIRMListApp_NEW.Models;

public partial class Status
{
    public int StatusId { get; set; }

    public string StatusVal { get; set; } = null!;

    public virtual ICollection<WeeklyIrmlist> WeeklyIrmlists { get; set; } = new List<WeeklyIrmlist>();
}
