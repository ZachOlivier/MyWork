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
	
	public class CreditsState implements IState
	{
		public var tf:TextField;
		
		public var cocktailParty:Bitmap = new Resources.CocktailParty;
		
		
		// Don't add to this CTOR
		public function CreditsState()
		{
		}
		
		
		// When the game changes to this state, add this once
		public function start():void
		{
			Systems.sound.play( Resources.GameMusic );
			
			// Add the cocktail party bitamp to the display and center it but make it invisible
			Display.ui.addChild( cocktailParty );
			center( cocktailParty );
			cocktailParty.visible = false;
			
			// Create my text fields, place them and add them to the display
			tf = maketf();
			tf.text = "Thank You For Playing Cocktail Craving!";
			tf.x = 65;
			tf.y = 10;
			Display.ui.addChild( tf );
			
			tf = maketf();
			tf.text = "  This Was Created By Zach Olivier";
			tf.x = 100;
			tf.y = 70;
			Display.ui.addChild( tf );
			
			// Create my button, place it and add it to the display
			var button:Sprite = makeButton( "    Restart Game", clickPlay );
			button.x = 250;
			button.y = Display.height - 65;
			Display.ui.addChild( button );
		}
		
		
		// Constantly update this state until the game changes states
		public function update():void
		{
			// Move the textfield down screen
			tf.y += 5;
			
			// If the text field's y position is greater than 480
			if ( tf.y > 480 )
			{
				// Stop the text field and show the cocktail party bitmap
				tf.y -= 5;
				cocktailParty.visible = true;
			}
		}
		
		
		// When the game goes to a new state
		public function end():void
		{
			// Clear the display
			Display.clear();
			
			// Stop the music
			Systems.sound.stop( Resources.GameMusic );
		}
		
		
		// My function for sending the game to the intro state
		public function clickPlay( button:ButtonPure ):void
		{
			State.current = new IntroState();
		}
	}
}