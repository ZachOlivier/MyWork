package engine
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	

	/// Create a "system" text field.
	function systf( size:int = 16 ):TextField
	{
		var tf:TextField 			= new TextField();
		tf.defaultTextFormat 		= new TextFormat("Courier New", size, 0x00dd00, true );
		tf.defaultTextFormat.align 	= TextFormatAlign.LEFT;
		
		tf.width		= Display.width;
		tf.embedFonts   = false;
		tf.mouseEnabled = false;
		
		return tf;
	}
}