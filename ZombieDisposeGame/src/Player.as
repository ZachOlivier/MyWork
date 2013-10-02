package  
{
	import engine.Input;
	import engine.State;
	import engine.Time;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;

	public class Player extends Sprite
	{
		private const SPEED:int = 70;
		
		
		public var halfWidth	:Number = 5;
		public var halfHeight	:Number = 7;
		
		
		/// CTOR
		public function Player() 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0xddddee );
			g.drawRect(0, 0, 10, 14);
			g.endFill();
		}

		
		/// Per frame update
		public function update():void
		{			
			if ( Input.getKey( Keyboard.S ) || Input.getKey( Keyboard.DOWN ) )
				this.y += SPEED * Time.deltaTime;
			if ( Input.getKey( Keyboard.W ) || Input.getKey( Keyboard.UP ) )
				this.y -= SPEED * Time.deltaTime;
				
			if ( Input.getKey( Keyboard.D ) || Input.getKey( Keyboard.RIGHT ) )
				this.x += SPEED * Time.deltaTime;
			if ( Input.getKey( Keyboard.A ) || Input.getKey( Keyboard.LEFT) )
				this.x -= SPEED * Time.deltaTime;
				
			if ( Input.getKey( Keyboard.SPACE ) || Input.getMouseButton( 0 ) )
				fire();				
		}
		
		
		/// Simple AABB collision 
		public function isColliding( zombie:Zombie ) :Boolean
		{			
			// First check horizontal...
			var length	: Number = halfWidth + zombie.halfWidth;	// minimum distance between centers before collision
			var diff	: Number = Math.abs( x - zombie.x);		// actual distance between centers
			
			if ( diff < length )
			{
				// Horizon is overlapping, now check vertical.
				
				length 	= halfHeight + zombie.halfHeight;
				diff	= Math.abs( y - zombie.y );
				
				// If vertically shorter, there is collision
				if ( diff < length )
					return true;
			}
			
			return false;
		}
		
		
		/// Being a fire action
		private function fire() :void
		{
			var mouse	:Vector3D = Input.mousePosition;
			
			var point	:Point = new Point( mouse.x, mouse.y );
			var bullet	:Bullet = new Bullet( this, point );
			
			(State.current as GameState).addBullet( bullet );			
		}
		
	}

}