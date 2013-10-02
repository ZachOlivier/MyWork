package  
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class ShellState implements IState
	{
		private var drunkMeter			:DrunkMeter;
		private var player				:Player;
		
		
		// Don't add to this CTOR
		public function ShellState()
		{
		}
		
		
		// When the game changes to this state, add this once
		public function start():void
		{
			// Create my drunk meter, place it, size it and add it to the display
			drunkMeter = new DrunkMeter();
			drunkMeter.x = 150;
			drunkMeter.width = 350;
			Display.ui.addChild( drunkMeter );
			
			// Create my player, place it, size it and add it to the display
			player = new Player();
			player.width = 80;
			player.height = 96;
			player.y = Display.height / 2;
			Display.ui.addChild( player );
			
			// Create my text fields, place them and add them to the display
			var tfRedScore:TextField = maketf();
			tfRedScore.text = "RED " + Global.redScore + " / 10";
			tfRedScore.x = 620;
			tfRedScore.y = 0;
			Display.ui.addChild( tfRedScore );
			
			var tf:TextField = maketf();
			tf.text = "Are You Ready To DRINK!?!";
			tf.x = 160;
			tf.y = 80;
			Display.ui.addChild( tf );
			
			// Create my cocktail, place it and add it to the display
			var cocktail:Bitmap = new Resources.RedCocktail;
			cocktail.x = 450;
			cocktail.y = 200;
			Display.ui.addChild ( cocktail );
			
			// Create my button, place it and add it to the display
			var button:Sprite = makeButton( "   Start Drinking!", clickPlay );
			button.x = 120;
			button.y = Display.height - 270;
			Display.ui.addChild( button );
		}
		
		
		// Constantly update this state until the game changes states
		public function update():void
		{
			// Update the player
			player.update();
		}
		
		
		// When the game goes to a new state
		public function end():void
		{
			// Clear the display
			Display.clear();
		}
		
		
		// My function for sending the game to the game state
		public function clickPlay( button:ButtonPure ):void
		{
			State.current = new GameState();
		}
	}
}