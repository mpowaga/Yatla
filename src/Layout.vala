/**
 * Layout.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */
namespace Yatla
{
	public class Layout : Gtk.Layout
	{
		internal  Gtk.Label		  _list_name;
		internal  Gtk.Box 		  _top_box1;
		internal  Gtk.Box   	  _top_box2;
		internal  Gtk.Box 		  _tasks_box;
		internal  Yatla.Database  _database;
		internal  string          _name;

		public  Gtk.Entry  new_task_entry;
		public  Gee.TreeMap<Yatla.Task, Gtk.Box>  tasks;

		public Layout(Yatla.Database database) 
		{
			this._database = database;
			tasks = new Gee.TreeMap<Yatla.Task, Gtk.Box> ((a, b) => 
			{ 
				if (b.id > a.id) 	return -1;
				else 				return  1;  
			});

			/** stuff with css, actually the needed stuff now, I've done with markup, see lower *//*
			var css_stuff = """
			GtkButton:hover 
			{
			}
			""";
			var provider = new Gtk.CssProvider ();

			try 
			{
				provider.load_from_data (css_stuff, css_stuff.length);
				Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
			} 
			catch (Error e) 
			{
				stderr.printf ("Error: %s\n", e.message);
			}*/
		}

		/**
		 * @brief   load layout
		 * @details load layout depending on which list
		 *          was pressed (depending on list_name)
		 * 
		 * @param sidebar   : load data from the sidebar_list
		 * @param list_name : name of the list, which
		 *                       was selected
		 * 
		 * @return true  : if layout was loaded successfully
		 *         false : if layout wasn't loaded successfully
		 */
		public bool load_layout (Yatla.Sidebar sidebar, string list_name)
		{
			_name = list_name;
			/** add an image before the label */
			_top_box1 = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);
			_list_name = new Gtk.Label (list_name);
			_list_name.use_markup = true;
            _list_name.set_markup ("""<span font='14'><b>%s</b></span>""".printf (_list_name.get_text ()));
			_top_box1.pack_start (_list_name);
			
			_top_box2 = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);
			new_task_entry = new Gtk.Entry ();
			new_task_entry.set_placeholder_text ("Add new task");
			/** maybe will use my custom image ... set_icon_from_image_name */
			new_task_entry.set_icon_from_stock (Gtk.EntryIconPosition.SECONDARY, "gtk-add");
			_top_box2.pack_start (new_task_entry);

			_tasks_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);

			var list_index = 0;
			foreach (Yatla.List list in sidebar.sidebar_list)
            {  
            	if (list.name == list_name)		break;
            	list_index++;
			}

			var task_index = 0;
			uint the_longest_task = 0;
			while (task_index != sidebar.sidebar_list.nth_data (list_index).size )
			{
				var task_id   = sidebar.sidebar_list.nth_data (list_index).tasks.nth_data (task_index).id;
				var task_name = sidebar.sidebar_list.nth_data (list_index).tasks.nth_data (task_index).name;
				var task_note = sidebar.sidebar_list.nth_data (list_index).tasks.nth_data (task_index).note;

				GLib.DateTime task_date;
				if (sidebar.sidebar_list.nth_data (list_index).tasks.nth_data (task_index).date != null)
					 task_date = sidebar.sidebar_list.nth_data (list_index).tasks.nth_data (task_index).date;
				else task_date = null;

				var task_is_done = sidebar.sidebar_list.nth_data (list_index).tasks.nth_data (task_index).is_done;

				var task = new Yatla.Task (task_name, task_note, task_date, task_is_done);
				task.id = task_id;

				/** check for the longest task to get horizontal slider if needed */
				if (task_name.length > the_longest_task)		the_longest_task = task_name.length;

				var checkBox = new Gtk.CheckButton.with_label (task_name);
				checkBox.set_active (task_is_done);
				if (checkBox.active)
				{
					var list = checkBox.get_children ();
					(list.nth_data (0) as Gtk.Label).set_use_markup (true);
					(list.nth_data (0) as Gtk.Label).set_markup ("""<span strikethrough="true" color="#b2b2b2">%s</span>""".printf (checkBox.label));
					task.is_done = true;
				}
				else
				{
					var list = checkBox.get_children ();
					(list.nth_data (0) as Gtk.Label).set_use_markup (false);
					(list.nth_data (0) as Gtk.Label).label = checkBox.label;
					task.is_done = false;
				}
				checkBox.set_tooltip_text (task_note);

				/** created a horizontal box in order to place chechbox and an edit button */
				var task_horizontal_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
				var task_preferences_button = new Gtk.Button.from_icon_name ("gtk-edit", Gtk.IconSize.SMALL_TOOLBAR);
				task_preferences_button.relief = Gtk.ReliefStyle.NONE;
				task_preferences_button.focus_on_click = false;
				task_preferences_button.xalign = 1.0f;
				task_preferences_button.set_size_request (20, 20);

				task_preferences_button.clicked.connect (() => 
				{
					var task_preferences = new Yatla.TaskPreferences (Yatla.TaskPreferencesType.CHANGE, this, _database, sidebar, task, list_name);
					task_preferences.show ();
				});

				task_horizontal_box.pack_start (checkBox);
				task_horizontal_box.pack_end   (task_preferences_button);
				tasks.@set (task, task_horizontal_box);
				_tasks_box.pack_start (task_horizontal_box);

				task_index++;
			}

			put (_top_box1,  25, 20);
			put (_top_box2,  20, 40);
			put (_tasks_box, 20, 100);
			width  = 65  + the_longest_task * 7;
			height = 100 + tasks.values.size * 30;
			show_all ();

			new_task_entry.icon_press.connect ((pos, event) => 
			{
				var task_preferences = new Yatla.TaskPreferences (Yatla.TaskPreferencesType.CREATE, this, _database, sidebar, new Yatla.Task (new_task_entry.text, null, null), list_name);
				task_preferences.show ();
			});

			var map_iterator = tasks.map_iterator ();
			while (map_iterator.next ())
			{
				var checkBox = map_iterator.get_value ().get_children ().nth_data(0) as Gtk.CheckButton;
				var task     = map_iterator.get_key ();

				checkBox.notify["active"].connect (() =>
				{	
					if (checkBox.active)
					{
						var list = checkBox.get_children ();
						(list.nth_data (0) as Gtk.Label).set_use_markup (true);
						(list.nth_data (0) as Gtk.Label).set_markup ("""<span strikethrough="true" color="#b2b2b2">%s</span>""".printf (checkBox.label));
						task.is_done = true;
					}
					else
					{
						var list = checkBox.get_children ();
						(list.nth_data (0) as Gtk.Label).set_use_markup (false);
						(list.nth_data (0) as Gtk.Label).label = checkBox.label;
						task.is_done = false;
					} 					
				});
			}

			return true;
		}

		/**
		 * @brief   clear the layout
		 * @details save the data, which was changed,
		 *          then clear the layout
		 * 
		 * @param database : database, where the data will be saved
		 */
		public void clear_layout (Yatla.Database database, Yatla.Sidebar sidebar)
		{
			/** save data, which was changed before removing the boxes */
			if (_name != null)		sidebar.update_list (tasks.keys.to_array (), _name);

			if (_top_box1 != null && _top_box2 != null && _tasks_box != null)
			{
				remove (_top_box1);
				remove (_top_box2);
				remove (_tasks_box);
			}

			if (tasks != null)		tasks.clear ();
		}

		public void reset_layout (Yatla.Database database, Yatla.Sidebar sidebar)
		{
			clear_layout (database, sidebar);
			load_layout  (sidebar, _name);
		}

		/**
		 * @brief   rename the list
		 * @details rename the list, in case it was
		 *          renamed in the sidebar
		 * 
		 * @param list_name : new name for the list_name.label
		 */
		public void rename_list (string list_name)
		{
			_list_name.label = list_name;
			_list_name.use_markup = true;
            _list_name.set_markup ("""<span font='14'><b>%s</b></span>""".printf (_list_name.get_text ()));
		}
	}
}
