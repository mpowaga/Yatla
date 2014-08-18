/**
 * Database.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */

namespace Yatla
{
	public class Database : GLib.Object
	{
		private  SQLHeavy.Database     _database;
		private  SQLHeavy.Transaction  _transaction;
		private  SQLHeavy.Query        _query;
		private  string 			   _location;
		
		public Database ()
		{
			_location = Environment.get_user_data_dir () + "/yatla/yatla.db";
			open ();
		}

		/**
		 * @brief trying to open the database
		 */
		public void open ()
		{
			try 
			{
				_database = new SQLHeavy.Database (_location, SQLHeavy.FileMode.READ | SQLHeavy.FileMode.WRITE);
			} 
			catch (SQLHeavy.Error e) 
			{
				_database = null;
				stderr.printf ("Can not find database!\n");
			}
		}

		/**
		 * @brief creating a database
		 */
		public void create ()
		{
			try 
			{
				DirUtils.create (Environment.get_user_data_dir () + "/yatla", 0755);
				_database = new SQLHeavy.Database (_location, SQLHeavy.FileMode.READ | SQLHeavy.FileMode.WRITE | SQLHeavy.FileMode.CREATE);
				_database.execute ("CREATE TABLE lists (id INTEGER PRIMARY KEY, name TEXT UNIQUE);");
			} 
			catch (SQLHeavy.Error e) 
			{
				_database = null;
				stderr.printf ("Cannot create new database in %s.\n", _location);
			}
		}

		/**
		 * @brief   backup
		 * @details save all the changes, that 've been made
		 *          to the database
		 * 
		 * @param sidebar_list : list from where the data will
		 *                       be taken and saved in database
		 */
		public void backup (GLib.List<Yatla.List> sidebar_list)
		{
			foreach (Yatla.List list in sidebar_list)
            {  update_list (list, list.name);  } 
		}

		/**
		 * @brief   if database is created
		 * @details checking if a database already exists
		 * @return  true if exists, false if doesn't exist
		 */
		public bool is_created ()
		{
			if (_database == null)		return false;
			else 						return true;
		}

		/**
		 * @brief   if database if empty
		 * @details checking if the database has to lists in `lists` table
		 * @return  true if empty, false if not empty
		 */
		public bool is_empty ()
		{
			var lists = new GLib.List<string> ();	
			try 
			{
				_query = new SQLHeavy.Query (_database, "SELECT * FROM `lists`;");

				for (var results = _query.execute (); !results.finished; results.next ()) 
				{  lists.append (results.fetch_string (1));  }

				if (lists.length () == 0)		return true;
				else 							return false;
			} 
			catch (SQLHeavy.Error e) 
			{
				stderr.printf ("Can not find out if the database is empty or not!!! \n");	
			}

			return false;
		}

		/**
		 * @brief   load lists from database
		 * @details load all the lists from the `lists` table from database
		 * 
		 * @return  a list of Yatla.List 
		 */
		public GLib.List<Yatla.List>? load_data ()
		{
			var data = new GLib.List<Yatla.List> ();
			try 
			{
				_query = new SQLHeavy.Query (_database, "SELECT * FROM `lists`;");
				for (var results = _query.execute (); !results.finished; results.next ()) 
				{
					var name = results.fetch_string(1);
					var list = new Yatla.List (name);

					var sql_command = "SELECT * FROM `" + name + "_tasks`;";
					var query = new SQLHeavy.Query (_database, sql_command);
					for (var task_results = query.execute (); !task_results.finished; task_results.next ()) 
					{
						var task_id      = task_results.fetch_int ();
						var task_name    = task_results.fetch_string (1);
						var task_note    = task_results.fetch_string (2);

						GLib.DateTime task_date;

						if (task_results.fetch_string (3) != "")
								task_date = new Yatla.DateTime.from_string_with_format (task_results.fetch_string (3), Yatla.DateTime.DEFAULT_FORMAT).get_datetime ();
						else 	task_date = null;

						var task_is_done = bool.parse (task_results.fetch_string (4));

						var task = new Yatla.Task (task_name, task_note, task_date, task_is_done);
						task.id = task_id;
						list.add_task (task);
					}
					
					data.append (list);
				}
			} 
			catch (SQLHeavy.Error e) 
			{
				error ("Error: %s", e.message);
			}

			return data;
		}

		/**
		 * @brief   adding a list to the database
		 * @details adding a list to the `lists` table
		 *          and also creating a new table for
		 *          tasks and its' properties of that list
		 * 
		 * @param  list  : list to be added to the database
		 * @return true  : if adding the list was successful
		 *         false : if adding the list wasn't successful
		 */
		public bool add_list (Yatla.List list)
		{
			try 
			{
				_transaction = _database.begin_transaction ();
				_query = _transaction.prepare ("INSERT INTO `lists` (`name`) VALUES (:name);");
				_query[":name"] = list.name;
				_query.execute ();

				/** SQLHeavy doesn't support yet bool and datetime data types, so I have to work with strings */
				string sql_command = "CREATE TABLE " +  list.name + "_tasks (id INTEGER PRIMARY KEY, name TEXT UNIQUE, note TEXT, date TEXT, is_done TEXT);";
				_transaction.execute (sql_command);
				_transaction.commit ();

			return true;
			} 
			catch (SQLHeavy.Error e) 
			{
				stderr.printf ("Cannot insert list %s.\n", list.name);
				stdout.printf ("Error : %s\n", e.message);
				return false;
			}
		}

		/**
		 * @brief   updating the list
		 * @details updating the list properties 
		 *          in case any changes were done
		 * 
		 * @param list 	    : list, which will be updated
		 * @param list_name : name of the list, in order to find
		 *                    the table, where to update the list
		 * 
		 * @return true  : if updating was successful
		 *         false : if updating wasn't successful
		 */
		public bool update_list (Yatla.List list, string list_name)
		{
			try 
			{
				var sql_command = "SELECT * FROM `" + list_name + "_tasks`;";
				var task_index  = 0; 
				_query = new SQLHeavy.Query (_database, sql_command);
				for (var results = _query.execute (); !results.finished; results.next ()) 
				{
                    var task_name    = results.fetch_string (1);
                    var task_note    = results.fetch_string (2);

                    GLib.DateTime task_date;

                    if (results.fetch_string (3) != "")
                        	task_date = new Yatla.DateTime.from_string_with_format (results.fetch_string (3), Yatla.DateTime.DEFAULT_FORMAT).get_datetime ();
                    else 	task_date = null;

                    var task_is_done = bool.parse (results.fetch_string (4));
                    
                    if (list.tasks.nth_data (task_index).name    != task_name ||
                        list.tasks.nth_data (task_index).note    != task_note ||
                        list.tasks.nth_data (task_index).date    != task_date ||
                        list.tasks.nth_data (task_index).is_done != task_is_done)
                    {
                    	var task = new Yatla.Task (list.tasks.nth_data (task_index).name, list.tasks.nth_data (task_index).note, list.tasks.nth_data (task_index).date, list.tasks.nth_data (task_index).is_done);
                    	task.id  = list.tasks.nth_data (task_index).id;

                        // adding to sql_command some terms in case we want to change something
		                sql_command = "UPDATE `" + list_name + "_tasks` SET ";
		                if (task_name    != task.name)		sql_command += "name = (:new_name),";
		                if (task_note    != task.note)		sql_command += "note = (:new_note),";
		                if (task_date    != task.date)		sql_command += "date = (:new_date),";
		                if (task_is_done != task.is_done)	sql_command += "is_done = (:new_is_done),";

		                // delete last comma and add WHERE
		                sql_command = sql_command.substring (0, sql_command.length - 1) + " WHERE id = (:id);";

						_transaction = _database.begin_transaction ();
						_query = _transaction.prepare (sql_command);

						if (task_name    != task.name)		_query[":new_name"]    = task.name;
		                if (task_note    != task.note)		_query[":new_note"]    = task.note;
		                if (task_date    != task.date)		
		                {
		                	if (task.date == null)			_query[":new_date"]    = "";
							else 							_query[":new_date"]    = task.date.to_string ();
		                }
		                if (task_is_done != task.is_done)	_query[":new_is_done"] = task.is_done.to_string ();

						_query[":id"] = task.id;
						_query.execute ();
						_transaction.commit ();
                    }
                    task_index++;
				}
				return true;
			} 
			catch (SQLHeavy.Error e) 
			{
				stdout.printf ("Error updating the task");
				stdout.printf ("Error : %s\n", e.message);
				return false;
			}
		}

		/**
		 * @brief   remove list from the database
		 * @details remove list from the `lists` table
		 *          and also "drop" the table with tasks
		 *          of that list (removing that table)
		 * 
		 * @param  list  : list to be removed
		 * @return true  : if removing the list was successful
		 *         false : if removing the list wasn't successful
		 */
		public bool remove_list (Yatla.List list)
		{
			try 
			{
				_transaction = _database.begin_transaction ();
				_query = _transaction.prepare ("DELETE FROM `lists` WHERE name=:name;");
				_query[":name"] =  list.name;
				_query.execute ();
				
				string sql_command = "DROP TABLE " + list.name + "_tasks ";
				_transaction.execute (sql_command);
				_transaction.commit ();
				return true;
			} 
			catch (SQLHeavy.Error e) 
			{
				stderr.printf ("Cannot delete list %s.\n", list.name);
				return false;
			}
		}

		/**
		 * @brief   rename a list in database
		 * @details renaming the list in the database
		 *          with a new name
		 * 
		 * @param list     : list to rename
		 * @param new_name : a new name for the list
		 * 
		 * @return true  : if renaming was successful
		 *         false : if renaming wasn't successful
		 */
		public bool rename_list (Yatla.List list, string new_name)
		{
			try 
			{
				_transaction = _database.begin_transaction ();
				_query = _transaction.prepare ("UPDATE `lists` SET name = (:new_name) WHERE name = (:name);");
				_query[":new_name"] = new_name;
				_query[":name"]     = list.name;
				_query.execute ();
				_transaction.commit ();
				return true;
			} 
			catch (SQLHeavy.Error e) 
			{
				stderr.printf ("Cannot rename list %s.\n", list.name);
				return false;
			}
		}

		/**
		 * @brief   add task to database
		 * @details add a task to the list_task table
		 *          in the database
		 * 
		 * @param task      : a task, which will be added
		 * @param list_name : name of the list, in order to find
		 *                    the table, where to insert the task
		 * 
		 * @return true  : if adding a task was successful
		 *         false : if adding a task wasn't successful
		 */
		public bool add_task (Yatla.Task task, string list_name)
		{
			try 
			{
				var sql_command = "INSERT INTO `" + list_name + "_tasks` (`name`, `note`, `date`, `is_done`) VALUES (:name, :note, :date, :is_done);";
				_transaction = _database.begin_transaction ();
			    _query = _transaction.prepare (sql_command);
			    _query[":name"]    = task.name;
			    _query[":note"]    = task.note;

			    if (task.date == null)	_query[":date"]    = "";
				else 					_query[":date"]    = task.date.to_string ();

			    _query[":is_done"] = false.to_string ();
			    _query.execute ();
			    _transaction.commit ();

			    return true;
			} 
			catch (SQLHeavy.Error e) 
			{
				stderr.printf ("Cannot insert task %s.\n", task.name);
				stdout.printf ("Error : %s\n", e.message);
				return false;
			}
		}

		public int get_task_id (string task_name, string list_name)
		{
			try 
			{
				var sql_command = "SELECT id FROM `" + list_name + "_tasks` WHERE name = (:task_name);"; 
				_transaction = _database.begin_transaction ();
				_query = _transaction.prepare (sql_command);
				_query[":task_name"] = task_name;

				var results = _query.execute ();
				int id = results.fetch_int ();
				_transaction.commit ();

				return id;
			} 
			catch (SQLHeavy.Error e) 
			{
				stderr.printf ("Cannot get task id of task : %s.\n", task_name);
				stdout.printf ("Error : %s\n", e.message);
				return -1;
			}
		}

		/**
		 * @brief   updating the task
		 * @details updating the task properties 
		 *          in case any changes were done
		 * 
		 * @param task 		: task, which will be updated
		 * @param list_name : name of the list, in order to find
		 *                    the table, where to update the task
		 * 
		 * @return true  : if updating was successful
		 *         false : if updating wasn't successful
		 */
		public bool update_task (Yatla.Task task, string list_name)
		{
			try 
			{
				var sql_command = "SELECT * FROM `" + list_name + "_tasks` WHERE id = (:id);";
				_query = new SQLHeavy.Query (_database, sql_command);
				_query[":id"] = task.id;
				var results   = _query.execute ();

				var task_name = results.fetch_string (1);
                var task_note = results.fetch_string (2);

                GLib.DateTime task_date;
                if (results.fetch_string (3) != "")
                    	task_date = new Yatla.DateTime.from_string_with_format (results.fetch_string (3), Yatla.DateTime.DEFAULT_FORMAT).get_datetime ();
                else 	task_date = null;

                var task_is_done = bool.parse (results.fetch_string (4));

                // adding to sql_command some terms in case we want to change something
                sql_command = "UPDATE `" + list_name + "_tasks` SET ";
                if (task_name    != task.name)		sql_command += "name = (:new_name),";
                if (task_note    != task.note)		sql_command += "note = (:new_note),";
                if (task_date    != task.date)		sql_command += "date = (:new_date),";
                if (task_is_done != task.is_done)	sql_command += "is_done = (:new_is_done),";

                // delete last comma and add WHERE
                sql_command = sql_command.substring (0, sql_command.length - 1) + " WHERE id = (:id);";

				_transaction = _database.begin_transaction ();
				_query = _transaction.prepare (sql_command);

				if (task_name    != task.name)		_query[":new_name"]    = task.name;
                if (task_note    != task.note)		_query[":new_note"]    = task.note;
                if (task_date    != task.date)		
                {
                	if (task.date == null)			_query[":new_date"]    = "";
					else 							_query[":new_date"]    = task.date.to_string ();
                }
                if (task_is_done != task.is_done)	_query[":new_is_done"] = task.is_done.to_string ();

				_query[":id"] = task.id;
				_query.execute ();
				_transaction.commit ();
				return true;
			} 
			catch (SQLHeavy.Error e) 
			{
				stdout.printf ("Error updating the task");
				stdout.printf ("Error : %s\n", e.message);
				return false;
			}
		}

		/**
		 * @brief   remove task from the database
		 * 
		 * @param task      : task, which will be removed
		 * @param list_name : name of the list, from which
		 *                    task will be removed
		 * 
		 * @return true  : if removing was successful
		 *         false : if removing wasn't successful
		 */
		public bool remove_task (Yatla.Task task, string list_name)
		{
			try 
			{
				var sql_command = "DELETE FROM `" + list_name + "_tasks` WHERE id = (:id);";
				_transaction = _database.begin_transaction ();
				_query = _transaction.prepare (sql_command);
				_query[":id"] = task.id;

				_query.execute ();
				_transaction.commit ();
				return true;
			} 
			catch (SQLHeavy.Error e) 
			{
				stdout.printf ("Error deleing the task");
				stdout.printf ("Error : %s\n", e.message);
				return false;	
			}
		}

		/**
		 * @brief   gets location of the database
		 * @return  location of the database
		 */
		public static string get_location ()
		{
			return Environment.get_user_data_dir () + "/yatla/yatla.db";
		}
	}
}
