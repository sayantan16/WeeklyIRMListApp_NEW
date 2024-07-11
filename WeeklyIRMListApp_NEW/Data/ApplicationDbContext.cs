using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
using WeeklyIRMListApp_NEW.Models;
using WeeklyIRMListApp_NEW.Models.ModelDTO;

namespace WeeklyIRMListApp_NEW.Data
{
    public class ApplicationDbContext : DbContext
    {

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
            
        }

        public virtual DbSet<Application> Applications { get; set; }

        public virtual DbSet<Build> Builds { get; set; }

        public virtual DbSet<Issue> Issues { get; set; }

        public virtual DbSet<Review> Reviews { get; set; }

        public virtual DbSet<Status> Statuses { get; set; }

        public virtual DbSet<Summary> Summaries { get; set; }

        public virtual DbSet<User> Users { get; set; }

        public virtual DbSet<WeeklyIrmlist> WeeklyIrmlists { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Application>(entity =>
            {
                entity.HasKey(e => e.AppId).HasName("PK__Applicat__8E2CF7F94C5C37C7");

                entity.Property(e => e.AppId).ValueGeneratedNever();
                entity.Property(e => e.Application1)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Application");

                entity.HasOne(d => d.AppSummaryNavigation).WithMany(p => p.Applications)
                    .HasForeignKey(d => d.AppSummary)
                    .HasConstraintName("FK__Applicati__AppSu__3E52440B");
            });

            modelBuilder.Entity<Build>(entity =>
            {
                entity.HasKey(e => e.BuildId).HasName("PK__Builds__C5105141C17F048B");

                entity.Property(e => e.BuildId).ValueGeneratedNever();
                entity.Property(e => e.BuildType)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Issue>(entity =>
            {
                entity.HasKey(e => e.IssueId).HasName("PK__Issues__6C861604CEBDCAC7");

                entity.Property(e => e.IssueId).ValueGeneratedNever();
                entity.Property(e => e.IssueType)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Review>(entity =>
            {
                entity.HasKey(e => e.ReviewId).HasName("PK__Reviews__74BC79CE1FBAC63C");

                entity.Property(e => e.ReviewId).ValueGeneratedNever();
                entity.Property(e => e.ReviewStatus)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Status>(entity =>
            {
                entity.HasKey(e => e.StatusId).HasName("PK__Status__C8EE2063682527AF");

                entity.ToTable("Status");

                entity.Property(e => e.StatusId).ValueGeneratedNever();
                entity.Property(e => e.StatusVal)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Summary>(entity =>
            {
                entity.HasKey(e => e.SummaryId).HasName("PK__Summarie__DAB10E2FB6054A31");

                entity.Property(e => e.SummaryId).ValueGeneratedNever();
                entity.Property(e => e.SummaryValue)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.UserId).HasName("PK__Users__1788CC4C6F5579C1");

                entity.Property(e => e.UserId).ValueGeneratedNever();
                entity.Property(e => e.UserFirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.UserLastName)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<WeeklyIrmlist>(entity =>
            {
                entity.HasKey(e => e.Key).HasName("PK__WeeklyIR__C41E0288A6E5BA0F");

                entity.ToTable("WeeklyIRMList");

                entity.Property(e => e.Key)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.ChangeTicket)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.Created).HasColumnType("datetime");
                entity.Property(e => e.ElevatedPermission)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.MiddlewareTask)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.PrerequisiteTicket)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.Remarks).IsUnicode(false);
                entity.Property(e => e.StartDateTime).HasColumnType("datetime");
                entity.Property(e => e.TargetEndDateTime).HasColumnType("datetime");

                entity.HasOne(d => d.ApplicationsNavigation).WithMany(p => p.WeeklyIrmlists)
                    .HasForeignKey(d => d.Applications)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__WeeklyIRM__Appli__6383C8BA");

                entity.HasOne(d => d.BuildTypeNavigation).WithMany(p => p.WeeklyIrmlists)
                    .HasForeignKey(d => d.BuildType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__WeeklyIRM__Build__6754599E");

                entity.HasOne(d => d.IssueTypeNavigation).WithMany(p => p.WeeklyIrmlists)
                    .HasForeignKey(d => d.IssueType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__WeeklyIRM__Issue__628FA481");

                entity.HasOne(d => d.ReporterNavigation).WithMany(p => p.WeeklyIrmlistReporterNavigations)
                    .HasForeignKey(d => d.Reporter)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__WeeklyIRM__Repor__6477ECF3");

                entity.HasOne(d => d.ReviewStatusNavigation).WithMany(p => p.WeeklyIrmlists)
                    .HasForeignKey(d => d.ReviewStatus)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__WeeklyIRM__Revie__66603565");

                entity.HasOne(d => d.StatusNavigation).WithMany(p => p.WeeklyIrmlists)
                    .HasForeignKey(d => d.Status)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__WeeklyIRM__Statu__656C112C");

                entity.HasOne(d => d.TakeoffsOwnerNavigation).WithMany(p => p.WeeklyIrmlistTakeoffsOwnerNavigations)
                    .HasForeignKey(d => d.TakeoffsOwner)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__WeeklyIRM__Takeo__68487DD7");
            });

            modelBuilder.Entity<WeeklyIrmlistDto>(entity =>
            {
                entity.HasNoKey();
                entity.Property(e => e.Key)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.ChangeTicket)
                        .HasMaxLength(50)
                        .IsUnicode(false);
                entity.Property(e => e.Application)
                        .HasMaxLength(50)
                        .IsUnicode(false);
                entity.Property(e => e.Summary)
                        .HasMaxLength(50)
                        .IsUnicode(false);
                entity.Property(e => e.IssueType)
                        .HasMaxLength(50)
                        .IsUnicode(false);
                entity.Property(e => e.Reporter)
                        .HasMaxLength(50)
                        .IsUnicode(false);
                entity.Property(e => e.Status)
                        .HasMaxLength(50)
                        .IsUnicode(false);
                entity.Property(e => e.Created)
                        .HasColumnType("datetime");
                entity.Property(e => e.StartDateTime)
                       .HasColumnType("datetime");
                entity.Property(e => e.TargetEndDateTime)
                       .HasColumnType("datetime");
                entity.Property(e => e.ReviewStatus)
                       .HasMaxLength(50)
                       .IsUnicode(false);
                entity.Property(e => e.PrerequisiteTicket)
                       .HasMaxLength(50)
                       .IsUnicode(false);
                entity.Property(e => e.MiddlewareTask)
                       .HasMaxLength(50)
                       .IsUnicode(false);
                entity.Property(e => e.BuildType)
                       .HasMaxLength(50)
                       .IsUnicode(false);
                entity.Property(e => e.ElevatedPermission)
                      .HasMaxLength(50)
                      .IsUnicode(false);
                entity.Property(e => e.TakeoffsOwner)
                      .HasMaxLength(50)
                      .IsUnicode(false);
                entity.Property(e => e.Remarks)
                      .IsUnicode(false);
                entity.Property(e => e.Flag)
                      .IsUnicode(false);
            });
        }
    }
}
