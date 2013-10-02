package 
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class Player extends Sprite
	{
		private const SPEED		:int 	= 25;
		
		public var face			:int	= 0;
		
		public var halfWidth	:Number = 40;
		public var halfHeight	:Number = 48;
		
		public var mouthOpen	:Boolean = true;
		
		public var thisPlayer	:Bitmap;
		
		
		// CTOR
		public function Player()
		{
			// Set the player and add the bitmap to the sprite player
			thisPlayer = new Resources.MouthOpen;
			thisPlayer.width = halfWidth * 2;
			thisPlayer.height = halfHeight * 2;
			addChild( thisPlayer );
		}
		
		
		// Update the player when called
		public function update():void
		{
			// If the player pushes s or arrow down
			if ( Input.getKey( Keyboard.S ) || Input.getKey( Keyboard.DOWN ) )
			{
				// Move the player down
				this.y += SPEED;
			}
			
			// If the player pushes w or arrow up
			if ( Input.getKey( Keyboard.W ) || Input.getKey( Keyboard.UP ) )
			{
				// Move the player up
				this.y -= SPEED;
			}
			
			// If the player pushes space or the left mouse button
			if ( Input.getKeyDown( Keyboard.SPACE ) || Input.getMouseButtonDown( 0 ) )
			{
				// Change the face
				face++;
				
				// If face is greater than 1, set face to 0
				if ( face > 1 )
				{
					face = 0;
				}
				
				// Depending on if the player clicks
				switch ( face )
				{
					// Change the player and decide whether the player can touch cocktails
					case 0 :
						removeChild( thisPlayer );
						thisPlayer = new Resources.MouthOpen;
						thisPlayer.width = halfWidth * 2;
						thisPlayer.height = halfHeight * 2;
						addChild( thisPlayer );
						mouthOpen = true;
						Systems.sound.play( Resources.OpenMouth );
						break;
					case 1 :
						removeChild( thisPlayer );
						thisPlayer = new Resources.MouthClosed;
						thisPlayer.width = halfWidth * 2;
						thisPlayer.height = halfHeight * 2;
						addChild( thisPlayer );
						mouthOpen = false;
						Systems.sound.play( Resources.MouthClose );
						break;
				}
			}
			
			// If the player's y position is too far down
			if ( this.y > Display.height - 86 )
			{
				// Stop the player from moving
				this.y -= 25;
			}
			
			// If the player's y position is too far up
			if ( this.y < 0 )
			{
				// Stop the player from moving
				this.y += 25;
			}
		}
		
		
		// My function for deciding if the player is colliding with a cocktail
		public function isColliding( cocktail:Cocktail ):Boolean
		{
			var length		:Number = ( halfWidth + cocktail.halfWidth );
			var diff		:Number = Math.abs( this.x - cocktail.x );
			
			if ( diff < length )
			{
				length 	= ( halfHeight + cocktail.halfHeight );
				diff	= Math.abs( this.y - cocktail.y );
				
				if ( diff < length )
				{
					return true;
				}
			}
			
			return false;
		}
	}
}