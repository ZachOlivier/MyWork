package engine 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getTimer;
	import flash.utils.Timer;

	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class Time 
	{
		static private var _frameCount	:uint 	= 0;
		static private var _deltaTime	:Number = 0;
		static private var now			:uint	= 0;
		static private var last			:uint 	= 0;
		
		
		/// How many frames have passed since the start of the game.
		static public function get frameCount()	:uint { return _frameCount; }
		
		/// Time in seconds since the last frame passed.
		static public function get deltaTime()	:Number { return _deltaTime; }
	
		
		/// Initialize sub-system
		static public function init( stage:Stage ):void
		{
			_frameCount = 0;
		}
		
		
		static public function update():void
		{
			now = getTimer();
			
			_frameCount++;
			_deltaTime = (now - last) / 1000; 
			
			last = now;
		}
	}
}