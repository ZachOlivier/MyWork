package utils 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	
	
	/**
	 *	Input Manager
	 */
	public class Input 
	{
		static private var keys:Array;
		
		
		static public function init( stage:Stage ):void 
		{
			keys = []; // this is a shortcut for typing new Array(255);
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
			stage.addEventListener( KeyboardEvent.KEY_UP, 	onKeyUp );
		}
		
		static public function onKeyDown( e:KeyboardEvent ):void
		{
			keys[ e.keyCode ] = 1;
		}
		
		static public function onKeyUp( e:KeyboardEvent ):void
		{
			keys[ e.keyCode ] = 0;
		}
		
		static public function isDown( code:uint ):Boolean
		{
			return keys[ code ] == 1;
		}
	}

}