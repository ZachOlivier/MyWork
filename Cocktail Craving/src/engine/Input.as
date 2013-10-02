package engine
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	/**
	 *	Input Manager
	 */
	public class Input
	{
		static private const MOUSE_LEFT_BUTTON: uint = 0;
		
		static private const UP			: uint = 0;
		static private const PRESS		: uint = 1;
		static private const HELD		: uint = 2;

		static private const START_PRESS:uint = 9999;
		
		
		static private var keys		: Vector.<uint>;
		static private var active	: Vector.<KeyState>;
		
		static public var mousePosition	:Vector3D;
		
		
		static public function init( stage:Stage ):void
		{
			stage.removeEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
			stage.removeEventListener( KeyboardEvent.KEY_UP, 	onKeyUp );
			
			stage.removeEventListener( MouseEvent.MOUSE_DOWN, 	onMouseDown );
			stage.removeEventListener( MouseEvent.MOUSE_UP, 	onMouseUp );
			//stage.removeEventListener( MouseEvent.MOUSE_MOVE, 	onMouseMove );
			
			keys 	= new Vector.<uint>(256);		// state of all keys
			active 	= new Vector.<KeyState>();		// only keys in a state other than up

			mousePosition = new Vector3D();
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
			stage.addEventListener( KeyboardEvent.KEY_UP, 	onKeyUp );
			
			stage.addEventListener( MouseEvent.MOUSE_DOWN, 	onMouseDown );
			stage.addEventListener( MouseEvent.MOUSE_UP, 	onMouseUp );
			//stage.addEventListener( MouseEvent.MOUSE_MOVE, 	onMouseMove );
		}
		
		
		/// Flash Event: A key was just pressed
		static public function onKeyDown( e:KeyboardEvent ):void
		{
			// If the system is sending another key down event, but the key is marked
			// as being in some other state than down; ignore it.
			if ( keys[ e.keyCode ] != UP )
				return;
			
			keys[ e.keyCode ] = START_PRESS;
			
			var keyState:KeyState = new KeyState( e.keyCode, Time.frameCount );
			active.push( keyState );
		}
		
		/// Flash Event: A key was raised
		static public function onKeyUp( e:KeyboardEvent ):void
		{
			keys[ e.keyCode ] = UP;
			
			// Loop through all active keys; there is a slight chance that
			// more than one entry for a key being "down" snuck in due to
			// how Flash / OS handles input.
			var keyState:KeyState;
			for ( var i:int = active.length - 1; i > -1; i-- )
			{
				keyState = active[i];				// get next keystate in active list
				if ( keyState.code == e.keyCode )	// if the code matches
					active.splice( i, 1 );			// remove
			}
		}
		
		
		static public function onMouseDown( e:MouseEvent ):void
		{
			keys[ MOUSE_LEFT_BUTTON ] = START_PRESS;
			var keyState:KeyState = new KeyState( MOUSE_LEFT_BUTTON, Time.frameCount );
			active.push( keyState );
		}
		

		static public function onMouseUp( e:MouseEvent ):void
		{
			keys[ MOUSE_LEFT_BUTTON ] = UP;
			
			var keyState:KeyState;
			for ( var i:int = active.length - 1; i > -1; i-- )
			{
				keyState = active[i];						// get next keystate in active list
				if ( keyState.code == MOUSE_LEFT_BUTTON )	// if the code matches
					active.splice( i, 1 );					// remove
			}
			
		}
		
		/*static public function onMouseMove( e:MouseEvent ):void
		{
			mousePosition.x = e.stageX;
			mousePosition.y = e.stageY;
		}*/
		
		
		// -----[ EXTERNAL ]--------------------------------------------------
		
		/// Call this once per frame
		static public function update():void
		{
			var code	:uint;
			var keyState:KeyState;
			
			// Go through all the inputs currently mark as being active...
			for ( var i:int = active.length - 1; i > -1; i-- )
			{
				keyState = active[i];
				code = keyState.code;
				
				// If a key is pressed and it's the frame after it was pressed,
				// change the state.
				if ( keys[code] == PRESS && keyState.frame < Time.frameCount )
				{
					keys[code] = HELD;
					continue;
				}
				
				// If a press is just starting, mark it as started and update
				// the frame for the press to be this frame.
				if ( keys[code] == START_PRESS )
				{
					keys[code] = PRESS;
					keyState.frame = Time.frameCount;
				}
			}
			
		}
		
		/// Has a key just been pressed in this frame?
		static public function getKeyDown( code:uint ):Boolean
		{
			return keys[ code ] == PRESS;
		}

		/// Is a key being held down?
		static public function getKey( code:uint ):Boolean
		{
			return keys[ code ] == HELD;
		}

		/// Has a mouse button just been pressed this frame?
		static public function getMouseButtonDown( button:uint ):Boolean
		{
			return keys[ button ] == PRESS;
		}
		
		/// Is a mouse button being held down?
		static public function getMouseButton( button:uint ):Boolean
		{
			return keys[ button ] == HELD;
		}
	}
}


internal class KeyState
{
	public var code	:uint;
	public var frame:uint;
	
	/// CTOR
	function KeyState( code:uint, frame:uint ) :void
	{
		this.code 	= code;
		this.frame 	= frame;
	}
}