using System.Data.Entity;

namespace TaskList.Data
{
    public class TasksContext : DbContext
    {
        public TasksContext(string nameOrConnectionString) : base(nameOrConnectionString)
        {
        }

        public DbSet<Domain.Task> Tasks { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Domain.Task>()
                .ToTable("Task");
        }
    }
}