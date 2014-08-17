/**
 * Yatla.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */

namespace Yatla
{
    public class App : Granite.Application 
    {
        public MainWindow window;
 
        construct 
        {
            program_name = "Yatla";
            exec_name    = "yatla";
 
            /*
            build_data_dir = Constants.DATADIR;
            build_pkg_data_dir = Constants.PKGDATADIR;
            build_release_name = Constants.RELEASE_NAME;
            build_version = Constants.VERSION;
            build_version_info = Constants.VERSION_INFO;
            */
 
            app_years      = "2014";
            app_icon       = "myapp";
            app_launcher   = "myapp.desktop";
            application_id = "net.launchpad.myapp";
 
            main_url      = "https://code.launchpad.net/myapp";
            bug_url       = "https://bugs.launchpad.net/myapp";
            help_url      = "https://code.launchpad.net/myapp";
            translate_url = "https://translations.launchpad.net/myapp";
 
            about_authors      = { "Denis Grebennicov <denisgrebennicov@gmail.com>" };
            about_documenters  = { "me" };
            about_artists      = { "me" };
            about_comments     = "comment";
            about_translators  = null;
            about_license_type = Gtk.License.GPL_3_0;
        }
 
        public override void activate () 
        {
            if (get_windows () == null) 
            {
                window = new MainWindow (this);
                Gtk.Settings.get_default ();
                window.show_all ();
            } 
            else    window.present ();
        }
 
        public static void main (string [] args) 
        {
            var app = new App ();
            app.run (args);
        }
    }
            
    public class MainWindow : Gtk.Window 
    {
        internal  App                        _app;
        internal  Granite.Widgets.Welcome    _welcome;
        internal  Gtk.Box                    _main_box;
        internal  Yatla.Toolbar              _toolbar;
        internal  Granite.Widgets.ThinPaned  _pane;
        internal  Yatla.Database             _database;
        internal  Yatla.Sidebar              _sidebar;
        internal  Yatla.Layout               _layout;

        public static const int PANE_POSITION = 150;

        public MainWindow (App app) 
        {
            this._app = app;
            this.set_application (app);
            this.set_size_request (1000, 640);
            this.window_position = Gtk.WindowPosition.CENTER;
            
            _database = new Yatla.Database ();
            if (!_database.is_created ())    _database.create ();
            
            setup_ui ();

            /** Resize signal. Doesn't work when make maximize. Subtracted -165 just to make it look good. **/
            check_resize.connect (() => 
            {
                int x, y;
                get_size (out x, out y);
                _layout.new_task_entry.width_request = x - _pane.position - 165 - 2*20;
            });

            
            /*window_state_event.connect ((event) => 
            {  
                if (event.new_window_state == Gdk.WindowState.MAXIMIZED)
                {
                    int x, y;
                    get_size (out x, out y);
                    _layout.new_task_entry.width_request = x - _pane.position - 2*20;
                    stdout.printf("maximized \n");
                }
                return false;
            });*/

            destroy.connect (() => 
            {
                _layout.clear_layout (_database, _sidebar);
                _database.backup (_sidebar.sidebar_list); 
            });
        }
 
        /**
         * @brief setting the ui
         */
        private void setup_ui () 
        {
            /** Main Box */
            _main_box  = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);

            /** Toolbar */
            _toolbar      = new Yatla.Toolbar ();
            var app_menu = _app.create_appmenu (_toolbar.menu);
            _toolbar.pack_end (app_menu);
            _toolbar.pack_end (_toolbar.search_item);
            this.set_titlebar (_toolbar);
            
            /** Toolbar actions */
            _toolbar.add_new_list_button.clicked.connect (() => { action_new_list     (); } );
            _toolbar.fullscreen_mode.toggled.connect     (() => { action_fullscreen (_toolbar.fullscreen_mode.get_active ()); } );
            _toolbar.import_database.activate.connect    (() => { action_import_lists (); } );
            _toolbar.preferences.activate.connect        (() => { action_preferences  (); } );

            /** Pane (Devide Sidebar and the Layout) */
            _pane = new Granite.Widgets.ThinPaned ();
            _pane.expand = true;

            /** Sidebar (need to add Gtk.Revealer, for cool animation) */
            _sidebar = new Yatla.Sidebar ();
            _sidebar.item_selected.connect (list_selected);

            /** Layout */
            var scrolledWindow = new Gtk.ScrolledWindow (null, null);
            _layout = new Yatla.Layout (_database);
            scrolledWindow.add (_layout);
            _pane.pack2 (scrolledWindow, true, true);

            /** Welcome screen */
            if (_database.is_empty ())
            {
                _welcome = new Granite.Widgets.Welcome (("No lists created"), ("Create a list, to add tasks"));
                _welcome.append ("document",        ("Create"), ("Make a new to-do list"));
                _welcome.append ("document-import", ("Import"), ("Add lists from your hard drive"));

                _pane.pack1 (_welcome, true, true);
                
                _welcome.activated.connect ((i) => 
                {
                    switch (i)
                    {
                        case 0: action_new_list ();              break;
                        case 1: action_import_lists ();          break;
                    }
                });
            }
            else 
            {
                _sidebar.sidebar_list = _database.load_data ();      // load lists from database
                foreach (Yatla.List list in _sidebar.sidebar_list)   // adding the lists to the sidebar, so we can navigate throught lists
                {  _sidebar.add_list (list);  }

                _pane.pack1 (_sidebar, true, false);
                _pane.set_position (PANE_POSITION);
            }

            _main_box.pack_start (_pane);
            this.add (_main_box);
        }

        /**
         * @brief list from the sidebar is selected
         * 
         * @param item : list from the sidebar 
         *               which is selected
         */
        void list_selected (Granite.Widgets.SourceList.Item? item)
        {
            _layout.clear_layout (_database, _sidebar);
            _layout.load_layout  (_sidebar, item.name);

            /** in case the list in edited */
            item.edited.connect ((i) => 
            {
                var index = 0;

                /** looking for index of the list in the GLib.List<Yatla.List> */
                foreach (Yatla.List list in _sidebar.sidebar_list)
                {
                    if (list.name == item.name)     break;
                    index++;
                }

                /** if the database could rename the list */
                if (_database.rename_list (_sidebar.sidebar_list.nth_data (index), i))
                {
                    _sidebar.sidebar_list.nth_data (index).name = i;
                    _layout.rename_list (i);
                }
            });
        }

        /**
         * @brief add new list button
         *        on the toolbar is pressed
         */
        void action_new_list ()
        {
            var popover = new Gtk.Popover (_toolbar.add_new_list_button);
            
            var grid  = new Gtk.Grid ();
            grid.set_margin_top    (10);
            grid.set_margin_bottom (10);
            grid.set_margin_left   (10);
            grid.set_margin_right  (10);
            
            var box             = new Gtk.Box   (Gtk.Orientation.HORIZONTAL, 20);
            var list_name_entry = new Gtk.Entry ();
            var label           = new Gtk.Label ("Create you list");
            box.set_spacing (20);
            box.pack_start (label);
            box.pack_start (list_name_entry);
            grid.attach (box, 0, 0, 1, 1);

            var buttonBox     = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
            var create_button = new Gtk.Button.with_label ("Create");
            var close_button  = new Gtk.Button.with_label ("Cancel");
            create_button.set_sensitive (false);
            buttonBox.set_layout (Gtk.ButtonBoxStyle.CENTER);
            buttonBox.set_spacing (20);
            buttonBox.pack_start (close_button);
            buttonBox.pack_start (create_button);
            grid.attach (buttonBox, 0, 1, 1, 1);

            grid.set_row_spacing (7);
            popover.add (grid);
            popover.set_visible (true);
            popover.show_all ();

            /** if the entry is not empty, we can press the create button */
            list_name_entry.changed.connect (() => {  create_button.sensitive = (list_name_entry.text != "");  });

            create_button.clicked.connect (() =>
            {
                var list = new Yatla.List (list_name_entry.text);
                if (_database.add_list (list))
                {
                    _sidebar.sidebar_list.append (list);
                    _sidebar.add_list (list);

                    if (_pane.get_child1 () != _sidebar)
                    {
                        _pane.remove (_pane.get_child1 ());
                        _pane.pack1 (_sidebar, true, false);
                        if (_pane.get_position () != Yatla.MainWindow.PANE_POSITION)    _pane.set_position (Yatla.MainWindow.PANE_POSITION);
                    }
                }

                popover.destroy ();
            });

            close_button.clicked.connect (() => {  popover.destroy ();  });
        }

        /**
         * @brief   import the database button
         *          was pressed
         */
        void action_import_lists ()
        {
            var chooser = new Gtk.FileChooserDialog ("Open File", this, Gtk.FileChooserAction.OPEN,
                                                     "Cancel", Gtk.ResponseType.CANCEL,
                                                     "Open",   Gtk.ResponseType.ACCEPT);
        
            var filter_db = new Gtk.FileFilter ();
            filter_db.set_filter_name ("Database");
            filter_db.add_pattern ("*.db");
            chooser.add_filter (filter_db);

            var filter_all = new Gtk.FileFilter ();
            filter_all.set_filter_name ("All files");
            filter_all.add_pattern ("*");
            chooser.add_filter (filter_all);

            if (chooser.run () == Gtk.ResponseType.ACCEPT)
            {
                string uri = chooser.get_uri ();

                /** if extension is db */
                if (uri.substring (uri.last_index_of_char ('.') + 1 ) == "db")
                {
                    try 
                    {
                        var file = File.new_for_uri (uri);
                        var destination = File.new_for_path (Yatla.Database.get_location ());
                        var name_of_the_file = file.get_parse_name ().substring (file.get_parse_name ().last_index_of_char ('/') + 1);

                        if (name_of_the_file != "yatla.db")     file = file.set_display_name ("yatla.db");
                        file.copy (destination, FileCopyFlags.OVERWRITE);

                        /** need to open the new database */
                        _database = new Yatla.Database ();

                        /** we need to remove all the lists from the sidebar and insert new ones from the database */
                        _sidebar.root.clear ();
                        _sidebar.sidebar_list = _database.load_data ();

                        foreach (Yatla.List list in _sidebar.sidebar_list)
                        {  _sidebar.add_list (list);  }

                        if (_pane.get_child1 () != _sidebar && _sidebar.sidebar_list.length () != 0)
                        {
                            _pane.remove (_pane.get_child1 ());         // removes the welcome view
                            _pane.pack1 (_sidebar, false, false);
                            if (_pane.get_position () != PANE_POSITION)    _pane.set_position (PANE_POSITION);
                        }

                        _layout.remove (_layout._top_box1);
                        _layout.remove (_layout._top_box2);
                        _layout.remove (_layout._tasks_box);
                    } 
                    catch (Error e) 
                    {
                        error ("Error: %s", e.message);
                    }
                }
                else
                {
                    var dialog = new Gtk.Dialog ();
                    var label  = new Gtk.Label ("The file is not a database");

                    dialog.title = "Warning";
                    dialog.resizable = false;
                    dialog.get_content_area (). add (label);
                    dialog.add_button ("OK", Gtk.ResponseType.OK);
                    dialog.get_action_area ().set_margin_right (19);
                    dialog.get_content_area ().set_margin_left  (20);
                    dialog.get_content_area ().set_margin_right (20);
                    dialog.show_all ();

                    dialog.response.connect (() => { dialog.destroy (); });
                }
            }

            chooser.close ();
        }

        /**
         * @brief fullscreen button is pressed
         * @param active : if fullscreen button is 
         *                 active or not
         */
        void action_fullscreen (bool active)
        {
            if (active)   stdout.printf("Fullscreen ON\n");
            else          stdout.printf("Fullscreen OFF\n");
        }

        /**
         * @brief preferences button is pressed
         */
        void action_preferences ()
        {
            var preferencesDialog = new Yatla.Preferences ();
            preferencesDialog.show_all ();
        }
    }
}
