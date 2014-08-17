/**
 * Popover.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */

namespace Yatla
{
	public class Popover : Gtk.Popover
	{
		internal  Gtk.Entry       			 list_name_entry;
		internal  Yatla.Database  			 database;
		internal  Yatla.Sidebar   			 sidebar;
		internal  Granite.Widgets.ThinPaned  pane;
		internal  Yatla.Layout 				 layout;

		public   Gtk.Widget      			create_button;

		public Popover (Gtk.Widget widget, Yatla.Database database, Yatla.Sidebar sidebar,
						Granite.Widgets.ThinPaned pane, Yatla.Layout layout) 
		{
			this.database = database;
			this.sidebar  = sidebar;
			this.pane     = pane;
			this.layout   = layout;

			create_widgets ();
			set_relative_to (widget);
			connect_signals ();
		}

		private void create_widgets ()
		{
			list_name_entry = new Gtk.Entry ();
			var label = new Gtk.Label ("Create you list");
			var box   = new Gtk.Box   (Gtk.Orientation.HORIZONTAL, 20);
			box.set_spacing (20);
			box.pack_start (label);
			box.pack_start (list_name_entry);
			add (box);

			// Add buttons to button area at the bottom
			/*add_button ("_Close", Gtk.ResponseType.CLOSE);
			create_button = add_button ("_Create", Gtk.ResponseType.APPLY);
			create_button.sensitive = false;

			// Add a little space from left and right
			get_content_area ().set_margin_left  (PADDINGS.left  + SHADOW_SIZE + 10);
			get_content_area ().set_margin_right (PADDINGS.right + SHADOW_SIZE + 10);
			get_action_area  ().set_margin_right (40);*/
		}

		private void connect_signals ()
		{
			list_name_entry.changed.connect (() => { create_button.sensitive = (list_name_entry.text != ""); });
			//response.connect (on_response);
		}

		private void on_response (Gtk.Dialog source, int response_id) 
		{
			switch (response_id) 
			{
				case Gtk.ResponseType.APPLY:	on_create_button_clicked ();	break;
				case Gtk.ResponseType.CLOSE:	destroy ();						break;
			}
		}

		private void on_create_button_clicked ()
		{
            /*Notify.init ("my app");    
            Notify.Notification notification = new Notify.Notification ("summary", "About the notification", "dialog-information");

			try {  notification.show ();  } 
            catch (Error e) {  error ("Error: %s", e.message);  }*/

            var list = new Yatla.List (list_name_entry.text);
            if (database.add_list (list))
            {
            	sidebar.sidebar_list.append (list);
	            sidebar.add_list (list);

	            if (pane.get_child1 () != sidebar)
	            {
	            	pane.remove (pane.get_child1 ());
	            	pane.pack1 (sidebar, true, false);
	                if (pane.get_position () != Yatla.MainWindow.PANE_POSITION)    pane.set_position (Yatla.MainWindow.PANE_POSITION);
	        	}
            }

            destroy ();
		}
	}
}
