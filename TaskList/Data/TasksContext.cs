using Microsoft.EntityFrameworkCore;

namespace TaskList.Data;

public class TasksContext : DbContext
{
    public TasksContext(DbContextOptions<TasksContext> options) : base(options)
    {
    }

    public DbSet<Domain.Task> Tasks { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Domain.Task>()
            .ToTable("Task");
    }
}
