package  
{
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Vector3D;
	import utils.Display;
	import utils.Resource;
	
	
	/**
	 * Tiny square that moves around, like the punk it is!
	 */
	public class Enemy extends Resource
	{
		public var X			: Number = 0;
		public var Y			: Number = 0;
		public var halfWidth	: Number = 15;
		public var halfHeight	: Number = 15;
		public var color		: int = 0;
		
		
		private var dirx	: Number = 0;
		private var diry	: Number = 0;
		
		// my bitmaps
		public var blueEnemyDown:Bitmap = new BlueEnemyDown();
		public var blueEnemyLeft:Bitmap = new BlueEnemyLeft();
		public var blueEnemyRight:Bitmap = new BlueEnemyRight();
		public var blueEnemyUp:Bitmap = new BlueEnemyUp();
		public var redEnemyDown:Bitmap = new RedEnemyDown();
		public var redEnemyLeft:Bitmap = new RedEnemyLeft();
		public var redEnemyRight:Bitmap = new RedEnemyRight();
		public var redEnemyUp:Bitmap = new RedEnemyUp();
		
		public var thisEnemy:Bitmap;
		
		// to hold the bitmaps
		public var enemy:Sprite;
		
		
		/// CTOR
		public function Enemy() 
		{
			enemy = new Sprite();
			
			thisEnemy = redEnemyDown;
			
			enemy.addChild(thisEnemy);
			
			enemy.width = halfWidth * 2;
			enemy.height = halfHeight * 2;
			
			// set random position on left side of the screen.
			enemy.x = Math.random() * (Display.width / 2);
			enemy.y = Math.random() * Display.height;
			
			
			// Pick # at random; if 1 set color to red, otherwise make it blue.
			color = int( Math.random() * 2 ) ? color = 0 : color = 1;
			
			// Pick a random direction to move by first choosing an angle, and then
			// doing some slick (yet simple) trig to figure out the X, Y.
			var degrees:Number = Math.random() * 360;
			
			// First convert "degrees" to radians
			var radians:Number = degrees * 0.017453;
			
			dirx = Math.cos( radians );
			diry = Math.sin( radians );
		}
		
		
		/// Called from somewhere else
		public function update():void
		{
			// Change location
			enemy.x += dirx;
			enemy.y += diry;
			
			/*// Change location
			redEnemyUp.x += dirx;
			redEnemyUp.y -= diry;
			
			// Change location
			redEnemyLeft.x += dirx;
			redEnemyLeft.y += diry;
			
			// Change location
			redEnemyRight.x -= dirx;
			redEnemyRight.y += diry;
			
			// Change location
			blueEnemyDown.x += dirx;
			blueEnemyDown.y += diry;
			
			// Change location
			blueEnemyUp.x += dirx;
			blueEnemyUp.y -= diry;
			
			// Change location
			blueEnemyLeft.x += dirx;
			blueEnemyLeft.y += diry;
			
			// Change location
			blueEnemyRight.x -= dirx;
			blueEnemyRight.y += diry;*/
			
			// Check for screen wrapping
			if ( enemy.x < 0 )
				enemy.x += Display.width;
			
			if ( enemy.x > Display.width )
				enemy.x -= Display.width;
				
			if ( enemy.y < 0 )
				enemy.y += Display.height;
				
			if ( enemy.y > Display.height )
				enemy.y -= Display.height;
				
			/*// Check for screen wrapping
			if ( redEnemyUp.x < 0 )
				redEnemyUp.x += Display.width;
			
			if ( redEnemyUp.x > Display.width )
				redEnemyUp.x -= Display.width;
				
			if ( redEnemyUp.y < 0 )
				redEnemyUp.y += Display.height;
				
			if ( redEnemyUp.y > Display.height )
				redEnemyUp.y -= Display.height;
				
			// Check for screen wrapping
			if ( redEnemyLeft.x < 0 )
				redEnemyLeft.x += Display.width;
			
			if ( redEnemyLeft.x > Display.width )
				redEnemyLeft.x -= Display.width;
				
			if ( redEnemyLeft.y < 0 )
				redEnemyLeft.y += Display.height;
				
			if ( redEnemyLeft.y > Display.height )
				redEnemyLeft.y -= Display.height;
				
			// Check for screen wrapping
			if ( redEnemyRight.x < 0 )
				redEnemyRight.x += Display.width;
			
			if ( redEnemyRight.x > Display.width )
				redEnemyRight.x -= Display.width;
				
			if ( redEnemyRight.y < 0 )
				redEnemyRight.y += Display.height;
				
			if ( redEnemyRight.y > Display.height )
				redEnemyRight.y -= Display.height;
				
				// Check for screen wrapping
			if ( blueEnemyDown.x < 0 )
				blueEnemyDown.x += Display.width;
			
			if ( blueEnemyDown.x > Display.width )
				blueEnemyDown.x -= Display.width;
				
			if ( blueEnemyDown.y < 0 )
				blueEnemyDown.y += Display.height;
				
			if ( blueEnemyDown.y > Display.height )
				blueEnemyDown.y -= Display.height;
				
			// Check for screen wrapping
			if ( blueEnemyUp.x < 0 )
				blueEnemyUp.x += Display.width;
			
			if ( blueEnemyUp.x > Display.width )
				blueEnemyUp.x -= Display.width;
				
			if ( blueEnemyUp.y < 0 )
				blueEnemyUp.y += Display.height;
				
			if ( blueEnemyUp.y > Display.height )
				blueEnemyUp.y -= Display.height;
				
			// Check for screen wrapping
			if ( blueEnemyLeft.x < 0 )
				blueEnemyLeft.x += Display.width;
			
			if ( blueEnemyLeft.x > Display.width )
				blueEnemyLeft.x -= Display.width;
				
			if ( blueEnemyLeft.y < 0 )
				blueEnemyLeft.y += Display.height;
				
			if ( blueEnemyLeft.y > Display.height )
				blueEnemyLeft.y -= Display.height;
				
			// Check for screen wrapping
			if ( blueEnemyRight.x < 0 )
				blueEnemyRight.x += Display.width;
			
			if ( blueEnemyRight.x > Display.width )
				blueEnemyRight.x -= Display.width;
				
			if ( blueEnemyRight.y < 0 )
				blueEnemyRight.y += Display.height;
				
			if ( blueEnemyRight.y > Display.height )
				blueEnemyRight.y -= Display.height;*/
				
				
			switch (color)
			{
			case 0 :
				
					if (dirx > diry)
					{
						thisEnemy = redEnemyRight;
						enemy.addChild(thisEnemy);
						//Display.game.addChild(redEnemyRight)
						//redEnemyRight.width = halfWidth * 2;
						//redEnemyRight.height = halfHeight * 2;
					}
						
					if (dirx < diry)
					{
						thisEnemy = redEnemyLeft;
						enemy.addChild(thisEnemy);
						//8Display.game.addChild(redEnemyLeft)
						//redEnemyLeft.width = halfWidth * 2;
						//redEnemyLeft.height = halfHeight * 2;
					}
					
					if (diry > dirx)
					{
						thisEnemy = redEnemyDown;
						enemy.addChild(thisEnemy);
						//Display.game.addChild(redEnemyDown)
						//redEnemyDown.width = halfWidth * 2;
						//redEnemyDown.height = halfHeight * 2;
					}
					
					if (diry < dirx)
					{
						thisEnemy = redEnemyUp;
						enemy.addChild(thisEnemy);
						/*Display.game.addChild(redEnemyUp)
						redEnemyUp.width = halfWidth * 2;
						redEnemyUp.height = halfHeight * 2;*/
					}
					
					break;
				
			case 1 :
				
					if (dirx > diry)
					{
						thisEnemy = blueEnemyRight;
						enemy.addChild(thisEnemy);
						//Display.game.addChild(blueEnemyRight)
						//blueEnemyRight.width = halfWidth * 2;
						//blueEnemyRight.height = halfHeight * 2;
					}
						
					if (dirx < diry)
					{
						thisEnemy = blueEnemyLeft;
						enemy.addChild(thisEnemy);
						//Display.game.addChild(blueEnemyLeft)
						//blueEnemyLeft.width = halfWidth * 2;
						//blueEnemyLeft.height = halfHeight * 2;
					}
					
					if (diry > dirx)
					{
						thisEnemy = blueEnemyDown;
						enemy.addChild(thisEnemy);
						//Display.game.addChild(blueEnemyDown)
						//blueEnemyDown.width = halfWidth * 2;
						//blueEnemyDown.height = halfHeight * 2;
					}
					
					if (diry < dirx)
					{
						thisEnemy = blueEnemyUp;
						enemy.addChild(thisEnemy);
						//Display.game.addChild(blueEnemyUp)
						//blueEnemyUp.width = halfWidth * 2;
						//blueEnemyUp.height = halfHeight * 2;
					}
					
					
					break;
			}
			
			Display.game.addChild(enemy);
				
		}
	}

}