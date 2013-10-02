package  
{
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.ui.Keyboard;
	import utils.Display;
	import utils.Input;
	import utils.Resource;

	
	/**
	 * ...
	 */
	public class Player extends Resource
	{
		public var X			: Number = 0;
		public var Y			: Number = 0;		
		public var halfWidth	: Number = 30;
		public var halfHeight	: Number = 30;
		public var color		: int = 0;
		
		// my bitmaps
		public var redPlayerDown:Bitmap = new RedPlayerDown();
		public var redPlayerLeft:Bitmap = new RedPlayerLeft();
		public var redPlayerRight:Bitmap = new RedPlayerRight();
		public var redPlayerUp:Bitmap = new RedPlayerUp();
		public var bluePlayerDown:Bitmap = new BluePlayerDown();
		public var bluePlayerLeft:Bitmap = new BluePlayerLeft();
		public var bluePlayerRight:Bitmap = new BluePlayerRight();
		public var bluePlayerUp:Bitmap = new BluePlayerUp();
		
		// hold my bitmaps
		//public var players:Array;
		
		public var thisPlayer:Bitmap; //= players as Bitmap;
		
		// to hold the bitmaps
		public var player:Sprite;

		
		/// CTOR
		public function Player() 
		{
			//players = [redPlayerDown, redPlayerUp, redPlayerLeft, redPlayerRight, bluePlayerDown, bluePlayerUp, bluePlayerLeft, bluePlayerRight];
			
			//thisPlayer = players[0];
			
			player = new Sprite();
			
			thisPlayer = redPlayerDown;
			
			player.addChild(thisPlayer);
			
			player.width = halfWidth * 2;
			player.height = halfHeight * 2;
			
			// Start player 75% of the way across the screen and
			// half way (50%) down the screen.
			X = Display.width * 0.75;
			Y = Display.height * 0.5;
		}
		
		
		
		public function update():void
		{
			// Check input if movement should occur. Color = 0 is red.
			if ( Input.isDown( Keyboard.DOWN ) && (color == 0) ) {
				thisPlayer = redPlayerDown;
				player.y += 10;
			}
			if ( Input.isDown( Keyboard.UP ) && (color == 0) ) {
				thisPlayer = redPlayerUp;
				player.y -= 10;
			}
			if ( Input.isDown( Keyboard.LEFT ) && (color == 0) ) {
				thisPlayer = redPlayerLeft;
				player.x -= 10;
			}
			if ( Input.isDown( Keyboard.RIGHT ) && (color == 0) ) {
				thisPlayer = redPlayerRight;
				player.x += 10;
			}
			
			// If color = 1, the player will be blue.
			if ( Input.isDown( Keyboard.DOWN ) && (color == 1) ) {
				thisPlayer = bluePlayerDown;
				player.y += 10;
			}
			if ( Input.isDown( Keyboard.UP ) && (color == 1) ) {
				thisPlayer = bluePlayerUp;
				player.y -= 10;
			}
			if ( Input.isDown( Keyboard.LEFT ) && (color == 1) ) {
				thisPlayer = bluePlayerLeft;
				player.x -= 10;
			}
			if ( Input.isDown( Keyboard.RIGHT ) && (color == 1) ) {
				thisPlayer = bluePlayerRight;
				player.x += 10;
			}
			
			// Change color
			if ( Input.isDown( Keyboard.Z ) )		color = 0;
			if ( Input.isDown( Keyboard.X ) )		color = 1;
			
			if ( player.x < 0 )
				player.x += Display.width;
			
			if ( player.x > Display.width )
				player.x -= Display.width;
				
			if ( player.y < 0 )
				player.y += Display.height;
				
			if ( player.y > Display.height )
				player.y -= Display.height;
			
			//thisPlayer.width = halfWidth * 2;
			//thisPlayer.height = halfHeight * 2;
			
			Display.game.addChild(player)
			player.addChild(thisPlayer);
			
		}
		
		
		/// Simple AABB collision 
		public function isColliding( enemy:Enemy ) :Boolean
		{			
			// First check horizontal...
			var length	: Number = halfWidth + enemy.halfWidth;	// minimum distance between centers before collision
			var diff	: Number = Math.abs( X - enemy.x);		// actual distance between centers
			
			if ( diff < length )
			{
				// Horizon is overlapping, now check vertical.
				
				length 	= halfHeight + enemy.halfHeight;
				diff	= Math.abs( Y - enemy.y );
				
				// If vertically shorter, there is collision
				if ( diff < length )
					return true;
			}
			
			return false;
		}
		
	}

}