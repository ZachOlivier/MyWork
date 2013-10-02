package  
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Vector3D;
	import engine.IDisposable;

	/**
	 * Enemy
	 */
	public class Zombie extends Sprite implements IDisposable
	{
		private const SPEED:Number = 20;
		
		private var target	:Sprite;
		private var speed	:Number;
		
		public var halfWidth	:Number = 5;
		public var halfHeight	:Number = 7;
		
		public var isDisposed:Boolean = false;
		
		
		/// CTOR
		public function Zombie( target:Sprite ) 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x33ee22 );
			g.drawRect(0, 0, 10, 14);
			g.endFill();
			
			speed = SPEED + (Math.random() * 5);
			
			this.target = target;
		}
		
		
		/// psuedo destructor
		public function dispose() :void
		{
			target = null;
			isDisposed = true;
		}
		
		public function update( delta:Number ) :void
		{
			var v:Vector3D = new Vector3D();
			v.x = (this.x - target.x);
			v.y = (this.y - target.y);
			v.normalize();
			v.scaleBy( speed * delta );
			this.x -= v.x;
			this.y -= v.y;
		}
		
	}

}