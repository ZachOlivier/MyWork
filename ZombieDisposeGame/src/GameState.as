package  
{
	import engine.center;
	import engine.Console;
	import engine.Display;
	import engine.Input;
	import engine.IState;
	import engine.State;
	import engine.Systems;
	import engine.Time;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.ui.Keyboard;

	
	public class GameState implements IState
	{
		private const ZOMBIE_BASE		:int = 50;	// guaranteed # of zombies
		private const ZOMBIE_MULTIPLIER	:int = 10;	// how many more zombies per level
		
		public const NEW_LEVEL			:int = 1;
		
		private var player	:Player;
		private var zombies	:Vector.<Zombie>;
		private var bullets	:Vector.<Bullet>;
		
		
		/// CTOR - minimize putting any code in here!
		public function GameState()
		{
		}

		
		/// @see IState
		public function start():void
		{
			Display.main.removeChildren();
			
			Display.stage.color = 0x000000;
			
			player = new Player();
			Display.main.addChild( player );
			center( player );
			
			bullets = new Vector.<Bullet>();
			zombies = new Vector.<Zombie>();
			var zombie:Zombie;
			var point:Point;
			for ( var i:int = 0; i < (ZOMBIE_BASE + (Global.level * ZOMBIE_MULTIPLIER) ); i++ )
			{
				zombie = new Zombie( player );
				zombies.push( zombie );			// track all zombies outselves

				// Layout zombie on the screen
				point = getRandomPointOnRect( Display.width, Display.height );
				Display.main.addChild( zombie );
				zombie.x = point.x;
				zombie.y = point.y;
			}

		}
		
		
		/// @see IState
		public function update():void
		{
			var zombie:Zombie;
			
			var delta:Number = Time.deltaTime;	// cache delta value, used frequently
			
			player.update();
			
			var len:int = zombies.length;
			for ( var i:int = len - 1; i >= 0; i-- )
			{
				zombie = zombies[i];
				
				if ( player.isColliding( zombie ) )
				{
					youLose();
				}
				
				if ( zombies[i].isDisposed )
				{
					// Remove object from both vector and display list
					Display.main.removeChild( zombies.splice( i, 1 )[0] );
					
					//Systems.console.add( "You Killed A Zombie!" );
					
					Global.score++;
				}
				else
				{
					zombies[i].update( delta );
				}
			}
			
			
			len = bullets.length;
			for ( i = len - 1; i >= 0; i-- )
			{
				if ( bullets[i].update( zombies ) )
					bullets.splice( i, 1 );
			}

			
			if ( zombies.length == 0 )
			{
				newLevel();
				
				if ( Global.level == 4 )
				{
					youWin();
				}
			}
		}
		
		
		public function addBullet( bullet:Bullet ):void
		{
			bullets.push( bullet );
			Display.main.addChild( bullet );
		}
		
		
		/// @see IState
		public function end():void
		{
			Display.main.removeChild( player );
		}
		
		public function newLevel():void
		{
			Global.level = Global.level + NEW_LEVEL;
			
			State.current = new GameState();
		}
		
		public function youWin():void
		{
			State.current = new WinState();
		}
		
		public function youLose():void
		{
			State.current = new LoseState();
		}
	}
}