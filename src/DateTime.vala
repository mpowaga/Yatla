namespace Yatla
{
	class DateTime : GLib.Object 
	{
		private GLib.DateTime datetime;
		private bool _valid = false;
		
		public static const string DEFAULT_FORMAT = "%FT%H:%M:%S%z";
		
		public DateTime () 
		{
			datetime = new GLib.DateTime.now_local ();
		}

		public DateTime.from_string_with_format (string dateStr, string format) 
		{
			datetime = new GLib.DateTime.now_local ();
			datetime.format (format);
			parse(dateStr);
			datetime.add_years (1900);
		}
		
		public bool parse(string dateStr) 
		{
			if (dateStr.index_of (":") > -1) 
			{
				//-- This is a time
				var parts = dateStr.split (":");
				var part = parts[0];
				var partsDate = part.split (" ");
				var parseDateStrArr = new string[partsDate.length - 1];
				for (var i = 0; i < partsDate.length - 1; i++) 
				{	parseDateStrArr[i] = partsDate[i];	}

				var parseDateStr = string.joinv (" ", parseDateStrArr);
				var r = /([0-9]{2})\:([0-9]{2})\:([0-9\.]{2,6})/;
				var timeParts = r.split (dateStr);
				var hour   = "00";
				var minute = "00";
				var second = "00";
				for (var i = 1; i < timeParts.length - 1; i++) 
				{
					if      (i == 1)    hour   = timeParts[i];
					else if (i == 2)    minute = timeParts[i];
					else if (i == 3)	second = timeParts[i];
				}
				parse_date (parseDateStr);

				if (_valid) 
				{
					datetime = new GLib.DateTime.local (
						datetime.get_year(), datetime.get_month (), datetime.get_day_of_month (),
						int.parse (hour), int.parse (minute), int.parse (second)
					);
				}

				return _valid;
			} 
			else 		return parse_date (dateStr);
		}
		
		public bool parse_date (string dateStr) 
		{
			var parsed_date = Date ();
			parsed_date.set_parse (dateStr);
			
			if (parsed_date.valid ()) 
			{
				var time = Time();
				parsed_date.to_time (out time);
				datetime = new GLib.DateTime.local (
					time.year, time.month, time.day,
					time.hour, time.minute, time.second
				);
				var output = new char[100];
				var format = "%c";
				var success = parsed_date.strftime (output, format);

				if (success == 0) 
				{
					_valid = false;
					warning ("Failed to formart date.");
				} 
				else 	_valid  = true;
			} 
			else 
			{
				_valid = false;
				warning ("Failed to parse date.");
			}
			
			return _valid;
		}
		
		public GLib.DateTime get_datetime () 
		{
			return datetime;
		}
	}
}
