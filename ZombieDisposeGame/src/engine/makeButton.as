package engine 
{
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	
	public function makeButton( text:String, func:Function ) :Sprite
	{
		var bp:ButtonPure = new ButtonPure( text, func );
		return bp;
	}
}