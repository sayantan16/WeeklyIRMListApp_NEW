using System;
using System.Collections.Generic;

namespace WeeklyIRMListApp_NEW.Models;

public partial class Issue
{
    public int IssueId { get; set; }

    public string IssueType { get; set; } = null!;

    public virtual ICollection<WeeklyIrmlist> WeeklyIrmlists { get; set; } = new List<WeeklyIrmlist>();
}
