package engine 
{
	import engine.Time;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class Systems 
	{
		private static var isInit	:Boolean = false;
	
		public static var console	:Console;
		public static var sound		:SoundManager;
		
		
		/// Initialize sub-systems in the proper order (and prevent re-initialization).
		static public function init( stage:Stage ):void 
		{
			if ( isInit )
				return;
				
			Time.init( stage );
			Display.init( stage );
			Input.init( stage );
			
			sound = new SoundManager();
			
			console = Console.getInstance();
			
			isInit = true;
		}
	}
}