package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import utils.Display;
	import utils.Input;
	
	
	/**
	 * Game Loop - (traditional) via update cascade
	 */
	public class Main extends Sprite 
	{
		private const MAX_ENEMIES :int = 20;
		
		private var score	: int = 0;
		private var player	: Player;
		private var enemies	: Vector.<Enemy>;
		
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Intialization the display system
			Display.init( stage );
			
			// Setup input system
			Input.init( stage );

			var enemy:Enemy;	// placeholder variable to hold reference
			
			// Allocate and fill in enemies
			enemies = new Vector.<Enemy>();
			for (var i:int = 0; i < MAX_ENEMIES; i++) 
			{
				enemy = new Enemy();							// allocate
				enemies.push( enemy );							// add to collection
			}
			
			// Allocate player
			player = new Player();

			
			var tf:TextField = new TextField();
			tf.defaultTextFormat = new TextFormat("Arial", 16 );
			tf.text = "Arrows to move, z for blue, x for red.";
			tf.width = 300;
			Display.ui.addChild( tf );
			
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		
		/// Called once per tick
		private function update( e:Event ):void
		{
			// Temporary variable used to hold reference as iterating through collection.
			var enemy:Enemy;
			

			// Update enemies
			var len:int = enemies.length;
			for ( var i:int = 0; i < len; i++ )
			{
				enemy = enemies[i];
				enemy.update();
			}
			
			// Update player
			player.update();
			
			
			// Collision check, go backwards as colliding enemies are sliced out.
			for ( i = len - 1; i >= 0 ; i-- )
			{
				enemy = enemies[i];
				if ( player.isColliding( enemy ) )
				{
					if ( player.color == enemy.color )
					{
						enemies.splice( i, 1 ); // remove enemy square from screen
						score++;						
					}
					else
					{
						// woops player is different color...
						lose();
						return;
					}
				}
			}
			
			if ( enemies.length == 0 )
				win();
		}
		
		
		private function win():void 	{ endGame("You win! score: " + score); }
		private function lose():void 	{ endGame("You lose! score: " + score); }
	
		
		private function endGame( msg:String ):void
		{
			var tf:TextField 	= new TextField();
			tf.defaultTextFormat= new TextFormat("Arial", 32, null, null, null, null, null, null, TextFormatAlign.CENTER);
			tf.width 			= Display.width;
			tf.text 			= msg;
			
			Display.game.addChild( tf );
			tf.y = Display.height * 0.33;
			
			removeEventListener( Event.ENTER_FRAME, update );
		}
		
	}
	
}