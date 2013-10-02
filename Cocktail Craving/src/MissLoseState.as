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
	
	public class MissLoseState implements IState
	{
		// Don't add to this CTOR
		public function MissLoseState()
		{
		}
		
		
		// When the game changes to this state, add this once
		public function start():void
		{
			// Create my cocktail, place it and add it to the display
			var cocktail:Bitmap = new Resources.RedCocktail;
			cocktail.x = 310;
			cocktail.y = 150;
			Display.ui.addChild ( cocktail );
			
			// Create my text field, place it and add it to the display
			var tf:TextField = maketf();
			tf.text = "  You Missed A Red Cocktail!";
			tf.x = 150;
			tf.y = 40;
			Display.ui.addChild( tf );
			
			// Create my buttons, place them and add them to the display
			var button:Sprite = makeButton( "     Try Again?", playAgain );
			button.x = 30;
			button.y = Display.height - 70;
			Display.ui.addChild( button );
			
			button = makeButton( "         Credits", viewCredits );
			button.x = 470;
			button.y = Display.height - 70;
			Display.ui.addChild( button );
		}
		
		
		// Constantly update this state until the game changes states
		public function update():void
		{
		}
		
		
		// When the game goes to a new state
		public function end():void
		{
			// Clear the display
			Display.clear();
			
			// Reset the game
			Global.drunk = 0;
			Global.redScore = 0;
		}
		
		
		// My function for sending the game to the shell state
		public function playAgain( button:ButtonPure ):void
		{
			State.current = new ShellState();
		}
		
		
		// My function for sending the game to the credits state
		public function viewCredits( button:ButtonPure ):void
		{
			State.current = new CreditsState();
		}
	}
}