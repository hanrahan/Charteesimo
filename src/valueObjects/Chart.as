package valueObjects {
	import mx.collections.ArrayCollection;
	
	public class Chart{   
		private var _axisType:String;
		
		private var _chartType:String;
		
		private var _series:ArrayCollection;
		
		public function Chart(){
		}
		
		public function get axisType():String{
		  return this._axisType;	
		}
		
		public function set axisType(value:String):void{
		    _axisType = value;	
		}
		
		public function get chartType():String{
		  return this._chartType;	
		}
		
		public function set chartType(value:String):void{
		    _chartType = value;	
		}
		
		public function get series():ArrayCollection{
			return this._series;
		}
		
		public function set series(value:ArrayCollection):void{
			this._series = value;
		}

	}
}