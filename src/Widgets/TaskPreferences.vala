/**
 * TaskPreferences.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */

namespace Yatla
{
	public class TaskPreferences : Gtk.Dialog
	{
		private  Yatla.Database  			 _database;
		private  Yatla.Sidebar   			 _sidebar;
		private  Yatla.Layout 				 _layout;
		private  Gtk.Entry 				  	 _name_entry;
		private  Gtk.Entry 				  	 _note_entry;
		private  Gtk.Switch 				 _notification_switcher;
		private  Granite.Widgets.DatePicker  _date_picker;
		private  Granite.Widgets.TimePicker  _time_picker;
		private  string  					 _list_name;
		private  Gtk.Button 				 _create_button;
	
		/** index is the index in sidebar.sidebar_list */
		public TaskPreferences(Yatla.Layout layout, Yatla.Database database, Yatla.Sidebar sidebar, string task_name, string list_name) 
		{	
			title           = "Create you task";
			border_width    = 5;
			resizable       = false;
			window_position = Gtk.WindowPosition.CENTER;

			this._database  = database;
			this._sidebar   = sidebar;
			this._layout    = layout;
			this._list_name = list_name;
			
            create_widgets (task_name);
            connect_signals ();
            show_all ();
		}

		private void create_widgets (string task_name)
		{
			Gtk.Grid content = new Gtk.Grid ();

			var name_label = create_preferences_label ("Name:");
			_name_entry     = new Gtk.Entry ();
			_name_entry.set_placeholder_text ("Name of the Task");
			_name_entry.set_text (task_name);

			var note_label = create_preferences_label ("Note:");
			_note_entry     = new Gtk.Entry ();
			_note_entry.set_placeholder_text ("Additional information");

			var notification_label = create_preferences_label ("Notification:");
			_notification_switcher  = new Gtk.Switch ();
			_notification_switcher.set_active (true);
			var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 20); // because without it, it looks terrible
			box.pack_start (notification_label);
			box.pack_start (_notification_switcher);

			var date_label = create_preferences_label ("Date:");
			_date_picker    = new Granite.Widgets.DatePicker.with_format ("%d/%m/%Y");

            var time_label = create_preferences_label ("Time:");
			_time_picker    = new Granite.Widgets.TimePicker ();

			content.attach (name_label,   0, 2, 1, 1);
			content.attach (_name_entry,  0, 3, 1, 1);
			content.attach (note_label,   1, 2, 1, 1);
			content.attach (_note_entry,  1, 3, 1, 1);
			content.attach (box,          0, 4, 1, 1);
			content.attach (date_label,   0, 6, 1, 1);
			content.attach (_date_picker, 0, 8, 1, 1);
			content.attach (time_label,   1, 6, 1, 1);
			content.attach (_time_picker, 1, 8, 1, 1);

			content.set_column_spacing (20);
			content.set_row_spacing    (10);
			content.set_margin_left	   (10);
			content.set_margin_right   (10);
			content.set_margin_bottom  (5);

			_notification_switcher.notify["active"].connect (() => 
			{
				if (_notification_switcher.active)
				{
					date_label.set_sensitive   (true);
					_date_picker.set_sensitive (true);
					time_label.set_sensitive   (true);
					_time_picker.set_sensitive (true);
				}
				else 
				{
					date_label.set_sensitive   (false);
					_date_picker.set_sensitive (false);
					time_label.set_sensitive   (false);
					_time_picker.set_sensitive (false);
				}
			});
			_date_picker.notify["date"].connect (() => {  stdout.printf("date was changed\n");  });
			_time_picker.time_changed.connect   (() => {  stdout.printf("time was changed\n");  });

			get_content_area ().add (content);
			add_button ("_Close",  Gtk.ResponseType.CLOSE);
			_create_button = (add_button ("_Create", Gtk.ResponseType.APPLY) as Gtk.Button);
			_create_button.sensitive = (_name_entry.text != "");
			(get_action_area () as Gtk.ButtonBox ).set_layout  (Gtk.ButtonBoxStyle.CENTER);
			(get_action_area () as Gtk.ButtonBox ).set_spacing (170);
		}

		private static Gtk.Label create_preferences_label (string text)
		{
			var label = new Gtk.Label ("<span weight='bold'>%s</span>".printf (text));
            label.use_markup = true;
            label.set_alignment (0.0f, 0.5f);

            return label;
		}

		private void connect_signals ()
		{
			_name_entry.changed.connect (() => { _create_button.sensitive = (_name_entry.text != ""); });

			response.connect ((response_id) =>
			{
				switch (response_id) 
				{
					case Gtk.ResponseType.APPLY:	on_create_button_clicked ();	break;
					case Gtk.ResponseType.CLOSE:	destroy ();						break;
				}
			});
		}

		private void on_create_button_clicked ()
		{
			Yatla.Task task;
			if (_notification_switcher.active)
			{
				var date = new GLib.DateTime.local (_date_picker.date.get_year (), 		   _date_picker.date.get_month (), 
													_date_picker.date.get_day_of_month (), _time_picker.time.get_hour(),
													_time_picker.time.get_minute (), 0);

				task = new Yatla.Task (_name_entry.text, _note_entry.text, date);
			}
			else   task = new Yatla.Task (_name_entry.text, _note_entry.text, null);

			_database.add_task (task, _list_name);
			_sidebar.add_task (_database, _list_name, task);
			_layout.reset_layout (_database, _sidebar);			// add a checkbox with a task, not reset the layout, problem with ID, i 													   don't know the id of the task, which i added
			destroy ();
		}
	}
}
