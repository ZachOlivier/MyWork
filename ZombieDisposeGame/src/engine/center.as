package engine 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	
	/// Helper to center a display object (sprite, bitmap, etc...) in relation to it's parent.
	public function center( disp:DisplayObject, horzOnly:Boolean = false ) :void
	{
		if ( disp.parent == null )
			return;
		
		// Center horizontally
		disp.x = (Display.width / 2) - (disp.width / 2);
		
		// If set, center vertically as well
		if ( !horzOnly )
			disp.y = (Display.height / 2) - (disp.height / 2);
	}

}