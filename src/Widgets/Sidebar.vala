/** 
 * Sidebar.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */

namespace Yatla
{
	public class Sidebar : Granite.Widgets.SourceList
	{
		public GLib.List<Yatla.List> sidebar_list;

		public Sidebar ()
		{
			sidebar_list = new GLib.List<Yatla.List> ();
			// make smth beautiful in css
		}

		public void add_list (Yatla.List list)
		{
			var new_list = new SidebarItem (list.name, list.size);
			root.add (new_list);
		}

		public void add_task (Yatla.Database database, string list_name, Yatla.Task task)
		{
            var list_index = 0;
			foreach (Yatla.List list in sidebar_list)
            {  
            	if (list.name == list_name)		break;
            	list_index++;
			}

			task.id = database.get_task_id (task.name, list_name);
			sidebar_list.nth_data (list_index).tasks.append (task);
			
            foreach (Granite.Widgets.SourceList.Item item in root.children)
            {   if (item.name == list_name)
            	{
					if (item.badge == null)		item.badge = "1";
					else 						item.badge = (int.parse(item.badge) + 1).to_string ();  
            	}		
            }
		}

		public void update_task (string list_name, Yatla.Task task_to_update)
		{
			var list_index = 0;
			foreach (Yatla.List list in sidebar_list)
            {  
            	if (list.name == list_name)		break;
            	list_index++;
			}

			foreach (Yatla.Task task in sidebar_list.nth_data (list_index).tasks)
            {
            	if (task.id == task_to_update.id)
            	{
            		task.name    = task_to_update.name;
            		task.note    = task_to_update.note;
            		task.date    = task_to_update.date;
            		task.is_done = task_to_update.is_done;
            	}
            } 
		}

		public void remove_task (string list_name, Yatla.Task task_to_remove)
		{
			var list_index = 0;
			foreach (Yatla.List list in sidebar_list)
            {  
            	if (list.name == list_name)		break;
            	list_index++;
			}

			foreach (Yatla.Task task in sidebar_list.nth_data (list_index).tasks)
            {
            	if (task.id == task_to_remove.id)
            	{
            		sidebar_list.nth_data (list_index).tasks.remove (task_to_remove);
            		break;
            	}
            }

			foreach (Granite.Widgets.SourceList.Item item in root.children)
            {   if (item.name == list_name)
            	{
					if (item.badge == "1")		item.badge = null;
					else 						item.badge = (int.parse(item.badge) - 1).to_string ();  
            	}		
            }            
		}

		public void update_list (Yatla.Task[] tasks, string list_name)
		{
			var list_index = 0;
			foreach (Yatla.List list in sidebar_list)
            {  
            	if (list.name == list_name)		break;
            	list_index++;
			}

			for (uint task_index = 0; task_index < tasks.length; task_index++) 
			{
				sidebar_list.nth_data (list_index).tasks.nth_data (task_index).name    = tasks[task_index].name;
				sidebar_list.nth_data (list_index).tasks.nth_data (task_index).note    = tasks[task_index].note;
				sidebar_list.nth_data (list_index).tasks.nth_data (task_index).date    = tasks[task_index].date;
				sidebar_list.nth_data (list_index).tasks.nth_data (task_index).is_done = tasks[task_index].is_done;
			}
		}
	}

	public class SidebarItem : Granite.Widgets.SourceList.Item
	{
		public SidebarItem (string name, uint badge = 0)
		{
			base (name);
			this.editable = true;
			this.badge = (badge > 0) ? badge.to_string () : null;
		}
	}
}