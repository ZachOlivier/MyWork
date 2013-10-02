package engine 
{
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public function makeButton( text:String, func:Function ) :Sprite
	{
		var bp:ButtonPure = new ButtonPure( text, func );
		return bp;
	}
}