/**
 * Task.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */

namespace Yatla
{
	public class Task : GLib.Object
	{  
		public  int 		   id      {  get;  set;  }
		public  string         name    {  get;  set;  }
		public  string         note    {  get;  set;  }
		public  GLib.DateTime  date    {  get;  set;  }
		public  bool      	   is_done {  get;  set;  }
	
		public Task (string name, string? note, GLib.DateTime? date, bool is_done = false) 
		{
			this.name    = name;
			this.note    = note;
			this.date    = date;
			this.is_done = is_done;
		}
	}

	public class List : GLib.Object
	{
		public  GLib.List<Task> tasks;
		public  string  name  {  get; set;  }
		public  uint    size  {  get  {  return tasks.length ();  }  }
	
		public List (string name) 
		{
			this.name  = name;
			this.tasks = new GLib.List<Task> ();
		}

		public void add_task (Task task)
		{
			tasks.append (task);
		}
	}
}
