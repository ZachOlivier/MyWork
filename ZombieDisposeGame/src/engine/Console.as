package engine 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextLineMetrics;
	
	
	/// Display output to the string
	public class Console extends Sprite
	{
		private static const MAX:int = 26;
		
		/// Singleton support
		private static var _instance:Console;
		public static function getInstance():Console {
			if ( _instance == null ) 
				_instance = new Console( new LOCK() );
			return _instance;
		}
		
		
		/// Text fields used to display content
		private var fields:Vector.<TextField>;
		
		/// History buffer of all previous output
		private var history:Vector.<String>;
		
		
		/**
		 * CTOR, not externally creatable because the type that is
		 * required is hidden in this file.
		 */
		function Console( singleton:LOCK )
		{
			clear();
		}
		
		private function realize():void
		{
			var tf:TextField;
			var tfIndex:int =  fields.length;
			
			for (var i:int = history.length - 1; i > -1; i-- )
			{
				// Select the next textfield; bail if past the first one.
				tfIndex--;
				if ( tfIndex < 0 )
					break;
				tf = fields[ tfIndex ];
				
				
				// Fill the text field with the contents from the history
				tf.text = history[i];
			}
		}
		
		public function clear():void
		{
			// Allocate memory
			fields = new Vector.<TextField>( MAX );
			history = new Vector.<String>();
			
			// Create default text fields
			var tf:TextField;
			for ( var i:int = 0; i < MAX; i++ )
			{
				tf = systf();
				fields.push( tf );			
				Display.console.addChild( tf );
				tf.y = 18 * i;
			}
			
			realize();
		}
		
		/// Add a line of text
		public function add( text:String ):void
		{
			history.push( text );
			realize();
		}
		
	}

}


/// By being internal only classes in this file can instantiate a lock file
internal class LOCK
{
	
}