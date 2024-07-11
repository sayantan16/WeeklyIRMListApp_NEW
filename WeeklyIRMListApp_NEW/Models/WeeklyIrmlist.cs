using System;
using System.Collections.Generic;

namespace WeeklyIRMListApp_NEW.Models;

public partial class WeeklyIrmlist
{
    public string Key { get; set; } = null!;

    public string ChangeTicket { get; set; } = null!;

    public int IssueType { get; set; }

    public int Applications { get; set; }

    public int Reporter { get; set; }

    public int Status { get; set; }

    public DateTime Created { get; set; }

    public DateTime StartDateTime { get; set; }

    public DateTime TargetEndDateTime { get; set; }

    public int ReviewStatus { get; set; }

    public string PrerequisiteTicket { get; set; } = null!;

    public string MiddlewareTask { get; set; } = null!;

    public int BuildType { get; set; }

    public string ElevatedPermission { get; set; } = null!;

    public int TakeoffsOwner { get; set; }

    public string Remarks { get; set; } = null!;

    public virtual Application ApplicationsNavigation { get; set; } = null!;

    public virtual Build BuildTypeNavigation { get; set; } = null!;

    public virtual Issue IssueTypeNavigation { get; set; } = null!;

    public virtual User ReporterNavigation { get; set; } = null!;

    public virtual Review ReviewStatusNavigation { get; set; } = null!;

    public virtual Status StatusNavigation { get; set; } = null!;

    public virtual User TakeoffsOwnerNavigation { get; set; } = null!;
}
