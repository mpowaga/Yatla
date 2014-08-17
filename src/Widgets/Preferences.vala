/**
 * Preferences.vala
 * 
 * @author Grebennicov Denis <denisgrebennicov@gmail.com>
 */

namespace Yatla
{
	public class Preferences : Gtk.Dialog
	{
		public Preferences ()
		{
			title = "Preferences";
	        border_width = 5;
			set_resizable (false);
			window_position = Gtk.WindowPosition.CENTER;
		}
	}
}
