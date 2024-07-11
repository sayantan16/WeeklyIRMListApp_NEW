using System;
using System.Collections.Generic;

namespace WeeklyIRMListApp_NEW.Models;

public partial class User
{
    public int UserId { get; set; }

    public string UserFirstName { get; set; } = null!;

    public string UserLastName { get; set; } = null!;

    public virtual ICollection<WeeklyIrmlist> WeeklyIrmlistReporterNavigations { get; set; } = new List<WeeklyIrmlist>();

    public virtual ICollection<WeeklyIrmlist> WeeklyIrmlistTakeoffsOwnerNavigations { get; set; } = new List<WeeklyIrmlist>();
}
