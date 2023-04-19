using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace HealthScorePredictor.Models;

public partial class HealthScorePredictorContext : DbContext
{
    public HealthScorePredictorContext()
    {
    }

    public HealthScorePredictorContext(DbContextOptions<HealthScorePredictorContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Diagnosis> Diagnoses { get; set; }

    public virtual DbSet<Disease> Diseases { get; set; }

    public virtual DbSet<HealthScore> HealthScores { get; set; }

    public virtual DbSet<CustomerParameters> CustomerParameters { get; set; }

    public virtual DbSet<Diagnosis_Diseases_SP> Diagnosis_Diseases_SPs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=PSL-3F527L3\\SQLEXPRESS;Initial Catalog=HealthScorePredictor;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.CustomerId).HasName("PK__Customer__A4AE64D8DC595B53");

            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(200);
            entity.Property(e => e.FirstName).HasMaxLength(100);
            entity.Property(e => e.Gender)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.LastName).HasMaxLength(100);
            entity.Property(e => e.Password).HasMaxLength(100);
        });

        modelBuilder.Entity<Diagnosis>(entity =>
        {
            entity.HasKey(e => e.CustomerId).HasName("PK__Diagnose__A4AE64D8D9D3693A");

            entity.Property(e => e.CustomerId).ValueGeneratedNever();
            entity.Property(e => e.Bmi).HasColumnName("BMI");
            entity.Property(e => e.EcgTmt).HasColumnName("ECG_TMT");
            entity.Property(e => e.Esr).HasColumnName("ESR");
            entity.Property(e => e.Hba1cFbs).HasColumnName("HBA1C_FBS");
            entity.Property(e => e.Hbp).HasColumnName("HBP");
            entity.Property(e => e.Lbp).HasColumnName("LBP");
            entity.Property(e => e.Mer).HasColumnName("MER");
            entity.Property(e => e.Sgpt).HasColumnName("SGPT");

            entity.HasOne(d => d.Customer).WithOne(p => p.Diagnosis)
                .HasForeignKey<Diagnosis>(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Diagnoses__Custo__276EDEB3");
        });

        modelBuilder.Entity<Disease>(entity =>
        {
            entity.HasKey(e => e.CustomerId).HasName("PK__Disease__A4AE64D861D30D2F");

            entity.ToTable("Disease");

            entity.Property(e => e.CustomerId).ValueGeneratedNever();
            entity.Property(e => e.Anaemia).HasMaxLength(100);
            entity.Property(e => e.Cardiac).HasMaxLength(100);
            entity.Property(e => e.Diabetic).HasMaxLength(100);
            entity.Property(e => e.Kidney).HasMaxLength(100);
            entity.Property(e => e.Obes).HasMaxLength(100);

            entity.HasOne(d => d.Customer).WithOne(p => p.Disease)
                .HasForeignKey<Disease>(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Disease__Custome__2A4B4B5E");
        });

        modelBuilder.Entity<HealthScore>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("HealthScore");

            entity.Property(e => e.Cid).HasColumnName("CId");
            entity.Property(e => e.HealthNo).ValueGeneratedOnAdd();

            entity.HasOne(d => d.CidNavigation).WithMany()
                .HasForeignKey(d => d.Cid)
                .HasConstraintName("FK__HealthScore__CId__2C3393D0");
        });
        modelBuilder.Entity<CustomerParameters>(entity =>
        {
            entity.HasNoKey();
        }
        );

        modelBuilder.Entity<Diagnosis_Diseases_SP>(entity =>
        {
            entity.HasNoKey();
        }
        );

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
