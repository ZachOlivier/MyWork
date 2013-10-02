package  
{
	import engine.Display;
	import engine.Time;
	import engine.IDisposable;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	
	/**
	 * Projectile
	 */
	public class Bullet extends Sprite implements IDisposable
	{
		private const SPEED:Number = 100;
		
		private var direction:Vector3D;

		
		/// CTOR
		public function Bullet( start:Sprite, target:Point ) 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0xFFFFFF );
			g.drawCircle( 0, 0, 4 );
			g.endFill();
			
			this.x = start.x;
			this.y = start.y;
			
			/// Set the direction of the bullet base on vector
			/// created from the start to the target
			direction = new Vector3D();
			direction.x = (start.x - target.x);
			direction.y = (start.y - target.y);
			direction.normalize();
		}
	
		/// @see IDisposable
		public function dispose() :void
		{
			if ( parent ) 
				parent.removeChild( this );	
				
			removeEventListener( Event.ENTER_FRAME, onFrame );
			graphics.clear();
		}
		
		
		/**
		 * Update every logic frame (timer)
		 * 
		 * @param	zombies, reference to collection of zombies
		 * @return	If it should be destoryed
		 */
		public function update( zombies:Vector.<Zombie> ) :Boolean
		{
			const MIN_COLLISION_CHECK_PIXELS:int = 64;
			
			// Move bullet
			var v:Vector3D = new Vector3D( direction.x, direction.y );
			v.scaleBy( SPEED * Time.deltaTime );
			this.x -= v.x;
			this.y -= v.y;
			
			// If out of boundries, destroy it.
			if ( 	this.x + this.width < 0 	|| 
					this.y + this.height < 0 	||
					this.x > Display.width  	||
					this.y > Display.height 	)
			{
				dispose();
				return true;
			}
			
			// If hits a zombie
			var len:int  = zombies.length;
			var zombie:Zombie;
			for ( var i:int = len - 1; i >= 0; i-- )
			{
				zombie = zombies[i];	// reference to zombie in collection
				
				// If a quick, rough check is true...
				if ( Math.abs( this.x - zombie.x ) < MIN_COLLISION_CHECK_PIXELS ||
					 Math.abs( this.y - zombie.y ) < MIN_COLLISION_CHECK_PIXELS )
				{
					// ...then do an expensive collision checks.
					if ( this.hitTestObject( zombie ) )
					{
						// Oh my, this bullet and the zombie are colliding...
						zombie.dispose();
						startExplosion();	// BOOM!
						Global.score++;		// bling bling
						return true;		// bail early, this is indeed colliding
					}
				}
			}
			
			return false;			// nope, no collision
		}
		
	
		/// Being the explosion of the bullet
		private function startExplosion():void
		{
			direction.x = 0; // repurpose the direction variable!
			addEventListener( Event.ENTER_FRAME, onFrame );
		}
		
		
		/// Special per-frame update when playing an effect
		private function onFrame( e:Event ):void
		{
			const SIZE:int = 14;
			
			direction.x++;

			graphics.clear();
			graphics.beginFill(0xff2222, (SIZE - direction.x) / SIZE)
			graphics.drawCircle( 0, 0, direction.x )
			graphics.endFill();
			
			if ( direction.x >= SIZE )
				dispose();
		}
	}

}