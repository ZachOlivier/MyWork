package engine 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Timer;

	
	public class Time 
	{
		/// Which tick frame
		static private var _frameCount	:uint = 0;
		
		static public function get frameCount():uint { return _frameCount; }
		
			
		/// Initialize sub-system
		static public function init( stage:Stage ):void
		{
			_frameCount = 0;
		}
		
		static public function update():void
		{
			_frameCount++;
		}
	}

}