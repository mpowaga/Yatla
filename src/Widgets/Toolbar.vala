/**
 * Toolbar.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */

namespace Yatla
{
	public class Toolbar : Gtk.HeaderBar
	{
		public  Gtk.Menu 				   menu;
		public  Gtk.ToolButton             add_new_list_button;
        public  Gtk.SearchEntry            search;
        public  Gtk.ToolItem               search_item;
        public  Gtk.CheckMenuItem          fullscreen_mode;
        public  Gtk.MenuItem               import_database;
        public  Gtk.MenuItem               preferences;

        public Toolbar () 
		{
            var title = new Gtk.Label ("<span weight='bold' size='large'>%s</span>".printf ("Yatla"));
            title.use_markup = true;
            set_custom_title (title);
            show_close_button = true;

            add_new_list_button = new Gtk.ToolButton.from_stock ("gtk-new");
            add_new_list_button.set_tooltip_text ("Create new list");
            
            var separatorOnToolbar = new Gtk.SeparatorToolItem ();
            separatorOnToolbar.set_expand (true);

            search          = new Gtk.SearchEntry ();
            search_item     = new Gtk.ToolItem ();
            search.set_placeholder_text ("Find your task");
            search_item.add (search);

            fullscreen_mode = new Gtk.CheckMenuItem.with_label ("Fullscreen");
            import_database = new Gtk.MenuItem.with_label ("Import database");
            preferences     = new Gtk.MenuItem.with_label ("Preferences");

            menu = new Gtk.Menu ();
            menu.append (fullscreen_mode);
            menu.append (import_database);
            menu.append (new Gtk.SeparatorMenuItem ());
            menu.append (preferences);

            pack_start (add_new_list_button);
            pack_start (separatorOnToolbar);
		}
	}
<<<<<<< HEAD
}
=======
}
>>>>>>> 26ab0a2836db4886ba046921351da223d87fb73d
