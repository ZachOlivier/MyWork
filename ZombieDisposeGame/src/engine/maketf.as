package engine
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	

	/// Helper function that makes a textfield for a consisent style throughout program.
	public function maketf( size:int = 35 ):TextField
	{
		var tf:TextField = new TextField();			
		tf.defaultTextFormat 		= new TextFormat("Arial", size, 0xff0000, true );
		tf.defaultTextFormat.align 	= TextFormatAlign.CENTER;
		
		tf.embedFonts   = false;
		tf.autoSize 	= TextFieldAutoSize.LEFT;
		tf.y 			= size * 0.5;
		tf.mouseEnabled = false;
		
		return tf;
	}
}