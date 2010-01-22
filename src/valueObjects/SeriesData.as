package valueObjects
{
	public class SeriesData
	{   
		private var _number:Number;
		
		private var _attribute:String;
		
		
		
		public function SeriesData(number:Number,attribute:String)
		{
			_number = number;
			_attribute = attribute;
		}
		
		public function get number():Number
		{
			return this._number;
		}
		
		public function set number(value:Number):void
		{
			this._number = value;
		}
		
		public function get attribute():String
		{
			return this._attribute;
		}
		
		public function set attribute(value:String):void
		{
			this._attribute = value;
		}
		
		

	}
}