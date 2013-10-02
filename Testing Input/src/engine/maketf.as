package engine
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	

	/// Create text field.
	public function maketf( size:int = 32 ):TextField
	{
		var tf:TextField 			= new TextField();
		tf.defaultTextFormat 		= new TextFormat("Arial", size, 0x000000, true );
		tf.defaultTextFormat.align 	= TextFormatAlign.CENTER;
		
		tf.width		= Display.width;
		tf.embedFonts   = false;
		tf.mouseEnabled = false;
		
		return tf;
	}
}