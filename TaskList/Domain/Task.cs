using System;

namespace TaskList.Domain
{
    public class Task
    {
        public int Id { get; set; }
        public DateTime AddedOn { get; set; }
        public string Description { get; set; }
        public bool IsComplete { get; private set; }
        public void MarkAsComplete()
        {
            IsComplete = true;
        }
        public void MarkAsIncomplete()
        {
            IsComplete = false;
        }
    }
}
