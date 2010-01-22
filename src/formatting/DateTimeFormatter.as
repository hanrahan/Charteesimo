package formatting
{
	import mx.formatters.DateFormatter;
	
	public class DateTimeFormatter
	{
		public function DateTimeFormatter()
		{
		}
		
		public static function getDateFormatter(formatString:String):DateFormatter
		{
     		var dateFormatter:DateFormatter  = new DateFormatter();
     		dateFormatter.formatString = formatString;
        	
     		return dateFormatter;
		}

		public static function getMonthFormatter():DateFormatter
		{
    		return getDateFormatter("MMM");	
		}
        
		public static function getMonthYearFormatter():DateFormatter
		{
    		return getDateFormatter("MMM YY");	
		}
        
		public static function getDayFormatter():DateFormatter
		{
    		return getDateFormatter("MM/DD");	
		}
        
		public static function getDayMonthYearFormatter():DateFormatter
		{
    		return getDateFormatter("MM/DD/YY");	
		}
		
		public static function formatQuarter(value:String):String
		{
			return "Q"+value;
		}
		

	}
}