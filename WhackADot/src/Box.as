package  
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/// Grow a Box, if clicked tell main to score it
	public class Box extends Sprite
	{
		private const MAX_FRAMES_ALIVE:int = 60;
		
		private var main	:Main;		// Reference back to main (game) class.
		private var frame	:int = 0;	// Internal counter
		
		
		/**
		 * CTOR
		 * @param	main	Reference back to the main game class.
		 */
		public function Box( main:Main ) 
		{
			this.main = main;
			
			addEventListener( Event.ENTER_FRAME, onFrame );				// animation
			addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );		// input listening
		}
		
		/// Update animation, and check if Box has existed long enough that it can be destroyed
		public function onFrame( e:Event ):void
		{
			// Advance frame, destory if maximum lifetime is reached
			frame++;
			if (frame == MAX_FRAMES_ALIVE )
				destroy();
			
			graphics.clear();
			
			// The size and alpha of Box are both based on the frame # it has been alived.
			var percent:Number = (MAX_FRAMES_ALIVE - frame) / MAX_FRAMES_ALIVE;
			graphics.beginFill( 0xcc00ee, percent);
			
			graphics.drawRect( 0, 0, frame * 3, frame * 3 );
			
			graphics.endFill();
		}
		
		/// Destroy self
		private function destroy():void
		{
			// Remove listeners			
			removeEventListener( Event.ENTER_FRAME, onFrame );
			removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
			// Tell whatever is holding this in the display list to disconnect this 
			// sprite from the draw calls
			parent.removeChild( this );
		}
		
		
		private function onMouseDown( e:MouseEvent ):void 
		{
			main.addToScore();
			destroy();
		}
	}

}