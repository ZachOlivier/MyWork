package engine 
{
	/**
	 * State manager
	 */
	public class State 
	{
		private static var _current:IState;
		
		public static function update():void
		{
			if ( _current != null )
				current.update();
		}
		
		public static function set current( state:IState ):void
		{
			if ( _current != null )
				_current.end();
				
			_current = state;
			
			if ( _current != null )
				_current.start();
		}
		
		public static function get current():IState { return _current; }
	}

}