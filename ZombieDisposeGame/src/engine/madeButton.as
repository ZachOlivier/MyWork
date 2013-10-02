package engine 
{
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	
	public function makeButton( text:String, callback:Function ) :Sprite
	{
		var bp:ButtonPure = new ButtonPure( text, callback );
		return bp;
	}
}