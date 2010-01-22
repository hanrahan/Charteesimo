package valueObjects
{
	import mx.collections.ArrayCollection;
	
	public class Series
	{   
		private var _displayName:String;
		
		private var _data:ArrayCollection;
		
		public function Series()
		{
		}
		
		public function get displayName():String
		{
			return this._displayName;
		}
		
		public function set displayName(value:String):void
		{
			this._displayName = value;
		}
		
		public function get data():ArrayCollection
		{
			return this._data;
		}
		
		public function set data(value:ArrayCollection):void
		{
			this._data = value;
		}

	}
}